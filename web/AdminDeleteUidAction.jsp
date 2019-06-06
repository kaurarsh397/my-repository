<%-- 
    Document   : AdminDeleteUidAction
    Created on : 15 May, 2019, 8:50:04 PM
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
            String problem=null;
        String uid_no=request.getParameter("uid_no");
        MyDatabase mdb=new MyDatabase(application);
      boolean b= mdb.deleteUID(uid_no);
      if(b==false)
      problem="false";
      else 
        problem="true";
        %>
        <jsp:forward page="AdminDeleteUid.jsp">
            <jsp:param name="problem" value="<%=problem%>"></jsp:param>
            </jsp:forward>
    </body>
</html>
