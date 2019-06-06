<%-- 
    Document   : SendMailAction
    Created on : 20 Apr, 2019, 12:23:22 PM
    Author     : SONY PC
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
            String name = request.getParameter("name");
            String subject = request.getParameter("subject");    
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            
            System.out.println(message +"   "+ email +"   "+ name +"   "+ subject);
                        
            String m_from = email;
            String m_to = "uidaiindia1@gmail.com"; // uidai@123
            String m_subject = subject;
            String m_body = message + "\nfrom : " + email;
            System.out.println(m_body +"   "+ m_from +"   "+ m_to +"   "+ m_subject);
            SendMail sendMailObj = new SendMail();
            sendMailObj.sendMail(m_from, m_to, m_subject, m_body);
%>    
                <jsp:forward page="contact.jsp" />    
</body>
</html>