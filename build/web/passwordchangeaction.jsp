<%-- 
    Document   : passwordchangeaction.jsp
    Created on : May 7, 2019, 12:30:11 PM
    Author     : DELL
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
                  String old_password= request.getParameter("old_password"); 
                  String new_password= request.getParameter("new_password"); 
                  String confirm_new_password= request.getParameter("confirm_new_password");
                  System.out.println(new_password+" "+confirm_new_password);
                  if(new_password.equals(confirm_new_password))
                  {    
                            MyDatabase mdb =new MyDatabase(application);
                            int n=mdb.changePassword(uidai_no,new_password,old_password);
                            if( n==1 )
                            {
                  %>           
                                <jsp:forward page="index.jsp"/>
                  <%
                            }
                            else
                            {
                  %>
                             <center>
                                 <font color='red'>Problem in password updation. Please try again!</font>
                                 </center> 
                             <jsp:include page="passwordchange.jsp"/>

                  <%
                             }
                    }
                       else
                    {           
                  %>      
                             <jsp:include page="passwordchange.jsp"/>
                              <center>
                                 <font color='red'>new passwords not matched. Please try again!</font>
                                 </center> 
                  <%
                      }
                     %>
    </body>
</html>

