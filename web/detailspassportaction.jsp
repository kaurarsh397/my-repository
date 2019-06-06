<%-- 
    Document   : detailspassportaction
    Created on : 4 May, 2019, 11:30:19 AM
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
                  String passport_number= request.getParameter("passport_number"); 
                  String place_of_issue= request.getParameter("place_of_issue"); 
                   String birth_date = (String)request.getParameter("birth_date");
                  String place_of_birth= request.getParameter("place_of_birth"); 
                  String passport_issue_date = (String)request.getParameter("passport_issue_date");
                  String passport_expiry_date = (String)request.getParameter("passport_expiry_date");

                    
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.passportDetails(uidai_no,passport_number,place_of_issue,birth_date,place_of_birth,passport_issue_date,passport_expiry_date))
                  {
        %>
                    <jsp:include page="organisationhome.jsp?organisation_id=7"/>
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

