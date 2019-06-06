<%-- 
    Document   : about
    Created on : 10 Apr, 2019, 9:47:10 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About UIDAI</title>
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
<section class="page-title-section overlay" style="height: 500px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="courses.jsp" style="font-size:70px">Privacy Policy</a></li>
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
            <h2 class="section-title">Privacy Policy</h2>
            <p><b>Site Visit Data</b></br>UIDAI Website does not automatically capture any specific personal information from you, (like name, phone number or e-mail address), that allows us to identify you individually.</br>This website records your visit and logs the following information for statistical purposes, such as Internet protocol (IP) addresses, domain name, server's address; name of the top-level domain from which you access the Internet (for example, .gov, .com, .in, etc.), browser type, operating system, the date and time of the visit, the pages you have accessed, the documents downloaded and the previous Internet address from which you linked directly to the site. We make no attempt to link these addresses with the identity of individuals visiting our site unless an attempt to damage the site has been detected. We will not identify users or their browsing activities, except when a law enforcement agency may exercise a warrant to inspect the service provider's logs.</br>If the UIDAI Website requests you to provide personal information, you will be informed for the particular purposes for which the information is gathered and adequate security measures will be taken to protect your personal information. UIDAI does not sell or share any personally identifiable information volunteered on the UIDAI Website to any third party (public/private). Any information provided to this website will be protected from loss, misuse, unauthorized access or disclosure, alteration, or destruction.</p>
            <p><b>Cookies</b></br>A cookie is a piece of software code that an Internet website sends to your browser when you access information in that site. This site does not use cookies.</p>
            <p><b>E-mail Management</b></br>Your e-mail address will only be recorded if you choose to send a message. It will only be used for the purpose for which you have provided it and will not be added to a mailing list. Your e-mail address will not be used for any other purpose, and will not be disclosed without your consent.</p>
            <p><b>Collection Of Personal Information</b></br>If you are asked for any other Personal Information you will be informed how it will be used if you choose to give it. If at any time you believe the principles referred to in this privacy statement have not been followed, or have any other comments on these principles, please notify the Web Information Manager by sending email to webadmin-uidai@nic.in.</br>Note: The use of the term "Personal Information" in this privacy statement refers to any information from which your identity is apparent or can be reasonably ascertained.</p>
            <p><b>Reasonable Security Practices</b></br>Reasonable security measures such as administrative, technical, operational and physical controls have been implemented to ensure the security of personal information, if collected.</p>
        </div>
      </div>
    </div>
  </div>
</section>
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
