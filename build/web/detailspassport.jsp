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
                    <form name="form" onsubmit="return insertDetails();" method="POST" class="register-form" action ="detailspassportaction.jsp" id="register-form" style="margin:5px 0px 5px 0px">
                        <div class="form-row">
                            <div class="form-group" style="width:90%; padding-left:50px">
                                
                                
                                 <div class="form-input">
                                    <label for="uidai_no" class="required">UIDAI no</label>
                                    <input type="text" name="uidai_no" id="uidai_no" required/>
                                </div>
                                <div class="form-input">
                                    <label for="passport_number" class="required">Passport Number</label>
                                    <input type="text" name="passport_number" id="passport_number" required/>
                                </div>
                                <div class="form-input">
                                    <label for="place_of_issue" class="required">Place Of Issue</label>
                                    <input type="text" name="place_of_issue" id="place_of_issue" required/>
                                </div>
                                <div class="form-input">
                                    <label for="birth_date" class="required">Birth Date</label>
                                    <input type="date" name="birth_date" id="birth_date" placeholder="MM-DD-YYYY" required/>
				</div>
                                 <div class="form-input">
                                    <label for="place_of_birth" class="required">Place Of Birth</label>
                                    <input type="text" name="place_of_birth" id="place_of_birth" required/>
                                </div>
                                <div class="form-input">
                                    <label for="passport_issue_date" class="required">Passport Issue Date</label>
                                    <input type="date" name="passport_issue_date" id="passport_issue_date" placeholder="MM-DD-YYYY" required/>
				</div>
                                <div class="form-input">
                                    <label for="passport_expiry_date" class="required">Passport Expiry Date</label>
                                    <input type="date" name="passport_expiry_date" id="passport_expiry_date" placeholder="MM-DD-YYYY" required/>
				</div>
                                
                        
                            </div>
                        </div>
               			  <div class="form-submit">
						<center>
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
                        </center>
						</div>
                    </form>
					</div>
                </div>
<script>
    function insertDetails() { 
        alert ("Details inserted successfully");
        return true;
    }
</script>            
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
   