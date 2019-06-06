<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.* , java.io.*" %>

<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%
   int count=0; 
   String fname="";
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
  
 //String filePath = "C:\\\\Users\\LOGIN\\Documents\\NetBeansProjects\\JSPFileUpload\\uploads"
//String filePath = "G:\\\\Java\\UIDAIProject\\\\UIDAI(final)\\web\\userimages\\";
    String filePath = "D:\\\\New Folder\\UIDAI(final)\\web\\userimages\\";        
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
        
        File[] files = new File[2];
        String[] filenames = new String[2];
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
            System.out.println("fieldName: " + fieldName + "\tfileName: " + fileName);
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file  C:\Users\LOGIN\Desktop\Capture.PNG
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            System.out.println("filepath, name: " + filePath + "\t" + fileName+"aaaaaaaaaaaaaaaaaaa");
            
            if(!fileName.equals("")){
                fi.write( file ) ;
                files[c] = file;
            }else{
                files[c]=null;
            }
            
            filenames[c] = fileName;
            
            
            c++;
            }
         }
            try
{
    String userid = request.getParameter("user_id");
    String photo[] = new String[2];
    
    MyDatabase mdb=new MyDatabase(application);
    String uidai_no = (String)session.getAttribute("uidai_no");
    ResultSet rst = mdb.getPath(uidai_no);
    if(rst.next())
    {
        String pathpicture= rst.getString("photo");
        String pathsignature= rst.getString("signature");
        photo = new String[]{pathpicture, pathsignature};
        System.out.println("photo : " + photo[0]);
    }    
    
    int n=mdb.photoUploadUpdate(files,userid,photo);      
            if(n==1)
            {  
                       
    %>         
    <jsp:forward page="proofuploadupdate.jsp" /> 
    <%             
            }
            else
            {
                out.println("Problem in File Upload.");
            }
}                  

catch(Exception ex)
   {
     System.err.println(ex);
     out.println(ex);
ex.printStackTrace();

}
         }
         catch(Exception ex) {
            ex.printStackTrace();
         System.out.println(ex);
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