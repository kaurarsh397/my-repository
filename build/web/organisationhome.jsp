<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Admin Page</title>

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

  <style>
body {
  font-family: "Lato", sans-serif;
}



.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #2196F3;
  display: block;
}

.sidenav a:hover {
  color: #064579;
}

.main {
  margin-left: 140px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
  
  
</head>

<body>
  
    <jsp:include page="header.jsp"></jsp:include>

<!-- page title -->
<section class="page-title-section overlay" style="height: 600px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary"  style="font-size:50px">Welcome to Organisations Home Page</a></li>        
        </ul>        
      </div>
    </div>
    </div>
    </center>     
</section>

<%
              String organisation_id=request.getParameter("organisation_id");
              //System.out.println("ORG ID : "+organisation_id);
              MyDatabase mdb=new MyDatabase(application);
              ResultSet rst=mdb.organisations();
              while(rst.next())
              {
                  String action=rst.getString("organisationloginform_action");
                  String org_id=rst.getString("organisation_id");
                  if(org_id.equals(organisation_id))
                  {
                      
              %>
              
<div class="row justify-content-center" data-background="images/about2.jpg">
     
  <!-- course item -->
  <div class="col-lg-4 col-sm-6 mb-5" >
    <div class="card p-0 border-primary rounded-0 hover-shadow">      
      <div class="card-body" >       
        <a href="viewbyorganisationform.jsp?org_id=<%= organisation_id %>">
          <h4 class="card-title" style="padding-left:50px">View UID Holder Details</h4>
        </a>        
      </div>
    </div>
  </div>
  <!-- course item -->
  <div class="col-lg-4 col-sm-6 mb-5"style="margin-left:10rem">
    <div class="card p-0 border-primary rounded-0 hover-shadow">
      <img class="card-img-top rounded-0" >
      <div class="card-body">      
        <a href="<%= action %>">
          <h4 class="card-title"  style="padding-left:90px">Update a Record</h4>
        </a>
    <%
                  }                 
              }
    %>                 
      </div>
    </div>
  </div>
  <!-- course item -->
  <div class="col-lg-4 col-sm-6 mb-5">
    <div class="card p-0 border-primary rounded-0 hover-shadow">      
      <div class="card-body">       
        <a href="viewallusers.jsp">
          <h4 class="card-title"  style="padding-left:90px">View All Records</h4>
        </a>
      </div>
    </div>
  </div>
</div>
   
<!-- /contact -->

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

</body>
</html>