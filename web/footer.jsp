
<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
<footer>
  <!-- newsletter -->
  <!--<div class="newsletter">
    <div class="container">
      <div class="row">
        <div class="col-md-9 ml-auto bg-primary py-5 newsletter-block">
          <h3 class="text-white">Subscribe Now</h3>
          <form action="#">
            <div class="input-wrapper">
              <input type="email" class="form-control border-0" id="newsletter" name="newsletter" placeholder="Enter Your Email...">
              <button type="submit" value="send" class="btn btn-primary">Join</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>-->
  <!-- footer content -->
  <div class="footer bg-footer section border-bottom" style="padding-top: 100px">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
          <!-- logo -->
     <%-- <a class="logo-footer" href="index.jsp"><img class="img-fluid mb-4" src="images/logo.png" alt="logo"></a> --%>
          <ul class="list-unstyled">
              <li class="mb-2"><font color="#5c5c77" >Osoftmediia Training Centre, Near UCO Bank, Model House, Jalandhar</font></li>
            <li class="mb-2"><font color="#5c5c77">+91 7508559390</font></li>
            <li class="mb-2"><font color="#5c5c77">+91 9872830367</font></li>
            <li class="mb-2"><font color="#5c5c77">+91 7986436253</font></li>
            <li class="mb-2"><font color="#5c5c77">uidaiindia1@gmail.com</font></li>
          </ul>
        </div>
        <!-- company -->
        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
          <h4 class="text-white mb-3">Company</h4>
          <ul class="list-unstyled">
            <li class="mb-3"><a class="text-color" href="about.jsp">About Us</a></li>            
            <li class="mb-3"><a class="text-color" href="contact.jsp">Contact</a></li>
            <li class="mb-3"><a class="text-color" href="uidservices.jsp">Our Services</a></li>
<%--            <li class="mb-3"><a class="text-color" href="blog.jsp">Blog</a></li>        --%>
          </ul>
        </div>
        <!-- links -->
    <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
          <ul class="list-unstyled">
<%
    MyDatabase mdb = new MyDatabase(application); 
    ResultSet rst = mdb.footerlinks();
    while(rst.next())
    {
        String footerlink_id = rst.getString("footerlink_id");
        String footerlink_name = rst.getString("footerlink_name");
        String footer_link = rst.getString("footer_link");
%>
        
        
            <li class="mb-3"><a class="text-color" href="<%= footer_link %>?footerlink_id=<%= footerlink_id %>"><%= footerlink_name %></a></li>
         
<%
    }
%>    
     </ul>
        </div>
        <div class="col-lg-20 col-md-3 col-sm-4 col-6 mb-3 mb-md-0">
          <h4 class="text-white mb-3">Government Of India</h4>
          <ul class="list-unstyled">
            <li class="mb-3"><a class="text-color" href="https://www.mygov.in/" target="_blank">My Gov</a></li>
            <li class="mb-3"><a class="text-color" href="https://www.india.gov.in" target="_blank">National Portal of India</a></li>
            <li class="mb-3"><a class="text-color" href="https://www.digitalindia.gov.in/" target="_blank">Digital India</a></li>
            <li class="mb-3"><a class="text-color" href="https://www.gst.gov.in/" target="_blank">GST.gov.in</a></li>
            <li class="mb-3"><a class="text-color" href="https://dbtbharat.gov.in/" target="_blank">DBT Bharat</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- copyright -->
  <div class="copyright py-4 bg-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-7 text-sm-left text-center">
          <p class="mb-0">Copyright
            <script>
              var CurrentYear = new Date().getFullYear()
              document.write(CurrentYear)
            </script> 
            © <a href="https://www.osoftmediia.com/" target="_blank">Osoftmediia.com</a></p> . All Rights Reserved.
        </div>
        <div class="col-sm-5 text-sm-right text-center">
          <ul class="list-inline">
            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://www.facebook.com/themefisher"><i class="ti-facebook text-primary"></i></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://www.twitter.com/themefisher"><i class="ti-twitter-alt text-primary"></i></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="#"><i class="ti-instagram text-primary"></i></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="https://dribbble.com/themefisher"><i class="ti-dribbble text-primary"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
