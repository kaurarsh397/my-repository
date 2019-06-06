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
            String UID="null";
            String name=" ";
            String email=" ";
            String userid=(String)session.getAttribute("userId");
            MyDatabase mdb = new MyDatabase(application);
            ResultSet rst = mdb.getUID();
            
            session.removeAttribute("pathpicture");
            session.removeAttribute("pathsignature");
            
            int i=0;
            rst.afterLast();
                   while(rst.previous())
                    {
                        i++;
                        if(i==1){
                        name=rst.getString("user_name");
                        email=rst.getString("email");
                        }
                        if(i==2){
                        UID=rst.getString("uidai_no");
                        System.out.println("uid..... "+UID);
                        break;
                        }
                    }
           
            String m_from = "uidaiindia1@gmail.com"; // uidai@123
            String m_to = email;
            String m_subject, m_body;
            System.out.println("uid "+UID);
            System.out.println("email "+email);
            int uidno = Integer.parseInt(UID);
            uidno++;
            
            System.out.println(uidno);
            String n = "130491ADE9VcIY7WyB5vst82d3";
            Random rand = new Random();
            int password = rand.nextInt(900000) + 100000;
            session.setAttribute("password",password);
            mdb.updateUIDno(uidno,password,userid);
            m_subject = "Generated UID number and password";
            m_body = "Your UID Number: " + uidno +" and password: "+ password +" .\nLink to change password : http://localhost:8084/UIDAI(final)/passwordchange.jsp";
                   
            if(mdb.lostUID(name, email))
            {   
                SendMail sendMailObj = new SendMail();
                sendMailObj.sendMail(m_from, m_to, m_subject, m_body);
%>      
                <jsp:forward page="UIDapplicationform.jsp"/>                
<%    
                }            
%>
    </body>
</html>