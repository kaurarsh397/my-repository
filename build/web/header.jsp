  

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!-- header -->
<header class="fixed-top header">
  <!-- top header -->
  <div class="top-header py-2 bg-white">
    <div class="container">
      <div class="row no-gutters" >
        <div class="col-lg-4 text-center text-lg-left" >           
          <a href="index.jsp"><img src="images/emblem.PNG"></a>
        </div>
        <div class="col-lg-8 text-center text-lg-right" >            
          <ul class="list-inline">
            <li style="padding:1rem 0 .5rem .5rem" class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="#" data-toggle="modal" data-target="#loginModal" style="font-family: "Poppins", Sans Serif"> login</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- navbar -->
  <div class="navigation w-100" style="background-color:#fff" >
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light p-0">
          <a class"navbar-brand" ><img src="images/logo.PNG" alt="logo"></a>
        <div class="collapse navbar-collapse" id="navigation">
          <ul class="navbar-nav ml-auto text-center">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="about.jsp">About UIDAI</a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="loginform.jsp?service_name=My UID&loginform_action=UIDviewdetails.jsp">My UIDAI</a>
            </li>
            <li class="nav-item dropdown view">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Organisations
              </a>        
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">    
                
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/uidai_db","root","");
        PreparedStatement pst = con.prepareStatement("select * from organisations");
        ResultSet rst = pst.executeQuery();
        while(rst.next())
        {
            String organisation_id = rst.getString("organisation_id");
            String organisation_name = rst.getString("organisation_name");   
%>                  
                  
            <a class="dropdown-item" href="loginform.jsp?service_name=Organisations&organisation_id=<%=organisation_id%>&loginform_action=organisationhome.jsp"><%= organisation_name %></a>
              
<%
        }
    }
    catch(Exception ex)
    {       }
%>
            
            </div>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="contact.jsp">Contact & Support</a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>

<!-- /header -->

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content rounded-0 border-0 p-4">
            <div class="modal-header border-0">
                <h3>Admin Login</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="form" action="adminformaction.jsp" class="row" onsubmit="return adminForm();">
                    
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
   <script>
    function adminForm(){
        if (document.form.loginName.value == "priyanka" && document.form.loginPassword.value == "thakur"){
        alert ( "login succesful." );
        return true;
        }
        if (document.form.loginName.value == "arsh" && document.form.loginPassword.value == "deep"){
        alert ( "login succesful." );
        return true;
        }
        if (document.form.loginName.value == "surbhi" && document.form.loginPassword.value == "kashyap"){
        alert ( "login succesful." );
        return true;
        }
        alert ( "invalid credentials!" );
         document.form.loginName.focus();
        return false;
    }
    </script>
    </div>
</div>
