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
        <jsp:include page="header.jsp" ></jsp:include>
        
        
             
<!-- /header -->
<!-- page title -->
<section class="page-title-section overlay" style="height: 600px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">
          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="courses.jsp" style="font-size:90px">UID Services</a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
        <p class="text-lighten" style="font-size: 25px">An array of services for UID card holders.</p>
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
            <h2 class="section-title">Services</h2>
            <p><b>UID Number Verification</b></br>1. UID number can be verified whether it is an authentic document or a forged one.</br>
            2. Visit the UID Verification option in the UID Services section.</br>
            3. Enter the UID number and the security code.</br>
            4. Click on the verify button to check the authenticity of UID.</br>
            5. Verification results show whether UID number exists or not.</br>
            6. If the UID number is valid, other details are also displayed such as age band, gender, state and the last 3 digits of the registered mobile number.</br>
            7. It is not necessary to have mobile number linked with UID to avail this facility.</br>
            8. This feature allows common man to verify anyone’s UID details.</br>
            9. This facility can be used by landlords while renting houses, hotel owners for verifying guest details, various educational institutions, etc.</br>
            10. There is no limit on the number of UID details that a user can verify.</br></p>
            <p><b>Email/Mobile Number Verification</b></br>1. This facility allows you to check whether your mobile number or email address is mentioned in UID or not.</br>
            2. Your mobile number should be registered with UIDAI to avail this facility.</br>
            3. Nobody else can run this verification on your behalf.</br>
            4. You can either verify your mobile or email id at a time.</br>
            5. Select the “Verify Email/Mobile Number” option from the UID Services menu.</br>
            6. Enter your 12-digit UID number in the box provided.</br>
            7. Now enter either your mobile number or your email ID.</br>
            8. Enter the security code and click on “Get OTP”.</br>
            9. An OTP will be sent to your mobile number registered with UID.</br>
            10. Enter this OTP in the space provided and click on verify.</br>
            11. The result will be displayed whether your mobile number is linked with UID or not.</br>
            12. Also, if the number is registered, last 3 digits of the number will be displayed.</p>
            <p><b>Bank Account Linking Status</b></br>1. This facility allows you check the latest bank account linked with your UID.</br>
            2. In case you have not linked any bank account with UID, a message  will be displayed stating the fact.</br>
            3. You have to link your mobile number with UID before availing this facility.</br>
            4. The UID linking information is fetched from the NPCI server.</br>
            5. However, no information accessed from servers of NPCI is stored by UIDAI.</br>
            6. Click on the “Check UID & Bank Account Linking Status” to check the linking status online.</br>
            7. Enter your UID number and the security code.</br>
            8. Click on Send OTP to send an OTP to your registered mobile number.</br>
            9. Enter this OTP and click on the submit button.</br>
            10. The bank account linked with UID will be displayed on the screen.</p>
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
