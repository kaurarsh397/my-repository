<%-- 
    Document   : detailsrtoaction
    Created on : 3 May, 2019, 10:32:05 PM
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
                  String license_number= request.getParameter("license_number"); 
                  String vehicle_number= request.getParameter("vehicle_number"); 
                  String vehicle_type= request.getParameter("vehicle_type"); 
                  String registration_year = (String)request.getParameter("registration_year");
                  String vehicle_color= request.getParameter("vehicle_color"); 

                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.rtoDetails(uidai_no,license_number,vehicle_number,vehicle_type,registration_year,vehicle_color))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=5"/>
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

