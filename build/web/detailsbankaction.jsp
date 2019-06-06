<%-- 
    Document   : detailsbankaction
    Created on : 3 May, 2019, 3:41:19 PM
    Author     : SONY PC
--%>

<%@page import="databasepackage.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
                  String uidai_no = request.getParameter("uidai_no");
                  String bank_name = request.getParameter("bank_name");
                  String account_number = request.getParameter("account_number");
                  String account_open_date = (String)request.getParameter("account_open_date");
                  String account_balance = request.getParameter("account_balance");
                  String loan_amount= request.getParameter("loan_amount");
                  String insurance_amount = request.getParameter("insurance_amount");        
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.bankDetails(uidai_no,bank_name,account_number,account_open_date,account_balance,loan_amount,insurance_amount))
                  {
        %>                       
                      <jsp:include page="organisationhome.jsp?organisation_id=2"/>
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

