<%-- 
    Document   : updateaction
    Created on : 30 Mar, 2019, 12:32:00 PM
    Author     : DELL
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
    <center>
        <%
            String uidai_no = (String)session.getAttribute("uidai_no");
            String date_of_birth = (String)session.getAttribute("date_of_birth");
            
            String name = request.getParameter("name");
            String father_name = request.getParameter("father_name");
            String mother_name = request.getParameter("mother_name");
            String gender = request.getParameter("gender");
            String location = request.getParameter("location");
            String email = request.getParameter("email");
            String blood_group = request.getParameter("blood_group");
            String phone_no = request.getParameter("phone_number");
            String category= request.getParameter("category");
            String paddress = request.getParameter("permanent_address");
            String caddress = request.getParameter("correspondence_address");
            String qualification = request.getParameter("qualification");
            String occupation = request.getParameter("occupation");
            String photo = request.getParameter("photo");
            String signature = request.getParameter("signature");
            //System.out.println(photo +" aaaaa  "+signature);
            
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            
            MyDatabase mdb = new MyDatabase(application);
            int n = mdb.updateDetails(name, father_name, mother_name, gender, location, phone_no, email, category, paddress, caddress, qualification, occupation, blood_group, uidai_no, date_of_birth);
            if(n == 1)
            {
                
        %>
            <jsp:forward page="photouploadupdate.jsp" />
        <%
            }
            else
            {
                out.println("Problem in updation. Please try again!");
            }
        %>    
        </font>   
    </center>
    </body>
</html>
