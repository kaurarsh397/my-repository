<%-- 
    Document   : detailstravelaction
    Created on : 3 May, 2019, 11:25:41 PM
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
                  String means_of_travel= request.getParameter("means_of_travel"); 
                  String travel_departure_date = (String)request.getParameter("travel_departure_date");
                  String travel_arrival_date = (String)request.getParameter("travel_arrival_date");
                  String travel_expense= request.getParameter("travel_expense"); 
                
                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.travelDetails(uidai_no,means_of_travel,travel_departure_date,travel_arrival_date,travel_expense))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=6"/>
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

