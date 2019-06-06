<%-- 
    Document   : passwordchange
    Created on : May 7, 2019, 12:16:56 PM
    Author     : DELL
--%>

<!DOCTYPE html>
<html lang="zxx">

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
    


    <div class="main"style="margin:10px 300px 0px 300px">

        <div class="container" >
            <div class="signup-content">
                <!--<div class="signup-img">
                    <!--<img src="images/form-img.jpg" alt="">-->
                    <!--<div class="signup-img-content">
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>
					
                </div>-->
                <div class="signup-form">
                    <form method="POST" class="register-form" action="passwordchangeaction.jsp" id="register-form" style="margin:5px 0px 5px 0px">
                        <div class="form-row">
                            <div class="form-group" style="width:90%; padding-left:50px">
                                
                                
                                 <div class="form-input">
                                    <label for="uidai_no" class="required">UIDAI no</label>
                                    <input type="text" name="uidai_no" id="uidai_no" />
                                </div>
                                 <div class="form-input">
                                    <label for="old_password" class="required">Old Password</label>
                                    <input type="password" name="old_password" id="old_password" />
                                </div>
                                 <div class="form-input">
                                    <label for="new_password" class="required">New Password</label>
                                    <input type="password" name="new_password" id="new_password" />
                                </div>                                
                                     <div class="form-input">
                                    <label for="confirm_new_password" class="required">Confirm New Password</label>
                                    <input type="password" name="confirm_new_password" id="confirm_new_password" />
                                </div>                                 
                            </div>
                        </div>
               			  <div class="form-submit">
						<center>
                            <input type="submit" value="Submit" class="submit" id="submit" name="change password" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
                        </center>
						</div>
                    </form>
					</div>
                </div>
            </div>
        </div>

   
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
   