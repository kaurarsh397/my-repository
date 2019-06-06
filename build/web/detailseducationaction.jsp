<%-- 
    Document   : detailseducationaction
    Created on : 3 May, 2019, 4:47:17 PM
    Author     : SONY PC
--%>

<%@page import="databasepackage.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
         <%
                  String uidai_no = request.getParameter("uidai_no");
                  String highest_qualification= request.getParameter("highest_qualification");
                  String stream_of_qualification = request.getParameter("stream_of_qualification");
                  String institution_name = request.getParameter("institution_name");      
                  String year_of_passing = (String)request.getParameter("year_of_passing");

                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.educationDetails(uidai_no,highest_qualification,stream_of_qualification,institution_name,year_of_passing))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=1"/>
        <%
                  }
                  else
                  {
        %>
                    <jsp:forward page="detailsbank.jsp"/>
        <%
                   }
        %>
    </body>
</html>


