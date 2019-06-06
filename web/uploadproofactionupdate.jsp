<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.* , java.io.*" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="databasepackage.MyDatabase"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="mailer.SendMail"%>


<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<% 
   String fname="";
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
  
 //String filePath = "C:\\\\Users\\LOGIN\\Documents\\NetBeansProjects\\JSPFileUpload\\uploads"
String proofpath = "D:\\\\New Folder\\UIDAI(final)\\web\\userimages\\";        
//String proofpath = "G:\\\\Java\\UIDAIProject\\\\UIDAI(final)\\web\\userimages\\";
// Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) 
   {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try
      { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

        /*
                out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
                */
        
         File[] files = new File[6];
        String[] filenames = new String[6];
        int c=0;
        
        while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
             System.out.println("FileItem: "+fi);
            if(fi.isFormField())
            {
                String fieldName=fi.getFieldName();
                String fieldValue=fi.getString();
                System.out.println(fieldName+" : "+fieldValue);
                if("fname".equals(fieldName))
                   fname=fieldValue;                 
            }
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
           
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file  C:\Users\LOGIN\Desktop\Capture.PNG
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( proofpath + 
            fileName.substring( fileName.lastIndexOf("\\")));
            }else{ 
                 if(fileName.equals(""))
                        {
                            file =new File ("null");
                            fileName="null";
                        }
                   else {
                        file = new File( proofpath + 
                        fileName.substring(fileName.lastIndexOf("\\")+1));
                        }
            }
            System.out.println(file);
            System.out.println(fileName);
            try{
            fi.write( file );
            }catch(Exception ex)
            {
                ex.printStackTrace();
                fileName = null;
                file = null;
            }
            
            filenames[c] = fileName;
            
            files[c] = file;
            c++;
            }
         }
            try
{
    MyDatabase mdb=new MyDatabase(application);
    String userid = (String)session.getAttribute("userId");
    String uidai_no = (String)session.getAttribute("uidai_no");
    
    ResultSet rst1 = mdb.getProofPath(uidai_no);
    String proof[] = new String[6];
        if(rst1.next())
        {
            String adhaar_card = rst1.getString("adhaar_card");
            String matric_certificate = rst1.getString("matric_certificate");
            String passport = rst1.getString("passport");
            String pan_card = rst1.getString("pan_card");
            String license = rst1.getString("license");
            String category_certificate = rst1.getString("category_certificate");
            String user_id = rst1.getString("user_id");
            session.setAttribute("userId", user_id);
                        
            proof = new String[]{adhaar_card, matric_certificate, passport, pan_card, license, category_certificate};
        }

    int n = mdb.proofUploadUpdate(files,userid,proof);
        System.out.println("n : " + n);
        if(n!=-1)
            { 
    %>         
    <jsp:forward page="updateEmail.jsp" /> 
    <%      
            }
            else
            {
                //System.out.println("Problem in File Upload.");
                %>
                <jsp:forward page="proofuploadupdate.jsp" />
                <%
            }
}                  

catch(Exception ex)
   {
     System.err.println(ex);
ex.printStackTrace();
     out.println(ex);

}
         }
         catch(Exception ex) {
         System.out.println(ex);
ex.printStackTrace();
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }

  
    %>                                                           