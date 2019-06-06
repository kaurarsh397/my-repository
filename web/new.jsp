<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
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
        <form name="form" action="uploadproofactionupdate.jsp" method="post" enctype="multipart/form-data" onsubmit="submitForm();" >            
            <div class="row justify-content-center" style="margin: 0px 140px 0px 140px "> 
            
<%
    MyDatabase mdb = new MyDatabase(application); 
    
   String proof[] = new String[6];
        String uidai_no = "222";
        ResultSet rst1 = mdb.getProofPath(uidai_no);
        if(rst1.next())
        {
            String adhaar_card = rst1.getString("adhaar_card");
            String matric_certificate = rst1.getString("matric_certificate");
            String passport = rst1.getString("passport");
            String pan_card = rst1.getString("pan_card");
            String license = rst1.getString("license");
            String category_certificate = rst1.getString("category_certificate");
            String user_id = rst1.getString("user_id");
            session.setAttribute("userId", user_id);
            
             proof = new String[]{adhaar_card, matric_certificate, passport, pan_card, license, category_certificate};
            
        for(int i=0; i<proof.length; i++)
        {
            System.out.println("prooof[i] "+proof[i]);
            if(!proof[i].equals("null") )
            {   System.out.println("in if");
                proof[i] = proof[i].substring(proof[i].indexOf("userimages"));
                proof[i] = proof[i].replaceAll("\\\\","/");
      
            }
            
        }
        }
%>        

            <div class="col-lg-4 p-2 mx-0" >        
                <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow " style="height: 300px" >
                    <div class="card-body " >
        <%
            int k=0;
            ResultSet rst = mdb.proofs();
                         while(rst.next())
    {
        
        System.out.println("hello world");
        String proof_id = rst.getString("proof_id");
        String proof_name = rst.getString("proof_name");
        
        //session.setAttribute("proof_id",proof_id);
        %>
               Your <%= proof_name %>:
        <center>
                <div style=" height: 150px; width: 100%">
        <img src="<%= proof[k] %>"style="height: 150px; width: 100%; object-fit: fill"/></br>


        <%= proof_name %> Update: <input type="file" name="<%= proof_name %>" /><br/> 
                </div>
        </center>
                </div>
                </div>
            </div>
    
<%
    k++;
    }
        

%>


    
                <div class="col-lg-3 col-sm-10 mb-10" >                        
                    <div class="card-body">
                        <center>
                            
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                          
                        </center> 
                    </div>
                </div>
            </div>
        </form>        
    </section>
</section>

<script>
function submitForm(){
alert ( "Application is successfully submitted" );
return true;
}
</script>
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
   