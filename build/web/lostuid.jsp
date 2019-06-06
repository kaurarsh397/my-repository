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
        <title>JSP Page</title>
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

  <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="loginimages/icons/favicon.ico"/>
<!--===============================================================================================-->
	<!--<link rel="stylesheet" type="text/css" href="loginvendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginfont/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginfont/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginvendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginvendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginvendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginvendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginvendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="logincss/util.css">
	<link rel="stylesheet" type="text/css" href="logincss/main.css">
<!--===============================================================================================-->
  
    </head>
    <body>
        <jsp:include page="header.jsp" ></jsp:include>
                     
        <div class="limiter" >
		<div class="container-login100" style="margin-top:180px;background-color:#ffe8a1">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(loginimages/bg-01.jpg);">
					<span class="login100-form-title-1">
						Personal Detail
					</span>
				</div>
<%
                        String name = null;
                        String email = null;
                        
                        name = request.getParameter("name");
                        email = request.getParameter("email");
                        System.out.println("lostuid "+ name +"    "+ email);
                        if( name==null && email==null)
                        {   
                            String button="getotp";
                            session.setAttribute("button",button);
%>                          		
                            <form class="login100-form validate-form" action="SendMailAction.jsp?button=getotp" >
					<div class="wrap-input100 validate-input m-b-26" data-validate="fullname is required">
						<span class="label-input100">Full Name</span>
						<input class="input100" type="text" name="fullname" placeholder="Enter full name">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "email is required">
						<span class="label-input100">Email</span>
						<input class="input100" type="email" name="email" placeholder="Enter email">
						<span class="focus-input100"></span>
					</div>

				<div class="container-login100-form-btn">
                                    <input class="login100-form-btn" type="submit" value="Get OTP">
							
						
					</div>
                                </form>    
<%                        
                        }
                        else
                        {  
                       
%>                                
                                <form class="login100-form validate-form" action="SendMailAction.jsp" style="padding-bottom: 40px">
					<div class="wrap-input100 validate-input m-b-26" data-validate="fullname is required">
						<span class="label-input100">Full Name</span>
						<input class="input100" type="text" name="fullname" value=<%=name%> placeholder="Enter full name">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "email is required">
						<span class="label-input100">Email</span>
						<input class="input100" type="email" name="email" value=<%= email %> placeholder="Enter email">
						<span class="focus-input100"></span>
					</div>

                                        <div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Get OTP
						</button>
					</div>
                                </form>  

        <%                  String button="submitotp";
                            session.setAttribute("button",button);  
                             String otp1=request.getParameter("otp");
        %>           
                                                
                                <form class="login100-form validate-form" action="SendMailAction.jsp?name=<%= name %>&email=<%= email %>" style="padding-top: 0px">    
                                        <div class="wrap-input100 validate-input m-b-26" >
						<span class="label-input100">Enter OTP</span>
						<input class="input100" type="number" name="otp" placeholder="Enter OTP">
                                                <input type="hidden" name="email" value="<%= email %>"/>
                                                <input type="hidden" name="fullname" value="<%= name %>"/>
                                                 <input type="hidden" name="otp1" value="<%= otp1 %>"/>
						<span class="focus-input100"></span>
					</div>
                                        <div class="container-login100-form-btn">
                                            <input type="submit" class="login100-form-btn" value="Submit"/>
                                            
                                            
					</div>
                                                
				</form>
<%                                
                        }
%>
			</div>
		</div>
	</div>

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

<!--===============================================================================================-->
	<script src="loginvendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="loginvendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="loginvendor/bootstrap/js/popper.js"></script>
	<script src="loginvendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="loginvendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="loginvendor/daterangepicker/moment.min.js"></script>
	<script src="loginvendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="loginvendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="loginjs/main.js"></script>


    </body>
</html>
