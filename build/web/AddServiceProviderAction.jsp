<%-- 
    Document   : AddServiceProviderAction
    Created on : 9 May, 2019, 12:42:31 PM
    Author     : hp
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
                  String Sname = request.getParameter("name");
                  String Semail = request.getParameter("email");
                  String Scity = request.getParameter("city"); 
                  String Susername = request.getParameter("username");
                  String Spassword = request.getParameter("password");
                  System.out.println(Sname+ ""+Semail+","+Scity+","+Susername+", "+Spassword+",,");
                  MyDatabase mdb =new MyDatabase(application);
                  boolean isInserted=mdb.addProvider(Sname,Semail,Scity,Susername,Spassword);
                  
                    if(isInserted==true)
                    {
                        %>
                        <jsp:forward page="AddServiceProvider.jsp">
                             <jsp:param name="problem" value="false"></jsp:param>
                        </jsp:forward>
                        <%
                            
                    }
                    else
                    {
                             %>
                        <jsp:forward page="AddServiceProvider.jsp">
                            <jsp:param name="problem" value="true"></jsp:param>
                        </jsp:forward>
                        <%
                    }

             %>     
    </body>
</html>
