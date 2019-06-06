<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<script>
function FillBilling(f) {
  if(f.billingtoo.checked == true) {
    f.correspondence_area.value = f.permanent_area.value;
    f.correspondence_district.value = f.permanent_district.value;
    f.correspondence_city.value = f.permanent_city.value;
    f.correspondence_state.value = f.permanent_state.value;
  }
}
</script>   
</head>
<body>
   
    <jsp:include page="header.jsp"></jsp:include>
   <section class="hero-section overlay bg-cover" data-background="images/formbackground.jpg" style="padding-bottom:50px" >
    


        <div class="main"style="margin:10px 300px 0px 300px">

        <div class="container" >
            <div class="signup-content">
                <div class="signup-form">
                    <form method="POST" enctype="" class="register-form" id="register-form" action="UIDapplicationformaction.jsp" style="margin:5px 0px 5px 0px">
                        <div class="form-row">
                            <div class="form-group" style="width:90%; padding-left:50px">
                                <div class="form-input">
                                    <label for="name" class="required">Name</label>
                                    <input type="text" name="name" id="name" required/>
                                </div>
                                <div class="form-input">
                                    <label for="father_name" class="required">Father name</label>
                                    <input type="text" name="father_name" id="father_name" required/>
                                </div>
                                <div class="form-input">
                                    <label for="mother_name" class="required">Mother name</label>
                                    <input type="text" name="mother_name" id="mother_name" required/>
                                </div>
                                <div class="form-input">
                                    <label for="birth_date" class="required">Birth date</label>
                                    <input type="date" name="birth_date" id="birth_date" placeholder="MM-DD-YYYY" required/>
				</div>
				<div class="form-radio">
                                    <div class="label-flex">
                                        <label for="gender" class="required">Gender</label>
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="male" value="male">
                                            <label for="male">Male</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="female" value="female">
                                            <label for="female">Female</label>
                                            <span class="check"></span>
                                        </div>
										<div class="form-radio-item">
                                            <input type="radio" name="gender" id="other" value="other">
                                            <label for="other">Other</label>
                                            <span class="check"></span>
                                        </div>
									</div>	
								</div>
								
								<div class="form-radio">
                                    <div class="label-flex">
                                        <label for="location" class="required">Location</label>
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <input type="radio" name="location" id="urban" value="urban">
                                            <label for="urban">Urban</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="location" id="rural" value="rural">
                                            <label for="rural">Rural</label>
                                            <span class="check"></span>
                                        </div>
									</div>	
								</div>
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="text" name="email" id="email" />
                                </div>
                                
                                
                                <div class="form-input">
                                    <label for="blood_group" >Blood Group</label>
                                    <input type="text" name="blood_group" id="bloodgroup" />
                                </div>
                          
                                <div class="form-input">
                                    <label for="phone_number" >Phone number</label>
                                    <input type="text" name="phone_number" id="phone_number" />
                                </div>
                               
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="category">Category</label>
                                      <!-- <a href="#" class="form-link">Payment Detail</a>-->
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <input type="radio" name="category" id="st" value="st/sc">
                                            <label for="st">ST / SC</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="category" id="obc" value="obc">
                                            <label for="obc">OBC</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="category" id="gen" value="gen">
                                            <label for="gen">Gen</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>
                                </div>
                               <!-- <div class="form-input">
                                    <label for="address">Address</label>
                                    <input type="text" name="address" id="address" />
                                </div>-->
								<div class="label-flex">
                                        <label for="address"><h3>Residential details</h3></label>
                                      <!-- <a href="#" class="form-link">Payment Detail</a>-->
                                    </div>
                                <div class="form-input">
                                    <label for="permanent_address" >Permanent Address</label>
                                     <label for="permanent_area" class="required">Area</label>
                                     <input type="text" name="permanent_area" id="permanent_area" required/>
                                     <label for="permanent_district" class="required">District</label>
                                    <input type="text" name="permanent_district" id="permanent_district" required/>
                                    <label for="permanent_city" class="required">City</label>
                                    <input type="text" name="permanent_city" id="permanent_city" required/>
                                    <label for="permanent_state" class="required">State</label>
                                    <input type="text" name="permanent_state" id="permanent_state" required/>
                                </div>
                                <div class="form-input">
                                    <input type="checkbox" name="billingtoo" onclick="FillBilling(this.form)" style="margin-left: 180px;margin-top: 30px">
                                    <label for="billingtoo">Permanent Address is same as Correspondance Address</label>
                                    
                                </div>			
				<div class="form-input">
                                    <label for="correspondence_address">Correspondence Address</label>
                                                                     
                                     <label for="correspondence_area">Area</label>
                                     <input type="text" name="correspondence_area" id="correspondence_area" />
                                     <label for="correspondence_district">District</label>
                                    <input type="text" name="correspondence_district" id="correspondence_district" />
                                    <label for="correspondence_city">City</label>
                                    <input type="text" name="correspondence_city" id="correspondence_city" />
                                    <label for="correspondence_state">State</label>
                                    <input type="text" name="correspondence_state" id="correspondence_state" />
                                </div>
                                
								<div class="form-input">
                                    <label for="qualification" class="required">Highest Qualification</label>
                                    <input type="text" name="qualification" id="qualification" required/>
                                </div>
								
								<div class="form-input">
                                    <label for="occupation" class="required">Occupation</label>
                                    <input type="text" name="occupation" id="occupation" required/>
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
   