<%-- 
    Document   : adminformaction
    Created on : 20 Apr, 2019, 9:38:32 AM
    Author     : SONY PC
--%>

<%-- 
    Document   : loginformaction
    Created on : 18 Apr, 2019, 9:38:19 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
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
                String username = request.getParameter("loginName");
                String password = request.getParameter("loginPassword");     
                MyDatabase mdb = new MyDatabase(application);
                boolean userExists = mdb.Adminlogin(username,password);
                if(userExists==true)
                {                    
        %>
        <jsp:forward page="AdminPage.jsp"/>
                <%
                    }
                else{
                      %>
                      <jsp:forward page="contact.jsp"/>
                      <%
                    }
                    %>
                    
                    
    </body>
</html>
