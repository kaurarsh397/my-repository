<%-- 
    Document   : detailsmedicalaction
    Created on : 3 May, 2019, 10:01:42 PM
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
                  String treatment_name= request.getParameter("treatment_name"); 
                  String hospital_name= request.getParameter("hospital_name"); 
                  String hospital_address= request.getParameter("hospital_address"); 
                  String hospital_expenses= request.getParameter("hospital_expenses"); 
                  String treatment_year = (String)request.getParameter("treatment_year");

                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.medicalDetails(uidai_no,treatment_name,hospital_name,hospital_address,hospital_expenses,treatment_year))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=4"/>
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


