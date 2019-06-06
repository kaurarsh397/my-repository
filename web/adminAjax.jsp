<%@page import="databasepackage.MyDatabase"%>
<%@page import="java.sql.ResultSet"%>
<head> <style>
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
     
<%
    
                    String uidai_no=request.getParameter("uid_no");
                   String org_id=request.getParameter("org_id");       
                   System.out.println(uidai_no + " ajax "+org_id);
        if(org_id.equals("1"))
        {%>
        <tr>
                    <th><font size="2px" color="#007bff">QUALIFICATION DETAILS</font></th>
                </tr>
            <tr>
            <th>Stream Of Qualification:</th> 
            <th>Institute Name:</th>
            <th>Year Of Passing:</th>
            </tr>
            <%
        }
       if(org_id.equals("2"))
        {%>
        <tr>
                    <th><font size="2px" color="#007bff">BANK DETAILS</font></th>
                </tr>
            <tr>
            <th>Bank Name:</th> 
            <th>Account Number:</th>
            <th>Account Open Date:</th>
            <th>Account Balance:</th>
            <th>Loan Amount:</th>
            <th>Insurance Amount:</th>
            </tr>
            <%
        }

 if(org_id.equals("3"))
        {%>
        <tr>
                    <th><font size="2px" color="#007bff">INCOME TAX DETAILS</font></th>
                </tr>
            <tr>
            <th>Annual Salary:</th> 
            <th>Last-Tax-Paid-Amount:</th>
            <th>Last-Tax-Paid-Date:</th>
            <th>Income Tax To be Paid:</th>
           
            </tr>
            <%
        }
        if(org_id.equals("4"))
        {%>
                <tr>
                    <th><font size="2px" color="#007bff">MEDICAL DETAILS</font></th>
                </tr>
                <tr>
                  <th>Treatment Name:</th>
                  <th>Hospital Name:</th>
                  <th>Hospital Address:</th>
                  <th>Hospital Expenses:</th>
                  <th>Treatment Year:</th> 
                </tr>
            <%
        }
if(org_id.equals("5"))
        {%>
          <tr>
                    <th><font size="2px" color="#007bff">TRANSPORT DETAILS</font></th>
                </tr>
                <tr>
                  <th>License Number:</th>
                
                  <th>Vehicle Number:</th>
                  
                  <th>Vehicle Type:</th>
                  
                  <th>Registration Year:</th>
                  
                  <th>Vehicle Color:</th>
                  
                </tr>
            <%
        }else if(org_id.equals("6"))
    {
       
%>
                <tr>
                    <th><font size="2px" color="#007bff">TRAVEL DETAILS</font></th>
                </tr>
                <tr>
                  <th>Means Of Travel:</th>
                  
                  <th>Travel Departure Date:</th>
                  
                  <th>Travel Arrival Date:</th>
                  
                  <th>Travel Expense:</th>
                  
                </tr>
<%
    }
    else if(org_id.equals("7"))
    {
      
%>                 
                <tr>
                    <th><font size="2px"color="#007bff">PASSPORT DETAILS</font></th>
                </tr>
                <tr>
                  <th>Passport Number:</th>
                  
                  <th>Place Of Issue:</th>
                  
                  <th>Passport Issue Date:</th>
                    
                
                  <th>Passport Expiry Date:</th>
                 
                </tr>
<%
    }
     else if(org_id.equals("8"))
    {
       %>  
       
       
                <tr>
                    <th><font size="2px" color="#007bff">CRIMINAL RECORD DETAILS</font></th>
                </tr>
                <tr>
                  <th>Case Number:</th>
                  
                  <th>Case Details:</th>
                  
                  <th>Case Year:</th>
                 
                  <th>Case State:</th>
                  
                  <th>Status Of Case:</th>
                  
                </tr>
<%
    }
    else if(org_id.equals("9"))
    {
        
%>   
         <tr>
             <th><font size="2px" color="#007bff">PROPERTY DETAILS</font></th>
                </tr>
                <tr>
                  <th>Property Area:</th>
                 
                  <th>Property Value:</th>
                  
                  <th>Last Tax Payed Amount:</th>
                  
                  <th>Last Tax Payed time:</th>
                  
                  <th>Last Tax Payed time:</th>
                 
                  <th>Present Property tax:</th>
                  
                </tr>
                
            
<%
        }
     MyDatabase mdb=new MyDatabase(application);
    ResultSet rst1 = mdb.viewByOrganisation(uidai_no,org_id);

    while(rst1.next())
    { 
        if(org_id.equals("1"))
        {
            
            String stream = rst1.getString("stream_of_qualification");
            String institute = rst1.getString("institution_name");
            String year = rst1.getString("year_of_passing");
            System.out.println("hye");
%>              
                                                    <tr>
                                                      
                                                        <td><%= stream %></td>
                                                        <td><%= institute %></td>
                                                        <td><%= year %></td>
                                                        
                                                    </tr>           
              


<%
    }
    else if(org_id.equals("2"))
    {
        String bank_name = rst1.getString("bank_name");
        String account_number = rst1.getString("account_number");
        String account_open_date = rst1.getString("account_open_date");
        String account_balance = rst1.getString("account_balance");
        String loan_amount = rst1.getString("loan_amount");
        String insurance_amount = rst1.getString("insurance_amount");
%>
                
                <tr>
                  
                  <td><%= bank_name %></td>
                
                  <td><%= account_number %></td>
               
                  <td><%= account_open_date %></td>
                
                  <td><%= account_balance %></td>
                
                  <td><%= loan_amount %></td>
                
                  <td><%= insurance_amount %></td>
                </tr>
<%
    }
    else if(org_id.equals("3"))
    {
        String annual_salary= rst1.getString("annual_salary");
        String last_tax_amount = rst1.getString("last_tax_payed_amount");
        String last_tax_date=rst1.getString("last_tax_payed_time");
        String tax_amount =rst1.getString("income_tax");

%>
                <tr>
                  
                  <td><%= annual_salary %></td>
                
                  <td><%= last_tax_amount %></td>
               
                  <td><%= last_tax_date %></td>
                
                  <td><%= tax_amount %></td>
          
         
                </tr>
                
                
<%
    }
    else if(org_id.equals("4"))
    { 
        String treatment_name = rst1.getString("treatment_name");
        String hospital_name = rst1.getString("hospital_name");
        String hospital_address = rst1.getString("hospital_address");
        String hospital_expenses = rst1.getString("hospital_expenses");
        String treatment_year = rst1.getString("treatment_year");
%>                
                
                <tr>
                 
                  <td><%= treatment_name %></td>
                
                  <td><%= hospital_name %></td>
             
                  <td><%= hospital_address %></td>
                
                  <td><%= hospital_expenses %></td>
                
                  <td><%= treatment_year %></td>
                </tr>
<%
    }
    else if(org_id.equals("5"))
    {
        String license_number = rst1.getString("license_number");
        String vehicle_number = rst1.getString("vehicle_number");
        String vehicle_type = rst1.getString("vehicle_type");
        String registration_year = rst1.getString("registration_year");
        String vehicle_color = rst1.getString("vehicle_color");
%>                
               
                <tr>
                  
                  <td><%= license_number %></td>
               
                  <td><%= vehicle_number %></td>
               
                  <td><%= vehicle_type %></td>
                
                  <td><%= registration_year %></td>
             
                  <td><%= vehicle_color %></td>
                </tr>
<%
    }
    else if(org_id.equals("6"))
    {
        String means_of_travel = rst1.getString("means_of_travel");
        String travel_departure_date = rst1.getString("travel_departure_date");
        String travel_arrival_date = rst1.getString("travel_arrival_date");
        String travel_expense = rst1.getString("travel_expense");
%>
                
                <tr>
                 
                  <td><%= means_of_travel %></td>
                
                  <td><%= travel_departure_date %></td>
                
                  <td><%= travel_arrival_date %></td>
              
                  <td><%= travel_expense %></td>
                </tr>
<%
    }
    else if(org_id.equals("7"))
    {
        String passport_number = rst1.getString("passport_number");
        String place_of_issue = rst1.getString("place_of_issue");
        String passport_issue_date = rst1.getString("passport_issue_date");
        String passport_expiry_date = rst1.getString("passport_issue_date");
%>          
                <tr>
                  
                  <td><%= passport_number %></td>
                
                  <td><%= place_of_issue %></td>
                
                  <td><%= passport_issue_date %></td>
                
                  <td><%= passport_expiry_date %></td>
                </tr>
<%
    }
    else if(org_id.equals("8"))
    {
        String case_no = rst1.getString("case_no");
        String case_details = rst1.getString("case_details");
        String case_year = rst1.getString("year");
        String state = rst1.getString("state");
        String status_of_case = rst1.getString("status_of_case");
%>                 
               
                <tr>
                 
                  <td><%= case_no %></td>
               
                  <td><%= case_details %></td>
              
                  <td><%= case_year %></td>
               
                  <td><%= state %></td>
                
                  <td><%= status_of_case %></td>
                </tr>
<%
    }
    else if(org_id.equals("9"))
    {
        String property_area = rst1.getString("property_area");
        String property_value = rst1.getString("property_value");
        String last_tax_payed_amount = rst1.getString("last_tax_payed_amount");
        String last_tax_payed_time = rst1.getString("last_tax_payed_time");
        String property_tax = rst1.getString("property_tax");
%>   
        
                <tr>
                
                  <td><%= property_area %></td>
                
                  <td><%= property_value %></td>
            
                  <td><%= last_tax_payed_amount %></td>
                
                  <td><%= last_tax_payed_time %></td>
               
                  <td><%= last_tax_payed_time %></td>
            
                  <td><%= property_tax %></td>
                </tr>
                

<%
        }
    
 else if(org_id.equals("0"))
    {
        String name = rst1.getString("user_name");
        String father_name = rst1.getString("father_name");
        String mother_name = rst1.getString("mother_name");
        String phone_no = rst1.getString("phone_no");
        String blood_group = rst1.getString("blood_group");
        String paddress = rst1.getString("permanent_address");
        String caddress = rst1.getString("correspondence_address");
        String email = rst1.getString("Email");
        String occupation = rst1.getString("occupation");
        String qualification = rst1.getString("qualification");
        String gender = rst1.getString("gender");
        String region = rst1.getString("region");
        String category = rst1.getString("category");
        String date_of_birth = rst1.getString("date_of_birth");
        String photo = rst1.getString("photo");
        String signature = rst1.getString("signature");
        
        photo = photo.substring(photo.indexOf("userimages"));
        signature = signature.substring(signature.indexOf("userimages"));
        photo = photo.replaceAll("\\\\","/");
        signature = signature.replaceAll("\\\\","/");   
%>  
                <tr>
                    <th><font size="2px"color="#007bff">PERSONAL DETAILS</font></th>
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
    }
else if(org_id.equals("10"))
{

        String adhaar_card = rst1.getString("adhaar_card");
        String matric_certificate = rst1.getString("matric_certificate");
        String passport = rst1.getString("passport");
        String pan_card = rst1.getString("pan_card");
        String license = rst1.getString("license");
        String category_certificate = rst1.getString("category_certificate");
        
        adhaar_card = adhaar_card.replaceAll("\\\\","/");
        matric_certificate = matric_certificate.replaceAll("\\\\","/");
        passport = passport.replaceAll("\\\\","/");
        pan_card = pan_card.replaceAll("\\\\","/");
        license = license.replaceAll("\\\\","/");
        category_certificate = category_certificate.replaceAll("\\\\","/");
%>
                <tr>
                    <th><font size="2px"color="#007bff">PROOFS</font></th>
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
}
   
%>
 
</body>




