<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login Form</title>
	<meta charset="UTF-8">
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
                                                  View UID Holder
					</span>
				</div>
<%
    String org_id = request.getParameter("org_id"); 
%>
                            <form class="login100-form validate-form" method="post" action="viewbyorganisation.jsp?org_id=<%= org_id %>">
					<div class="wrap-input100 validate-input m-b-26" data-validate="UID is required">
						<span class="label-input100">UID Number</span>
						<input class="input100" type="text" name="uidai_no" placeholder="Enter UID Number">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Submit
						</button>
					</div>
				</form>
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