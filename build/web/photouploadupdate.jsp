<%-- 
    Document   : uploadphotoactionupdate
    Created on : May 15, 2019, 8:01:16 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  
   <!-- Font Icon -->
    <link rel="stylesheet" href="UIDapplicationformfonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="UIDapplicationvendor/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="UIDapplicationformcss/style.css">

</head>
 <body>
<jsp:include page="header.jsp"></jsp:include>
    
    <section class="hero-section overlay bg-cover" data-background="images/formbackground.jpg" style="padding-bottom:50px" >
    <section class="section-sm">      
        <div class="row justify-content-center">  
            <div class="col-lg-4 col-sm-10 mb-10" >
                <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
                    <div class="card-body">
          
<%
    String uidai_no = (String)session.getAttribute("uidai_no");
    System.out.println(uidai_no+ " : uidai_no");
    MyDatabase mdb = new MyDatabase(application);  
    //String pathpicture=null;
    //String pathsignature=null;
    ResultSet rst = mdb.getPath(uidai_no);
    if(rst.next())
    {
        String pathpicture= rst.getString("photo");
        System.out.println(pathpicture + " : photo");
        String pathsignature= rst.getString("signature");
        
        String user_id = rst.getString("user_id");
    
    //pathpicture = (String)session.getAttribute("pathpicture");
    //pathsignature = (String)session.getAttribute("pathsignature");
    System.out.println(pathpicture + "  out  " + pathsignature);
    if(pathpicture != null && pathsignature!=null)
    {    
      
        pathpicture = pathpicture.replaceAll("\\\\","/");
        pathsignature = pathsignature.replaceAll("\\\\","/");
        System.out.println(pathpicture + "  in   " + pathsignature);
    
%>   

   <form name="form" action="uploadphotoactionupdate.jsp?user_id=<%= user_id %>" method="post" enctype="multipart/form-data"  style="height: 550px">
        Your picture: 
        <center>
        <div style=" height: 140px; width: 60%">
            <img src="<%=pathpicture%>"style="height: 150px; width: 40%; object-fit: fill"/></br>
    Choose picture to Update: <input type="file" name="pathpicture" value="<%=pathpicture%>"/><br/></br>
         </div>
          </center>
   </br></br></br></br></br>
        Your signature:
        <center>
          <div style=" height: 80px; width: 70%;">
              <img src="<%=pathsignature%>"style="height: 80px; width: 70%;object-fit: contain"/></br>
        Choose signature to Update: <input type="file" name="pathsignature" value="<%=pathsignature%>"/><br/> 
        </div>
        </center>
        </br></br></br>
      <center>
      </br>
         <input type="submit" value="Save & Next" class="submit" id="submit" name="submit" />
      </center>    
    </form>
<%
            }
else {
%>
<form name="form" action="uploadphotoactionupdate.jsp?user_id=<%= user_id %>" method="post" enctype="multipart/form-data"  style="height: 550px">
        
    Choose picture to Update: <input type="file" name="pathpicture" /><br/></br>
         
  
        
        Choose signature to Update: <input type="file" name="pathsignature" /><br/> 
        
        
      <center>
      </br>
         <input type="submit" value="Save & Next" class="submit" id="submit" name="submit" />
      </center>    
    </form>
<%
}   }
%>

   </section>
   </section>
<jsp:include page="footer.jsp"></jsp:include>   
    <!-- JS -->
    <script src="UIDapplicationvendor/jquery/jquery.min.js"></script>
    <script src="UIDapplicationvendor/nouislider/nouislider.min.js"></script>
    <script src="UIDapplicationvendor/wnumb/wNumb.js"></script>
    <script src="UIDapplicationvendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="UIDapplicationvendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="UIDapplicationjs/main.js"></script>
     
<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- mixitup filter -->
<script src="plugins/mixitup/mixitup.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>
</body>
</html>