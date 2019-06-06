<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
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
                <div class="signup-form">
                    
<%
    String uidai_no = request.getParameter("uidai_no");
    String date_of_birth = request.getParameter("date_of_birth");
            
    MyDatabase mdb = new MyDatabase(application);            
    ResultSet rst = mdb.viewDetails(uidai_no, date_of_birth);
    if(rst.next())
    { 
        String name = rst.getString("user_name");
        String father_name = rst.getString("father_name");
        String mother_name = rst.getString("mother_name");
        String phone_no = rst.getString("phone_no");
        String blood_group = rst.getString("blood_group");
        String paddress = rst.getString("permanent_address");
        String caddress = rst.getString("correspondence_address");
        String email = rst.getString("Email");
        String occupation = rst.getString("occupation");
        String qualification = rst.getString("qualification");
        String gender = rst.getString("gender");
        String region = rst.getString("region");
        String category = rst.getString("category");
        String photo = rst.getString("photo");
        String signature = rst.getString("signature");
        
        session.setAttribute("uidai_no", uidai_no);
        session.setAttribute("date_of_birth", date_of_birth);
%>                    
                    
                    <form method="POST" class="register-form" id="register-form" action="UIDupdateformaction.jsp?photo=<%= photo %>&signature=<%= signature %>" style="margin:5px 0px 5px 0px">
                        <div class="form-row">
                            <div class="form-group" style="width:90%; padding-left:50px">
                                <div class="form-input">
                                    <label for="name" class="required">Name</label>
                                    <input type="text" name="name" id="name" value="<%= name %>"/>
                                </div>
                                <div class="form-input">
                                    <label for="father_name" class="required">Father name</label>
                                    <input type="text" name="father_name" id="father_name" value="<%= father_name %>"/>
                                </div>
                                <div class="form-input">
                                    <label for="mother_name" class="required">Mother name</label>
                                    <input type="text" name="mother_name" id="mother_name" value="<%= mother_name %>"/>
                                </div>
                                <div class="form-input">
                                    <label for="birth_date" class="required">Birth date</label>
                                    <input type="date" name="birth_date" id="birth_date" placeholder="MM-DD-YYYY" value="<%= date_of_birth %>"/>
				</div>
				<div class="form-radio">
                                    <div class="label-flex">
                                        <label for="gender" class="required">Gender</label>
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <%
                                                if(gender.equals("male"))
                                                {
                                            %>
                                            <input type="radio" name="gender" id="male" value="male" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="gender" id="male" value="male">
                                            <%
                                                }
                                            %>
                                            <label for="male">Male</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <%
                                                if(gender.equals("female"))
                                                {
                                            %>
                                            <input type="radio" name="gender" id="female" value="female" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="gender" id="female" value="female">
                                            <%
                                                }
                                            %>
                                            <label for="female">Female</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <%
                                                if(gender.equals("other"))
                                                {
                                            %>
                                            <input type="radio" name="gender" id="other" value="other" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="gender" id="other" value="other">
                                            <%
                                                }
                                            %>
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
                                            <%
                                                if(region.equals("urban"))
                                                {
                                            %>
                                            <input type="radio" name="location" id="urban" value="urban" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="location" id="urban" value="urban">
                                            <%
                                                }
                                            %>
                                            <label for="urban">Urban</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <%
                                                if(region.equals("rural"))
                                                {
                                            %>
                                            <input type="radio" name="location" id="rural" value="rural" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="location" id="rural" value="rural">
                                            <%
                                                }
                                            %>
                                            <label for="rural">Rural</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>	
                                </div>
                                <div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="text" name="email" id="email" value="<%= email %>"/>
                                </div>                                
                                <div class="form-input">
                                    <label for="blood_group" class="required">Blood Group</label>
                                    <input type="text" name="blood_group" id="bloodgroup" value="<%= blood_group %>"/>
                                </div>                         
                                <div class="form-input">
                                    <label for="phone_number" class="required">Phone number</label>
                                    <input type="text" name="phone_number" id="phone_number" value="<%= phone_no %>"/>
                                </div>                               
                                <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="category">Category</label>
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <%
                                                if(category.equals("st/sc"))
                                                {
                                            %>
                                            <input type="radio" name="category" id="st" value="st/sc" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="category" id="st" value="st/sc">
                                            <%
                                                }
                                            %>
                                            <label for="st">ST / SC</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <%
                                                if(category.equals("obc"))
                                                {
                                            %>
                                            <input type="radio" name="category" id="obc" value="obc" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="category" id="obc" value="obc">
                                            <%
                                                }
                                            %>
                                            <label for="obc">OBC</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <%
                                                if(category.equals("gen"))
                                                {
                                            %>
                                            <input type="radio" name="category" id="gen" value="gen" checked>
                                            <%
                                                }
                                                else
                                                {
                                            %>
                                            <input type="radio" name="category" id="gen" value="gen">
                                            <%
                                                }
                                            %>                                           
                                            <label for="gen">Gen</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>
                                </div>                       
				<div class="label-flex">
                                    <label for="address"><h3>Residential details</h3></label>
                                </div>
                                <div class="form-input">
                                    <label for="permanent_address">Permanent Address</label>
                                    <input type="text" name="permanent_address" id="permanent_address" value="<%= paddress %>"/>
                                </div>								
				<div class="form-input">
                                    <label for="correspondence_address">Correspondence Address</label>
                                    <input type="text" name="correspondence_address" id="correspondence_address" value="<%= paddress %>"/>
                                </div>                                
        			<div class="form-input">
                                    <label for="qualification" class="required">Highest Qualification</label>
                                    <input type="text" name="qualification" id="qualification" value="<%= qualification %>"/>
                                </div>								
        			<div class="form-input">
                                    <label for="occupation" class="required">Occupation</label>
                                    <input type="text" name="occupation" id="occupation" value="<%= occupation %>"/>
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

<%
    } else {
%>
<jsp:forward page="userupdatelogin.jsp" />
<%
}
%>

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
   