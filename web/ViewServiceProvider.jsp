<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
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
      <style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
    
	<div class="bg-contact3" style="background-image: url('images/bg-01.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact3"  style="margin-top: 40px;width:1000px">
				<form class="contact3-form validate-form" action="AddServiceProviderAction.jsp" method="post" >
                                    <div id="main"class="bg-white p-5"style="width:900px; margin-right:20px">
                                    <center><h4>Service Provider List</h4></center>
                                    <br/>
                                    
                                        <div class="wrap-input3 validate-input" >
                                                <table style="width:100%">
                                                    <tr>
                                                        <th>S.No.</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>City</th>
                                                        <th>Username</th>
                                                    </tr>	
                                    
                                    <%
                                        MyDatabase mdb=new MyDatabase(application);
                                        ResultSet rst=mdb.serviceProviderList();
                                        
                                        while(rst.next())
                                        {
                                            String pid=rst.getString("provider_id");
                                            String pname=rst.getString("provider_name");
                                            String pemail=rst.getString("provider_email");
                                            String pcity=rst.getString("provider_city");
                                            String pusername=rst.getString("provider_username");
                                    %>
                                    
                                            
                                                    <tr>
                                                        <td><%= pid %></td>
                                                        <td><%= pname %></td>
                                                        <td><%= pemail %></td>
                                                        <td><%= pcity %></td>
                                                        <td><%= pusername %></td>
                                                    </tr>
                                                
					
                                               
                                            <%
                                        }
                                        %>
				</table>
                                                
						<span class="focus-input3"></span>	
                                        </div>
			
                                 </center>
					<div class="container-contact3-form-btn">
                                            <center>
                                                <a href="AdminPage.jsp" ><input type="button" class="contact3-form-btn" value="Go back" /></a>
                                            </center>
                                        </div>
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
