<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.* , java.io.*" %>

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
//String proofpath = "G:\\\\Java\\UIDAIProject\\UIDAI(may7)\\web\\userimages\\";
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
    String userid = (String)session.getAttribute("userId");
    MyDatabase mdb=new MyDatabase(application);
    //String proof_id = (String)session.getAttribute("proof_id");
    int n = mdb.proofUpload(files,userid);

        if(n==1)
            {  
                       
    %>         
    <jsp:forward page="generateUID.jsp" /> 
    <%             
            }
            else
            {
                out.println("Problem in File Upload.");
                %>
                <jsp:forward page="proofupload.jsp" />
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