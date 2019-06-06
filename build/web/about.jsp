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
<section class="page-title-section overlay" style="height: 600px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">
          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="courses.jsp" style="font-size:90px">About UIDAI</a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
        <p class="text-lighten" style="font-size: 25px">Know more about Unique Identification Authority, its legal framework and, organized structure.</p>
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
            <h2 class="section-title">UIDAI</h2>
          <p>UIDAI is created with the objective to issue Unique Identification numbers (UID) to all residents of India that is (a) robust enough to eliminate duplicate and fake identities, and (b) can be verified and authenticated in an easy, cost-effective way. UIDAI is responsible for UID number enrolment and authentication, including operation and management of all stages of UID card life cycle, developing the policy, procedure and system for issuing UID numbers to individuals and perform authentication and also required to ensure the security of identity information and authentication records of individuals.</p>
          <p><b>Vision</b></br>To empower residents of India with a unique identity and a digital platform to authenticate anytime, anywhere.</p>
          <p><b>Mission</b></br>To provide for good governance, efficient, transparent and targeted delivery of subsidies, benefits and services, the expenditure for which is incurred from the Consolidated Fund of India, to residents of India through assigning of unique identity numbers.
            To develop policy, procedure and system for issuing UID number to residents of India, who request for same by submitting their demographic information and biometric information by undergoing the process of enrolment.
            To develop policy, procedure and systems for UID card holders for updating and authenticating their digital identity.
            Ensure availability, scalability and resilience of the technology infrastructure.
            Build a long term sustainable organization to carry forward the vision and values of the UIDAI.
            To ensure security and confidentiality of identity information and authentication records of individuals.
            </p>
          <p><b>Core Values</b></br>We believe in facilitating good governance, value integrity, committed to inclusive nation building, pursue a collaborative approach and value our partners. We will strive towards excellence in services to residents and service providers, always focus on continuous learning and quality improvements. We are driven by innovation and provide a platform for our partners to innovate. We believe in a transparent and open organization.</p>
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
