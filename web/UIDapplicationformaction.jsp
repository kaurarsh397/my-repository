<%-- 
    Document   : UIDapplicationformaction
    Created on : 20 Apr, 2019, 12:46:02 PM
    Author     : SONY PC
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
                  String name = request.getParameter("name");
                  String father_name = request.getParameter("father_name");
                  String mother_name = request.getParameter("mother_name");
                  String birth_date = (String)request.getParameter("birth_date");
                  String gender = request.getParameter("gender");
                  String location = request.getParameter("location");
                  String email = request.getParameter("email");
                  String blood_group = request.getParameter("blood_group");
                  String phone_number = request.getParameter("phone_number");
                  String category= request.getParameter("category");
                  String paddress = request.getParameter("permanent_area");
                  String pdistrict =request.getParameter("permanent_district");
                  String pcity = request.getParameter("permanent_city");
                  String pstate = request.getParameter("permanent_state");
                  String caddress = request.getParameter("correspondence_area");
                  String cdistrict = request.getParameter("correspondence_district");
                  String ccity = request.getParameter("correspondence_city");
                  String cstate = request.getParameter("correspondence_state");
                  String qualification = request.getParameter("qualification");
                  String occupation = request.getParameter("occupation");
         
                  MyDatabase mdb =new MyDatabase(application);
                  if(mdb.userDetails(name,father_name,mother_name,birth_date,gender,location,email,blood_group,phone_number,category,paddress,pdistrict,pcity,pstate,caddress,cdistrict,ccity,cstate,qualification,occupation))
                  {
                      String userId=mdb.getUserId();
                      session.setAttribute("userId",userId);
        %>
                      <jsp:forward page="photoupload.jsp" />
        <%
                  }
                  else
                  {
        %>
                    <center>
                       <font color='red'>Problem in registration. Please try again!</font>
                    </center> 
                   <jsp:include page="UIDapplicationform.jsp">
                       <jsp:param name="problem" value="true" ></jsp:param>
                   </jsp:include>    
                   
        <%
                   }
        %>
    </body>
</html>
