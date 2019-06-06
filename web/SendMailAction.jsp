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
 
<script> 
<%
            String email = request.getParameter("email");
            String name = request.getParameter("fullname");
            
            System.out.println(name +" action  "+ email);
                        
            String m_from = "uidaiindia1@gmail.com"; // uidai@123
            String m_to = email;
            String m_subject, m_body;
            String button = (String)session.getAttribute("button");
            System.out.println("button:  "+ button);
            MyDatabase mdb = new MyDatabase(application);
            
            if(button == "getotp")
            {    
                String n = "130491ADE9VcIY7WyB5vst82d3";
            Random rand = new Random();
            int otp = rand.nextInt(900000) + 100000;
            session.setAttribute("otp",otp);
                m_subject = "OTP to get lost UID Number";
                m_body = otp + " is your one time password for retrieval of UID Number.";
                
                if(mdb.lostUID(name, email))
                {    
                    SendMail sendMailObj = new SendMail();
                    sendMailObj.sendMail(m_from, m_to, m_subject, m_body);
%>    
                <jsp:forward page="lostuid.jsp" >
                    <jsp:param name="email" value="<%= email %>" />
                    <jsp:param name="name" value="<%= name %>" />
                         <jsp:param name="otp" value="<%= otp %>" />
                </jsp:forward>    
<%    
                }
            }
            else
            {   String enterOTP = request.getParameter("otp");
               
                  System.out.println("elseotp  "+name+" "+email);
                String otp1 = request.getParameter("otp1");
                System.out.println("otp "+enterOTP+" "+otp1);
                if(otp1.equals(enterOTP))
                {
                    
                    ResultSet rst = mdb.sendUID(name, email);
                    if(rst.next())
                    {   
                        String uidai_no = rst.getString("uidai_no");
                        String password = rst.getString("uidai_password");
                        m_subject = "UID Number and password";
                        m_body = name + " your UID Number is " + uidai_no + " and password is " + password;

                        SendMail sendMailObj = new SendMail();
                        sendMailObj.sendMail(m_from, m_to, m_subject, m_body);
    %>    
                        <jsp:forward page="index.jsp" />                   
    <%    
                    }
                }
                else
                {
%>
                    <jsp:forward page="lostuid.jsp" >
                        <jsp:param name="email" value="<%= email %>" />
                        <jsp:param name="name" value="<%= name %>" />
                        <jsp:param name="wrongOTP" value="true"/>
                    </jsp:forward> 
<%    
                }
            }    
            
            
/*
      try {
 
            Properties m_properties     = new Properties();
         
            m_properties.put("mail.smtp.host", "smtp.gmail.com"); 
            m_properties.put("mail.smtp.starttls.enable", "true");
            m_properties.put("mail.smtp.socketFactory.port", "465");
            m_properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
            m_properties.put("mail.smtp.auth", "true");
            m_properties.put("mail.smtp.port", "465");
 
            //Session m_Session        =   Session.getDefaultInstance(m_properties,new Authenticator() {
            Session m_Session        =   Session.getInstance(m_properties,new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(m_from,"uidai@123"); // username and the password
                }
 
            });
             
            MimeMessage m_simpleMessage  =   new MimeMessage(m_Session);
 
            InternetAddress m_fromAddress    =   new InternetAddress(m_from);
            InternetAddress m_toAddress      =   new InternetAddress(m_to);
 
 
            m_simpleMessage.setFrom(m_fromAddress);
            m_simpleMessage.setRecipient(RecipientType.TO, m_toAddress);
            m_simpleMessage.setSubject(m_subject);
            m_simpleMessage.setContent(m_body,"text/plain");
 
            Transport.send(m_simpleMessage);
            out.println("Email Sent!");
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
*/
        %>
    </body>
</html>