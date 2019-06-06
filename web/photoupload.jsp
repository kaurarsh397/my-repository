<!DOCTYPE html>
<html lang="zxx" xmlns="http://www.w3.org/1999/xhtml">

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
    <section class="section-sm">      
        <div class="row justify-content-center">  
            <div class="col-lg-4 col-sm-10 mb-10" >
                <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
                    <div class="card-body">
          
<%
    String pathpicture=null;
    String pathsignature=null;
    //String photo = request.getParameter("photo");
    //String signature = request.getParameter("signature");
    pathpicture = (String)session.getAttribute("pathpicture");
    pathsignature = (String)session.getAttribute("pathsignature");
    
    System.out.println(pathpicture + "\t" + pathsignature);
    
    if(pathpicture != null && pathsignature!=null)  
    {
        pathpicture = pathpicture;
        pathsignature = pathsignature;
        pathpicture = pathpicture.replaceAll("\\\\","/");
        pathsignature = pathsignature.replaceAll("\\\\","/");
        System.out.println(pathpicture + "\t" + pathsignature);
     
%>   

    <form name="form" action="proofupload.jsp" method="post" enctype="multipart/form-data" >
        Your picture: 
       <center>
        <div style=" height: 140px; width: 60%">
            <img src="<%=pathpicture%>" style="height: 150px; width: 40%; object-fit: fill"/></br>
   
         </div>
          </center>
   </br>
        Your signature: 
        <center>
          <div style=" height: 80px; width: 70%;">
              <img src="<%=pathsignature%>" style="height: 80px; width: 70%;object-fit: contain"/></br>
       
        </div>
        </center>
              <br>
      <center>
          
         <input type="submit" value="Save & Next" class="submit" id="submit" name="submit" />
      </center>    
    </form>
<%--
<%      
    }
    else if(photo != null && signature!=null)  
    {
        photo = photo.substring(photo.indexOf("userimages"));
        signature = signature.substring(signature.indexOf("userimages"));
        photo = photo.replaceAll("\\\\","/");
        signature = signature.replaceAll("\\\\","/");
        System.out.println(photo + "\t" + signature);
     
%>   

    <form name="form" action="uploadphotoaction.jsp" method="post" enctype="multipart/form-data" onsubmit="return updatePhoto();">
        Choose picture to Update: <img src="<%=photo%>"/>
        <input type="file" name="pathpicture" value="<%= photo %>"/><br/>
        Choose signature to Update: <img src="<%=signature%>"/>
        <input type="file" name="pathsignature" value="<%= signature %>"/><br/>
      <center>
         <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
      </center>    
    </form> --%>   
<%   
    }
    else
    {
        System.out.println("inside else");
%>
    <form name="form" action="uploadphotoaction.jsp" method="post" enctype="multipart/form-data" onsubmit="return validPhoto();">
        Choose picture to Upload: <input type="file" name="pathpicture" value="<%= pathpicture %>"/><br/>
        Choose signature to Upload: <input type="file" name="pathsignature" value="<%= pathsignature %>"/><br/>   
        <center>
            <input type="submit" value="Save & Next" class="submit" id="submit" name="submit" />
        </center>  
    </form>
<%
    }
%>    
    </div>
    </div>
<script>
    function validPhoto(){
        if (document.form.pathpicture.value == ""){
        alert ( "Please upload a picture." );
        document.form.pathpicture.focus();
        return false;
        }
        if (document.form.pathsignature.value == ""){
        alert ( "Please upload a signature." );
        document.form.pathsignature.focus();
        return false;
        }
        alert ( "Upload Successful!" );        
        return true;        
    }
    function updatePhoto() {
        alert ("Update Successful");
        return true;
    }
    </script>
  </div>
</div>
   </section>
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