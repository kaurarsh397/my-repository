<%-- 
    Document   : about
    Created on : 10 Apr, 2019, 9:47:10 AM
    Author     : hp
--%>

<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>uidai</title>
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

    </head>
    <body>
        
<!-- /header -->        
        <jsp:include page="header.jsp" ></jsp:include>
<!-- /header -->
<!-- page title -->

<%
        String footerlink_id = request.getParameter("footerlink_id");
       
        MyDatabase mdb = new MyDatabase(application); 
        ResultSet rst = mdb.footer(footerlink_id);
        while(rst.next())
        {
            String footerpage_id = rst.getString("footerpage_id");
           
            ResultSet rst2 = mdb.footerpage(footerpage_id);
            while(rst2.next())
            {
               String page_name = rst2.getString("page_name");
               String page_heading1 = rst2.getString("page_heading1");
               String page_heading2 = rst2.getString("page_heading2");
               String page_description = rst2.getString("page_description");
%>  

<section class="page-title-section overlay" style="height: 500px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">          
        <ul class="list-inline custom-breadcrumb">
         <li class="list-inline-item"><a class="h2 text-primary font-secondary" style="font-size:90px"><%= page_name %></a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
      </div>
    </div>
    </div>
    </center>     
</section>
<!-- /page title -->
<!-- success story -->
<section class="section bg-cover" data-background="images/backgrounds/success-story.jpg">
  <div class="container" >
    <div class="row" style="width: 2000px; margin-left: 40px">
      <!--<div class="col-lg-6 col-sm-4 position-relative success-video">
        <a class="play-btn venobox" href="https://youtu.be/nA1Aqp0sPQo" data-vbtype="video">
          <i class="ti-control-play"></i>
        </a>
      </div>-->
      <div class="col-lg-6 col-sm-8">
        <div class="bg-white p-5">
            <h2 class="section-title"><%= page_heading2 %></h2>
          <p><%= page_description %></p>
        </div>
      </div>
    </div>
  </div>
</section>

<%
        }
    }
%>    

<!-- /success story -->

<jsp:include page="footer.jsp"></jsp:include>


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
