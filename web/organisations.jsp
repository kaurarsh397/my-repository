<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <title>Organisations</title>

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

</head>

<body>
  
<!-- header -->
<jsp:include page="header.jsp" />
<!-- /header -->

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded-0 border-0 p-4">
            <div class="modal-header border-0">
                <h3>Login</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" class="row">
                    <div class="col-12">
                        <input type="text" class="form-control mb-3" id="loginPhone" name="loginPhone" placeholder="Phone">
                    </div>
                    <div class="col-12">
                        <input type="text" class="form-control mb-3" id="loginName" name="loginName" placeholder="Name">
                    </div>
                    <div class="col-12">
                        <input type="password" class="form-control mb-3" id="loginPassword" name="loginPassword" placeholder="Password">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">LOGIN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- page title -->
<section class="page-title-section overlay" style="height: 600px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">
          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" href="courses.jsp" style="font-size:90px">Organisations</a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
        <p class="text-lighten" style="font-size: 25px">Different organisations have access to user's specific information. These organisational bodies updates the user information.</p>
      </div>
    </div>
    </div>
    </center>     
</section>

<%
    
     String loginform_action = request.getParameter("loginform_action");
    MyDatabase mdb = new MyDatabase(application); 
    ResultSet rst = mdb.organisations();
    while(rst.next())
    {
        String organisation_id = rst.getString("organisation_id");
        String organisation_name = rst.getString("organisation_name");
      
        String organisation_description = rst.getString("organisation_description");
%>

<!-- notice -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <ul class="list-unstyled">
          <!-- notice item -->
          <li class="d-md-table mb-4 w-100 border-bottom hover-shadow">
            <div class="d-md-table-cell text-center p-4 bg-primary text-white mb-4 mb-md-0"><span class="h2 d-block"><%= organisation_id %></span></div>
            <div class="d-md-table-cell px-4 vertical-align-middle mb-4 mb-md-0">
              <a href="#" class="h4 mb-3 d-block"><%= organisation_name %></a>
              <p class="mb-0"><%= organisation_description %></p>
            </div>
        <div class="d-md-table-cell text-right pr-0 pr-md-4"><a href="loginform.jsp?service_name=Organisations&organisation_id=<%=organisation_id%>&loginform_action=organisationhome.jsp" class="btn btn-primary">Login</a></div> 
<%--            <div class="d-md-table-cell text-right pr-0 pr-md-4"><a href="organisationhome.jsp?organisation_id=<%=organisation_id%>&loginform_action=<%=loginform_action%>" class="btn btn-primary">Login</a></div>     --%>
          </li>
        </ul>
      </div>
    </div>
  </div>
<%
        }
%>    
</section>
<!-- /notice -->

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /footer -->

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