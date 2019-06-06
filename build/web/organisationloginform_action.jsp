<%-- 
    Document   : organisationloginform_action
    Created on : 21 Apr, 2019, 7:26:26 PM
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
              String organisation_id=request.getParameter("organisation_id");
              MyDatabase mdb=new MyDatabase(application);
              ResultSet rst=mdb.organisations();
              while(rst.next())
              {
                  String action=rst.getString("organisationloginform_action");
                  String org_id=rst.getString("organisation_id");
                  if(org_id.equals(organisation_id))
                  {
                      
              %>
              <jsp:forward page="<%=action%>"></jsp:forward>
                           <%
                  }                 
              }
                 
              
            %>
    </body>
</html>
