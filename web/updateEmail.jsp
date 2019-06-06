<%-- 
    Document   : updateEmail
    Created on : 22 May, 2019, 12:18:23 AM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="databasepackage.MyDatabase"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="mailer.SendMail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email send</title>
    </head>
    <body>
<%   
    String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    String uidai_no = (String)session.getAttribute("uidai_no");
    System.out.println("name : "+name+ " email : "+email+" uidai_no : "+uidai_no);
    
    String m_from = "uidaiindia1@gmail.com"; // uidai@123
    String m_to = email;
    String m_subject = "Updated UID details";
    String m_body = "Dear "+ name +"! your UID details have been updated successfully.";
    
    MyDatabase mdb=new MyDatabase(application);
    if(mdb.updateEmail(uidai_no))
    {   
        SendMail sendMailObj = new SendMail();
        sendMailObj.sendMail(m_from, m_to, m_subject, m_body);
%>         
    <jsp:forward page="userupdatelogin.jsp" /> 
<%      
                }        
%>

</body>
</html>