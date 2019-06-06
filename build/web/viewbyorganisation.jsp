<%@page import="java.sql.ResultSet"%>
<%@page import="databasepackage.MyDatabase"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  
   <!-- Font Icon -->
    <link rel="stylesheet" href="UIDapplicationformfonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="UIDapplicationvendor/nouislider/nouislider.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="UIDapplicationformcss/style.css">
   
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
   
<jsp:include page="header.jsp"></jsp:include>
                    
<%
    String uidai_no = request.getParameter("uidai_no");
    String org_id = request.getParameter("org_id");
    //System.out.println("org id : "+org_id);
    MyDatabase mdb = new MyDatabase(application);            
    ResultSet rst = mdb.viewPersonalDetails(uidai_no);
    if(rst.next())
    { System.out.println("insidepersonal");
        String name = rst.getString("user_name");
        String father_name = rst.getString("father_name");
        String mother_name = rst.getString("mother_name");
        String phone_no = rst.getString("phone_no");
        String blood_group = rst.getString("blood_group");
        String paddress = rst.getString("permanent_address");
        String caddress = rst.getString("correspondence_address");
        String email = rst.getString("email");
        String occupation = rst.getString("occupation");
        String qualification = rst.getString("qualification");
        String gender = rst.getString("gender");
        String region = rst.getString("region");
        String category = rst.getString("category");
        String date_of_birth = rst.getString("date_of_birth");
        String photo = rst.getString("photo");
        String signature = rst.getString("signature");
         
       
        photo = photo.replaceAll("\\\\","/");
        signature = signature.replaceAll("\\\\","/");   
%>                    
    
<!-- page title -->

<section class="page-title-section overlay" style="height: 500px" data-background="images/about2.jpg">
    <center>
    <div class="container" style="margin-left:300px ;margin-top: 80px">
    <div class="row">
      <div class="col-md-8">          
        <ul class="list-inline custom-breadcrumb">
          <li class="list-inline-item"><a class="h2 text-primary font-secondary" Style="font-size: 50px">Welcome <%= name %></a></li>
          <li class="list-inline-item text-white h3 font-secondary "></li>
        </ul>
        <p class="text-lighten" style="font-size: 25px">To your UID details</p>
      </div>         
    </div>
    </div>
    </center>     
</section>          
<!-- /page title -->
<!-- success story -->
<section class="section bg-cover" data-background="images/backgrounds/success-story.jpg">
  <div class="container" >
    <div class="row" style="width: 2000px; margin-left: 40px">
      <div class="col-lg-6 col-sm-8">
        <div class="bg-white p-5">
            <table style="width:100%">
                <tr>
                    <th><font size="2px">PERSONAL DETAILS</font></th>
                </tr>
                <tr>
                  <th>Name:</th>
                  <td><%= name %></td>
                </tr>
                <tr>
                  <th>Father Name:</th>
                  <td><%= father_name %></td>
                </tr>
                <tr>
                  <th>Mother Name:</th>
                  <td><%= mother_name %></td>
                </tr>
                <tr>
                  <th>Date Of Birth:</th>
                  <td><%= date_of_birth %></td>
                </tr>
                <tr>
                  <th>Gender:</th>
                  <td><%= gender %></td>
                </tr>
                <tr>
                  <th>Location:</th>
                  <td><%= region %></td>
                </tr>
                <tr>
                  <th>Email:</th>
                  <td><%= email %></td>
                </tr>
                <tr>
                  <th>Blood Group:</th>
                  <td><%= blood_group %></td>
                </tr>
                <tr>
                  <th>Phone Number:</th>
                  <td><%= phone_no %></td>
                </tr>
                <tr>
                  <th>Category:</th>
                  <td><%= category %></td>
                </tr>
                <tr>
                  <th>Permanent Address:</th>
                  <td><%= paddress %></td>
                </tr>
                <tr>
                  <th>Correspondence Address:</th>
                  <td><%= caddress %></td>
                </tr>
                <tr>
                  <th>Highest Qualification:</th>
                  <td><%= qualification %></td>
                </tr>
                <tr>
                  <th>Occupation:</th>
                  <td><%= occupation %></td>
                </tr>
                <tr>
                  <th>Photograph:</th>
                  <td><img src="<%= photo %>" style="height: 130px; width: 18%; object-fit: fill"/></td>
                </tr>
                <tr>
                  <th>Signature:</th>
                  <td><img src="<%= signature %>" style="height: 100px; width: 30%; object-fit: fill"/></td>
                </tr>
<%  
    ResultSet rst2 = mdb.viewProofs(uidai_no);
    
    
    if(rst2.next())
    {
        System.out.println("insideproof");
        String adhaar_card = rst2.getString("adhaar_card");
        System.out.println(adhaar_card);
        String matric_certificate = rst2.getString("matric_certificate");
        String passport = rst2.getString("passport");
         System.out.println("insideproof1");
        String pan_card = rst2.getString("pan_card");
        String license = rst2.getString("license");
        String category_certificate = rst2.getString("category_certificate");
         //System.out.println("insideproof2");
      
        
        adhaar_card = adhaar_card.replaceAll("\\\\","/");
        matric_certificate = matric_certificate.replaceAll("\\\\","/");
        passport = passport.replaceAll("\\\\","/");
        pan_card = pan_card.replaceAll("\\\\","/");
        license = license.replaceAll("\\\\","/");
        category_certificate = category_certificate.replaceAll("\\\\","/");
%>
                <tr>
                  <th>PROOFS</th>
                </tr>
                <tr>
                  <th>Adhaar Card:</th>
                  <%  if(adhaar_card.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  <td><img src="<%= adhaar_card %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <% } %>
                </tr>
                <tr>
                  <th>Matric Certificate:</th>
                  <%  if(matric_certificate.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  <td><img src="<%= matric_certificate %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <%  } %>
                </tr>
                <tr>
                  <th>Passport:</th>
                  <%  if(passport.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  <td><img src="<%= passport %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <% } %>
                </tr>
                <tr>
                  <th>Pan Card:</th>
                  <%  if(pan_card.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  <td><img src="<%= pan_card %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <% } %>
                </tr>
                <tr>
                  <th>License:</th>
                  <%  if(license.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  
                  <td><img src="<%= license %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <% } %>
                </tr>
                <tr>
                  <th>Category Certificate:</th>
                  <%  if(category_certificate.equals("null")) {%>
                  <td>Not Updated</td>
                  <% } else { %>
                  <td><img src="<%= category_certificate %>" style="height: 130px; width: 40%; object-fit: fill"/></td>
                  <% } %>
                </tr>
<%
    }
    
        if(org_id.equals("1"))
        {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);
    while(rst1.next())
    { 
            String stream = rst1.getString("stream_of_qualification");
            String institute = rst1.getString("institution_name");
            String year = rst1.getString("year_of_passing");
%>                 
                <tr>
                    <th>EDUCATIONAL DETAILS</th>
                </tr>
                <tr>
                  <th>Stream Of Qualification:</th>
                  <td><%= stream %></td>
                </tr>
                <tr>
                  <th>Institute Name:</th>
                  <td><%= institute %></td>
                </tr>
                <tr>
                  <th>Year Of Passing:</th>
                  <td><%= year %></td>
                </tr>
<%
    }
    }
    else if(org_id.equals("2"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);
             %>   <tr>
                    <th>BANK DETAILS</th>
                </tr> <%
    while(rst1.next())
        {
        String bank_name = rst1.getString("bank_name");
        String account_number = rst1.getString("account_number");
        String account_open_date = rst1.getString("account_open_date");
        String account_balance = rst1.getString("account_balance");
        String loan_amount = rst1.getString("loan_amount");
        String insurance_amount = rst1.getString("insurance_amount");
       
        
%>
               
                <tr>
                  <th>Bank Name:</th>
                  <td><%= bank_name %></td>
                </tr> 
                <tr>
                  <th>Account Number:</th>
                  <td><%= account_number %></td>
                </tr> 
                <tr>
                  <th>Account Open Date:</th>
                  <td><%= account_open_date %></td>
                </tr> 
                <tr>
                  <th>Account Balance:</th>
                  <td><%= account_balance %></td>
                </tr>
                <tr>
                  <th>Loan Amount:</th>
                  <td><%= loan_amount %></td>
                </tr>
                <tr>
                  <th>Insurance Amount:</th>
                  <td><%= insurance_amount %></td>
                </tr>
                
                
        <%  }       
                  ResultSet rstp = mdb.viewByOrganisation(uidai_no,"3");
                  %>
                  <tr>
                    <th>INCOME TAX DETAILS</th>
                </tr>
                  <%
                  while(rstp.next()){
                      
                String annual_salary = rstp.getString("annual_salary");

        String last_tax_paid_amount = rstp.getString("last_tax_payed_amount");
        String last_tax_paid_time = rstp.getString("last_tax_payed_time");
        String income_tax = rstp.getString("income_tax");

%>
                
                <tr>
                  <th>Annual Salary:</th>
                  <td><%= annual_salary %></td>
                </tr> 
                <tr>
                  <th>Last Tax Paid Amount:</th>
                  <td><%= last_tax_paid_amount %></td>
                </tr> 
                <tr>
                  <th>Last Tax Paid Date:</th>
                  <td><%= last_tax_paid_time %></td>
                </tr> 
                <tr>
                  <th>Income Tax:</th>
                  <td><%= income_tax %></td>
                </tr>

                
<%
  }  
        ResultSet rstp1 = mdb.viewByOrganisation(uidai_no,"9"); %>
<tr>
                    <th>PROPERTY DETAILS</th>
                </tr> <%
                  while(rstp1.next()){
        String property_area = rstp1.getString("property_area");
        String property_value = rstp1.getString("property_value");
        String last_tax_payed_amount = rstp1.getString("last_tax_payed_amount");
        String last_tax_payed_time = rstp1.getString("last_tax_payed_time");
        String property_tax = rstp1.getString("property_tax");
%>   
         
                <tr>
                  <th>Property Area:</th>
                  <td><%= property_area %></td>
                </tr>
                <tr>
                  <th>Property Value:</th>
                  <td><%= property_value %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed Amount:</th>
                  <td><%= last_tax_payed_amount %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed time:</th>
                  <td><%= last_tax_payed_time %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed time:</th>
                  <td><%= last_tax_payed_time %></td>
                </tr>
                <tr>
                  <th>Present Property tax:</th>
                  <td><%= property_tax %></td>
                </tr>
<% }

    }
else if(org_id.equals("3"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id); %>
 <tr>
                    <th>INCOME TAX DETAILS</th>
                </tr> <%
    while(rst1.next()) {
        String annual_salary = rst1.getString("annual_salary");

        String last_tax_paid_amount = rst1.getString("last_tax_payed_amount");
        String last_tax_paid_time = rst1.getString("last_tax_payed_time");
        String income_tax = rst1.getString("income_tax");

%>
               
                <tr>
                  <th>Annual Salary:</th>
                  <td><%= annual_salary %></td>
                </tr> 
                <tr>
                  <th>Last Tax Paid Amount:</th>
                  <td><%= last_tax_paid_amount %></td>
                </tr> 
                <tr>
                  <th>Last Tax Paid Date:</th>
                  <td><%= last_tax_paid_time %></td>
                </tr> 
                <tr>
                  <th>Income Tax:</th>
                  <td><%= income_tax %></td>
                </tr>
                
                
                <% }
                     ResultSet rstp2 = mdb.viewByOrganisation(uidai_no,"2");
%>  <tr>
                    <th>BANK DETAILS</th>
                </tr> <%
                  while(rstp2.next()){
       
        String bank_name = rstp2.getString("bank_name");
        String account_number = rstp2.getString("account_number");
        String account_open_date = rstp2.getString("account_open_date");
        String account_balance = rstp2.getString("account_balance");
        String loan_amount = rstp2.getString("loan_amount");
        String insurance_amount = rstp2.getString("insurance_amount");
       
        
%>
               
                <tr>
                  <th>Bank Name:</th>
                  <td><%= bank_name %></td>
                </tr> 
                <tr>
                  <th>Account Number:</th>
                  <td><%= account_number %></td>
                </tr> 
                <tr>
                  <th>Account Open Date:</th>
                  <td><%= account_open_date %></td>
                </tr> 
                <tr>
                  <th>Account Balance:</th>
                  <td><%= account_balance %></td>
                </tr>
                <tr>
                  <th>Loan Amount:</th>
                  <td><%= loan_amount %></td>
                </tr>
                <tr>
                  <th>Insurance Amount:</th>
                  <td><%= insurance_amount %></td>
                </tr>
                
<%
  }
    }
    else if(org_id.equals("4"))
    { 
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);%>
 <tr>
                    <th>MEDICAL DETAILS</th>
                </tr> <%
    while(rst1.next()){
        String treatment_name = rst1.getString("treatment_name");
        String hospital_name = rst1.getString("hospital_name");
        String hospital_address = rst1.getString("hospital_address");
        String hospital_expenses = rst1.getString("hospital_expenses");
        String treatment_year = rst1.getString("treatment_year");
%>                
               
                <tr>
                  <th>Treatment Name:</th>
                  <td><%= treatment_name %></td>
                </tr> 
                <tr>
                  <th>Hospital Name:</th>
                  <td><%= hospital_name %></td>
                </tr> 
                <tr>
                  <th>Hospital Address:</th>
                  <td><%= hospital_address %></td>
                </tr> 
                <tr>
                  <th>Hospital Expenses:</th>
                  <td><%= hospital_expenses %></td>
                </tr>
                <tr>
                  <th>Treatment Year:</th>
                  <td><%= treatment_year %></td>
                </tr>
<% }
    }
    else if(org_id.equals("5"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id); %>
 <tr>
                    <th>TRANSPORT DETAILS</th>
                </tr> <%
    while(rst1.next()) {
        String license_number = rst1.getString("license_number");
        String vehicle_number = rst1.getString("vehicle_number");
        String vehicle_type = rst1.getString("vehicle_type");
        String registration_year = rst1.getString("registration_year");
        String vehicle_color = rst1.getString("vehicle_color");
%>                
               
                <tr>
                  <th>License Number:</th>
                  <td><%= license_number %></td>
                </tr> 
                <tr>
                  <th>Vehicle Number:</th>
                  <td><%= vehicle_number %></td>
                </tr> 
                <tr>
                  <th>Vehicle Type:</th>
                  <td><%= vehicle_type %></td>
                </tr>
                <tr>
                  <th>Registration Year:</th>
                  <td><%= registration_year %></td>
                </tr> 
                <tr>
                  <th>Vehicle Color:</th>
                  <td><%= vehicle_color %></td>
                </tr>
<%
    }}
    else if(org_id.equals("6"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);%>
<tr>
                    <th>TRAVEL DETAILS</th>
                </tr> <%
    while(rst1.next()){
        String means_of_travel = rst1.getString("means_of_travel");
        String travel_departure_date = rst1.getString("travel_departure_date");
        String travel_arrival_date = rst1.getString("travel_arrival_date");
        String travel_expense = rst1.getString("travel_expense");
%>
                
                <tr>
                  <th>Means Of Travel:</th>
                  <td><%= means_of_travel %></td>
                </tr>
                <tr>
                  <th>Travel Departure Date:</th>
                  <td><%= travel_departure_date %></td>
                </tr>
                <tr>
                  <th>Travel Arrival Date:</th>
                  <td><%= travel_arrival_date %></td>
                </tr>
                <tr>
                  <th>Travel Expense:</th>
                  <td><%= travel_expense %></td>
                </tr>
<%
    }}
    else if(org_id.equals("7"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id); %> <tr>
                    <th>PASSPORT DETAILS</th>
                </tr> <%
    while(rst1.next()){
        String passport_number = rst1.getString("passport_number");
        String place_of_issue = rst1.getString("place_of_issue");
        String passport_issue_date = rst1.getString("passport_issue_date");
        String passport_expiry_date = rst1.getString("passport_issue_date");
%>                 
               
                <tr>
                  <th>Passport Number:</th>
                  <td><%= passport_number %></td>
                </tr>
                <tr>
                  <th>Place Of Issue:</th>
                  <td><%= place_of_issue %></td>
                </tr>
                <tr>
                  <th>Passport Issue Date:</th>
                  <td><%= passport_issue_date %></td>
                </tr>
                <tr>
                  <th>Passport Expiry Date:</th>
                  <td><%= passport_expiry_date %></td>
                </tr>
                
     <% }
        ResultSet rstp3 = mdb.viewByOrganisation(uidai_no,"8");
%>
 <tr>
                    <th>CRIMINAL RECORD DETAILS</th>
                </tr> <%
                  while(rstp3.next()){
         
        String case_no = rstp3.getString("case_no");
        String case_details = rstp3.getString("case_details");
        String case_year = rstp3.getString("year");
        String state = rstp3.getString("state");
        String status_of_case = rstp3.getString("status_of_case");
%>                 
               
                <tr>
                  <th>Case Number:</th>
                  <td><%= case_no %></td>
                </tr>
                <tr>
                  <th>Case Details:</th>
                  <td><%= case_details %></td>
                </tr>
                <tr>
                  <th>Case Year:</th>
                  <td><%= case_year %></td>
                </tr>
                <tr>
                  <th>Case State:</th>
                  <td><%= state %></td>
                </tr>
                <tr>
                  <th>Status Of Case:</th>
                  <td><%= status_of_case %></td>
                </tr>
                
                
                
                
<%
    }
    }
    else if(org_id.equals("8"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);

%>
  <tr>
                    <th>CRIMINAL RECORD DETAILS</th>
                </tr> <%
    while(rst1.next()){
        String case_no = rst1.getString("case_no");
        String case_details = rst1.getString("case_details");
        String case_year = rst1.getString("year");
        String state = rst1.getString("state");
        String status_of_case = rst1.getString("passport_number");
%>                 
              
                <tr>
                  <th>Case Number:</th>
                  <td><%= case_no %></td>
                </tr>
                <tr>
                  <th>Case Details:</th>
                  <td><%= case_details %></td>
                </tr>
                <tr>
                  <th>Case Year:</th>
                  <td><%= case_year %></td>
                </tr>
                <tr>
                  <th>Case State:</th>
                  <td><%= state %></td>
                </tr>
                <tr>
                  <th>Status Of Case:</th>
                  <td><%= status_of_case %></td>
                </tr>

                  <%
                      }
                     ResultSet rstp2 = mdb.viewByOrganisation(uidai_no,"2");

%>
                <tr>
                    <th>BANK DETAILS</th>
                </tr> <%
                  while(rstp2.next()){
       
        String bank_name = rstp2.getString("bank_name");
        String account_number = rstp2.getString("account_number");
        String account_open_date = rstp2.getString("account_open_date");
        String account_balance = rstp2.getString("account_balance");
        String loan_amount = rstp2.getString("loan_amount");
        String insurance_amount = rstp2.getString("insurance_amount");
       
        
%>
                <tr>
                  <th>Bank Name:</th>
                  <td><%= bank_name %></td>
                </tr> 
                <tr>
                  <th>Account Number:</th>
                  <td><%= account_number %></td>
                </tr> 
                <tr>
                  <th>Account Open Date:</th>
                  <td><%= account_open_date %></td>
                </tr> 
                <tr>
                  <th>Account Balance:</th>
                  <td><%= account_balance %></td>
                </tr>
                <tr>
                  <th>Loan Amount:</th>
                  <td><%= loan_amount %></td>
                </tr>
                <tr>
                  <th>Insurance Amount:</th>
                  <td><%= insurance_amount %></td>
                </tr>
                
<%
    }

                     ResultSet rstp4 = mdb.viewByOrganisation(uidai_no,"5"); %>
  <tr>
                    <th>TRANSPORT DETAILS</th>
                </tr>
<%
                  while(rstp4.next()){
String license_number = rstp4.getString("license_number");
        String vehicle_number = rstp4.getString("vehicle_number");
        String vehicle_type = rstp4.getString("vehicle_type");
        String registration_year = rstp4.getString("registration_year");
        String vehicle_color = rstp4.getString("vehicle_color");
%>                
              
                <tr>
                  <th>License Number:</th>
                  <td><%= license_number %></td>
                </tr> 
                <tr>
                  <th>Vehicle Number:</th>
                  <td><%= vehicle_number %></td>
                </tr> 
                <tr>
                  <th>Vehicle Type:</th>
                  <td><%= vehicle_type %></td>
                </tr>
                <tr>
                  <th>Registration Year:</th>
                  <td><%= registration_year %></td>
                </tr> 
                <tr>
                  <th>Vehicle Color:</th>
                  <td><%= vehicle_color %></td>
                </tr>

<%
}

                     ResultSet rstp6 = mdb.viewByOrganisation(uidai_no,"6");
%>
  <tr>
                    <th>TRAVEL DETAILS</th>
                </tr>
<%
                  while(rstp6.next()){

String means_of_travel = rstp6.getString("means_of_travel");
        String travel_departure_date = rstp6.getString("travel_departure_date");
        String travel_arrival_date = rstp6.getString("travel_arrival_date");
        String travel_expense = rstp6.getString("travel_expense");
%>
              
                <tr>
                  <th>Means Of Travel:</th>
                  <td><%= means_of_travel %></td>
                </tr>
                <tr>
                  <th>Travel Departure Date:</th>
                  <td><%= travel_departure_date %></td>
                </tr>
                <tr>
                  <th>Travel Arrival Date:</th>
                  <td><%= travel_arrival_date %></td>
                </tr>
                <tr>
                  <th>Travel Expense:</th>
                  <td><%= travel_expense %></td>
                </tr>


<%
}
    }
    else if(org_id.equals("9"))
    {
ResultSet rst1 = mdb.viewByOrganisation(uidai_no, org_id);

%>
  <tr>
                    <th>PROPERTY DETAILS</th>
                </tr> <%


    while(rst1.next()){
        String property_area = rst1.getString("property_area");
        String property_value = rst1.getString("property_value");
        String last_tax_payed_amount = rst1.getString("last_tax_payed_amount");
        String last_tax_payed_time = rst1.getString("last_tax_payed_time");
        String property_tax = rst1.getString("property_tax");
%>   
       
                <tr>
                  <th>Property Area:</th>
                  <td><%= property_area %></td>
                </tr>
                <tr>
                  <th>Property Value:</th>
                  <td><%= property_value %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed Amount:</th>
                  <td><%= last_tax_payed_amount %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed time:</th>
                  <td><%= last_tax_payed_time %></td>
                </tr>
                <tr>
                  <th>Last Tax Payed time:</th>
                  <td><%= last_tax_payed_time %></td>
                </tr>
                <tr>
                  <th>Present Property tax:</th>
                  <td><%= property_tax %></td>
                </tr>
<%
        }
    }
    else
    {
%>
                <tr>
                  <th>Further details are not updated.</th>
                </tr>
<%
    }

%>    
            </table>             
        </div>            
      </div>
    </div>
  </div>
</section>

<%
    }   
%>    
<!-- /success story -->
    
<jsp:include page="footer.jsp"></jsp:include> 

    <!-- JS -->
    <script src="UIDapplicationvendor/jquery/jquery.min.js"></script>
    <script src="UIDapplicationvendor/nouislider/nouislider.min.js"></script>
    <script src="UIDapplicationvendor/wnumb/wNumb.js"></script>
    <script src="UIDapplicationvendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="UIDapplicationvendor/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="UIDapplicationjs/main.js"></script>
     
<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- mixitup filter -->
<script src="plugins/mixitup/mixitup.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>
</body>
</html>
   