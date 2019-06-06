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
                String username = request.getParameter("name");
                String password = request.getParameter("password");
                String service_name = request.getParameter("service_name");
                String organisation_id= request.getParameter("organisation_id");
                String loginform_action = request.getParameter("loginform_action");
                System.out.println(username +"    "+password+"     "+service_name);
                boolean userExists=false;
                MyDatabase mdb = new MyDatabase(application);
                if(service_name.equals("Get UID") || service_name.equals("Update UID"))
                {
                    userExists = mdb.SPlogin(username,password);                    
                }
                else if(service_name.equals("My UID"))
                {   
                    userExists = mdb.userLogin(username,password);                    
                }
                else if(service_name.equals("Organisations"))
                {
                   userExists = mdb.Organisationlogin(username,password,organisation_id);                    
                }

                    if(userExists==true)
                    {                    
        %>
                        <jsp:forward page="<%= loginform_action %>">
                            <jsp:param name="organisation_id" value="<%=organisation_id%>"></jsp:param>
                            <jsp:param name="viewUserName" value="<%= username %>"></jsp:param>
                        </jsp:forward>
        <%
                    }
                    else 
                    {   
                          %>
                          <jsp:forward page="loginform.jsp">
                          <jsp:param name="wrongCredentials" value="Wrong Credentials!"/>
                          <jsp:param name="service_name" value="<%= service_name %>"/>
                          </jsp:forward>
        <%
                    }
        %>
}
        %>                    
    </body>
</html>
