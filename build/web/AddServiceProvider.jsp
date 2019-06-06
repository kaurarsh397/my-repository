<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <%
  
 String problem=request.getParameter("problem");
  System.out.println("error "+problem);
%>
	<div class="bg-contact3" style="background-image: url('images/bg-01.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact3"  style="margin-top: 40px">
				<form class="contact3-form validate-form" action="AddServiceProviderAction.jsp" method="post" >
					<span class="contact3-form-title">
                                                Add Service Provider
					</span>
					

					<div class="wrap-input3 validate-input" data-validate="Name is required">
						<input class="input3" type="text" name="name" placeholder="SP Name">
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input3" type="text" name="email" placeholder="SP Email">
						<span class="focus-input3"></span>
					</div>
                                        <div class="wrap-input3 validate-input" data-validate="City is required">
						<input class="input3" type="text" name="city" placeholder="SP City">
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 validate-input" data-validate="Username is required">
						<input class="input3" type="text" name="username" placeholder="SP Name">
						<span class="focus-input3"></span>
					</div>
                                        
                                        <div class="wrap-input3 validate-input" data-validate="Password is required">
						<input class="input3" type="password" name="password" placeholder="SP password">
						<span class="focus-input3"></span>
					</div>
                                           <% if(problem!=null && problem.equals("true")){ %>
                                           <center>
                                        <h6 style="color:red">something went wrong!<br/>please try again to add provider</h6>
                                        </center>   
                                        <%   }
                                            else if(problem!=null && problem.equals("false"))
                                                {
                                               %>
                                               <center>
                                        <h6 style="color:purple">provider added sucessfully!<br/>add another provider</h6>
					 <%   }  %>
                                           </center>
					<div class="container-contact3-form-btn">
                                            <center>
						<input type="submit" class="contact3-form-btn" value="Add Provider"/>
                                                </br>
                                                <a href="AdminPage.jsp" ><input type="button" class="contact3-form-btn" value="Go back" /></a>
                                            </center>
                                        </div>
                                           
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>
