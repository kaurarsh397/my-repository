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
   
<jsp:include page="header.jsp"></jsp:include>

                    
<%
    String uidai_no = request.getParameter("uidai_no");
    String uidai_password = request.getParameter("uidai_password");
            
    MyDatabase mdb = new MyDatabase(application);            
    ResultSet rst = mdb.viewMyUID(uidai_no, uidai_password);
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
        String date_of_birth = rst.getString("date_of_birth");
        String photo = rst.getString("photo");
        String signature = rst.getString("signature");
        
        photo = photo.substring(photo.indexOf("userimages"));
        signature = signature.substring(signature.indexOf("userimages"));
        photo = photo.replaceAll("\\\\","/");
        signature = signature.replaceAll("\\\\","/");   
%>                    
    
<!-- page title -->
<section class="page-title-section overlay" style="height: 500px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">
          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" Style="font-size: 50px">Welcome <%= name %></a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
        <p class="text-lighten" style="font-size: 25px">To your UID details</p>
      </div>
    </div>
    </div>
    </center>     
</section>
<!-- /page title -->
<!-- success story -->
<section class="section bg-cover" data-background="images/backgrounds/success-story.jpg">
  <div class="container" >
    <div class="row" style="width: 2000px; margin-left: 40px">
      <div class="col-lg-6 col-sm-8">
        <div class="bg-white p-5">
            <table style="width:100%">
                <tr>
                  <th>Name:</th>
                  <td><%= name %></td>
                </tr>
                <tr>
                  <th>Father Name:</th>
                  <td><%= father_name %></td>
                </tr>
                <tr>
                  <th>Mother Name:</th>
                  <td><%= mother_name %></td>
                </tr>
                <tr>
                  <th>Date Of Birth:</th>
                  <td><%= date_of_birth %></td>
                </tr>
                <tr>
                  <th>Gender:</th>
                  <td><%= gender %></td>
                </tr>
                <tr>
                  <th>Location:</th>
                  <td><%= region %></td>
                </tr>
                <tr>
                  <th>Email:</th>
                  <td><%= email %></td>
                </tr>
                <tr>
                  <th>Blood Group:</th>
                  <td><%= blood_group %></td>
                </tr>
                <tr>
                  <th>Phone Number:</th>
                  <td><%= phone_no %></td>
                </tr>
                <tr>
                  <th>Category:</th>
                  <td><%= category %></td>
                </tr>
                <tr>
                  <th>Permanent Address:</th>
                  <td><%= paddress %></td>
                </tr>
                <tr>
                  <th>Correspondence Address:</th>
                  <td><%= caddress %></td>
                </tr>
                <tr>
                  <th>Highest Qualification:</th>
                  <td><%= qualification %></td>
                </tr>
                <tr>
                  <th>Occupation:</th>
                  <td><%= occupation %></td>
                </tr>
                <tr>
                  <th>Photograph:</th>
                  <td><img src="<%= photo %>"/></td>
                </tr>
                <tr>
                  <th>Signature:</th>
                  <td><img src="<%= signature %>"/></td>
                </tr>
            </table>
<%
    }
%>                
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /success story -->
    
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
   