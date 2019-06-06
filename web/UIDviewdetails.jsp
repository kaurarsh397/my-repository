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



.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: black;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #007bff;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 10px;
  
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}




</style>
<!--===============================================================================================-->
</head>
<body>
    
    <%                               
    String uidai_no = request.getParameter("name");
    //String uidno=request.getParameter("viewUserName");
   
    String uidai_password = request.getParameter("password");
    String org_id= request.getParameter("organisation_id");
    
            String name=null;
    MyDatabase mdb = new MyDatabase(application);            
    ResultSet rst = mdb.viewMyUID(uidai_no, uidai_password);
    if(rst.next())
    { 
        name = rst.getString("user_name");
    System.out.println("name : " + name);
        
    }
    else
{
%>
                <jsp:forward page="loginform.jsp">
            <jsp:param name="notExist" value="true"></jsp:param>
            <jsp:param name="service_name" value="My Uid"></jsp:param>
        </jsp:forward>
                <%
}
    %>
        <div class="bg-contact3" style="background-image: url('images/bg-01.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact3"  style="width:1160px;background-image: url('images/bgg.png')">
                            


<div id="mySidenav" class="sidenav" style="background-color:#ffbc3b">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="javascript:detail(0,<%= uidai_no %>)">Personal</a>
  <a href="javascript:detail(1,<%= uidai_no %>)">Educational</a>
  <a href="javascript:detail(2,<%= uidai_no %>)">Banks</a>
  <a href="javascript:detail(7,<%= uidai_no %>)">Passport</a>
  <a href="javascript:detail(5,<%= uidai_no %>)">RTO</a>
  <a href="javascript:detail(8,<%= uidai_no %>)">Police</a>
  <a href="javascript:detail(4,<%= uidai_no %>)">Hospitals</a>
  <a href="javascript:detail(3,<%= uidai_no %>)">Income Tax</a>
  <a href="javascript:detail(6,<%= uidai_no %>)">Tour & Travel</a>
  <a href="javascript:detail(9,<%= uidai_no %>)">Property Tax</a>
  <a href="javascript:detail(10,<%= uidai_no %>)">Proofs</a>
</div>




<script language='javascript' type='text/javascript'>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "25px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}

function detail(org_id,uidai_no){
    var xhttp;
  
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  
  xhttp.open("GET", "adminAjax.jsp?org_id="+org_id+"&uid_no="+uidai_no, true);
  xhttp.send();
}
</script>
				
    
<!-- page title -->

<section class="page-title-section overlay" style="max-height: 600px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:200px ;margin-top: 50px">
    <div class="row">
      <div class="col-md-8">
          <center>   
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" Style="font-size: 30px">Welcome <%= name %></a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
          <p class="text-lighten" style="font-size: 15px">To your UID details</p></center>
      </div>
    </div>
    </div>
    </center>     
</section>
<!-- /page title -->
<!-- success story -->
<section class="section bg-cover" data-background="images/backgrounds/success-story.jpg">
  <div class="container" >
    <div class="row" style="width: 900px; margin-left: 0px">
      <div  id="main" class="col-lg-6 col-sm-8"style="width: 1000px; margin-right:20px">
        <div id="main"class="bg-white p-5"style="width:1000px; margin-right:20px">
           
               <div id="main">
  
  <span style="font-size:30px;cursor:pointer;margin-top: 0px" onclick="openNav()">&#9776;View Details</span>
               <table style="width:100%;margin-left:0px" id="txtHint"></table>
               </div>
               
        </div>
      </div>
        </center>
					
  </div>
        <div class="container-contact3-form-btn">
                                            <center>                                                
                                                <a href="loginform.jsp?service_name=My UID&loginform_action=UIDviewdetails.jsp" ><input type="button" class="btn btn-primary" value="Go back" /></a>                                                
                                            </center>
        </div>
</section>
			</div>
		</div>
	


	<div id="dropDownSelect1"></div>
        </div>
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
