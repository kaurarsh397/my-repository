<%-- 
    Document   : detailspoliceaction
    Created on : 4 May, 2019, 12:29:08 PM
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
                  String case_no= request.getParameter("case_no"); 
                  String case_details= request.getParameter("case_details"); 
                  String year = (String)request.getParameter("year");
                  String state= request.getParameter("state"); 
                  String status_of_case= request.getParameter("status_of_case"); 
                 

                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.policeDetails(uidai_no,case_no,case_details,year,state,status_of_case))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=8"/>
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

