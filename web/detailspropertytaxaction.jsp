<%-- 
    Document   : detailspropertytaxaction
    Created on : 4 May, 2019, 12:45:59 PM
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
                  String property_area= request.getParameter("property_area");
                  String property_value= request.getParameter("property_value");
                  String last_tax_payed_amount= request.getParameter("last_tax_payed_amount"); 
                  String last_tax_payed_time = (String)request.getParameter("last_tax_payed_time");
                 int property_in_meters=Integer.parseInt(property_area);
                 int property_tax_int=property_in_meters*5;
                 String property_tax=String.valueOf(property_tax_int);
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.propertytaxDetails(uidai_no,property_area,property_value,last_tax_payed_amount,last_tax_payed_time,property_tax))
                  { 
                      System.out.println(property_tax);
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=9"/>
        <%
                  }
                  else
                  {
        %>
                    <jsp:forward page="detailsbank.jsp"/>        <%
                   }
        %>
    </body>
</html>
