<%-- 
    Document   : detailsincometaxaction
    Created on : 3 May, 2019, 8:23:28 PM
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
                  String annual_salary= request.getParameter("annual_salary"); 
                  String last_tax_payed_amount= request.getParameter("last_tax_payed_amount"); 
                  String last_tax_payed_time = (String)request.getParameter("last_tax_payed_time");
                  int salary_per_annum=Integer.parseInt(annual_salary);
                  int income_tax_=0;
                  if(salary_per_annum<650000)
                  {
                      income_tax_=0;
                  }
                  else if(salary_per_annum>650000)
                  {
                      int income_tax1=12500;
                      int amount_overlimit=salary_per_annum-500000;
                      int income_tax2=(20*amount_overlimit)/100;
                      income_tax_=income_tax1+income_tax2;
                  }
                
                 String income_tax=String.valueOf(income_tax_);
                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.incometaxDetails(uidai_no,annual_salary,last_tax_payed_amount,last_tax_payed_time,income_tax))
                  {
        %>                       
                      <jsp:include page="organisationhome.jsp?organisation_id=3"/>
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


