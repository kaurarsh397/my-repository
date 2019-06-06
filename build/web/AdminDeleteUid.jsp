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
				<form class="contact3-form validate-form" action="AdminDeleteUidAction.jsp" method="post"  >
					<span class="contact3-form-title">
                                                Delete UID record
					</span>
					

					<div class="wrap-input3 validate-input" data-validate="UID no is required">
						<input class="input3" type="text" name="uid_no" placeholder="UID no">
						<span class="focus-input3"></span>
					</div>

					
                                           <% if(problem!=null && problem.equals("true")){ %>
                                           <center>
                                        <h6 style="color:red">something went wrong!<br/>please try again to delete UID record</h6>
                                        </center>   
                                        <%   }
                                            else if(problem!=null && problem.equals("false"))
                                                {
                                               %>
                                               <center>
                                        <h6 style="color:purple">record deleted successfully!<br/>delete another record</h6>
					 <%   }  %>
                                           </center>
					<div class="container-contact3-form-btn">
                                            <center>
						<input type="submit" class="contact3-form-btn" value="delete"/>
              
                                                <br>
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
