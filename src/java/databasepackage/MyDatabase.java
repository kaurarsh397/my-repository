
package databasepackage;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;


public class MyDatabase {
    static Connection con;
    public MyDatabase(ServletContext context)
    {
        
        if (con==null)
        {
            String dbdriver = context.getInitParameter("dbdriver");
            String dbconnectionurl = context.getInitParameter("dbconnectionurl");
            String dbusername = context.getInitParameter("dbusername");
            String dbpassword = context.getInitParameter("dbpassword");
        
            try {
                Class.forName(dbdriver);
                con =DriverManager.getConnection(dbconnectionurl,dbusername,dbpassword);
                }catch(Exception e)
                {
                    System.out.println("Problem in Database Connection : "+e);
                    e.printStackTrace();
                }
        } 
    }
    
    public String getUserId()
    {
        String userId=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details ");
                    ResultSet rst=pst.executeQuery();
                    rst.afterLast();
                    if(rst.previous())
                    {
                        userId=rst.getString("user_id");
                    }
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userId;
    }
    
     public int photoUpload(File[] files, String userid)
   {
       int n=-1;
        try {
            PreparedStatement pstmt=con.prepareStatement("update uidai_db.user_details set photo=?, signature=? where user_id=?");
           
            pstmt.setString(1,files[0].getAbsolutePath().substring(files[0].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(2,files[1].getAbsolutePath().substring(files[1].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(3, userid);
     
            n=pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return n;
   }
   
   
   public boolean SPlogin(String username,String password)
    {
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.service_provider where (provider_username=? and provider_password=?)");
            pst.setString(1,username);
            pst.setString(2,password);
           ResultSet rst=pst.executeQuery();
           if(rst.next())
           {
               userExists=true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userExists;
        
    }
   
   public boolean userLogin(String username,String password)
    {
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=? and uidai_password=?");
            pst.setString(1,username);
            pst.setString(2,password);
            ResultSet rst=pst.executeQuery();
            if(rst.next())
            {
                userExists=true;
            }           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(userExists);
        return userExists;        
    }
   
   public boolean userDetails(String name, String father_name,String mother_name, String birth_date,String gender,String location,String email, String blood_group,String phone_number,String category,String paddress,String pdistrict,String pcity,String pstate,
            String caddress,String cdistrict,String ccity,String cstate,String qualification, String occupation)
    {
        String Paddress=(paddress+","+pdistrict+","+pcity+","+pstate);
        System.out.println(paddress+","+pdistrict+","+pcity+","+pstate);
        String Caddress=(caddress+","+cdistrict+","+ccity+","+cstate);
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.user_details(user_name,father_name,mother_name,date_of_birth,gender,phone_no,email,category,region,blood_group,permanent_address,correspondence_address,qualification,occupation)  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1,name);
            pst.setString(2,father_name);
            pst.setString(3,mother_name);
            pst.setString(4,birth_date);
            pst.setString(5,gender);
            pst.setString(6,phone_number);
            pst.setString(7,email);
            pst.setString(8,category);
            pst.setString(9,location);
            pst.setString(10,blood_group);
            pst.setString(11,Paddress);
            pst.setString(12,Caddress);
            pst.setString(13,qualification);
            pst.setString(14,occupation);
            
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
    
     public ResultSet services()
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.services");
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    } 
   
   public ResultSet organisations()
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.organisations");
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
   
   public ResultSet loginform(String service_name)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst = con.prepareStatement("select * from uidai_db.services where service_name=?");
            pst.setString(1, service_name);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
   
   public ResultSet loginformbody(String loginform_id)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst = con.prepareStatement("Select * from uidai_db.loginform where loginform_id=? ");
            pst.setString(1, loginform_id);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public ResultSet footerlinks()
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.footer");
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    } 
   
    public ResultSet footer(String footerlink_id)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("select * from uidai_db.footer where footerlink_id=? ");
            pst.setString(1, footerlink_id);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
   
    public ResultSet footerpage(String footerpage_id)
    {
        ResultSet rst1=null;
        try {
            PreparedStatement pst = con.prepareStatement("select page_name, page_heading1, page_heading2, page_description from uidai_db.pages where footerpage_id=?");
            pst.setString(1, footerpage_id);
            rst1=pst.executeQuery();
            System.out.println(footerpage_id + " " + rst1);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return rst1;
    }
    
    public boolean Adminlogin(String username,String password)
    {
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.admin where (admin_username=? and admin_password=?)");
            pst.setString(1,username);
            pst.setString(2,password);
           ResultSet rst=pst.executeQuery();
           if(rst.next())
           {
               userExists=true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userExists;
        
    }
    
    public ResultSet proofs()
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.proof");
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
     public int proofUpload(File[] files,String userid)
   {
       int n=-1;
        try {
            PreparedStatement pstmt=con.prepareStatement("insert into uidai_db.proof_details(user_id,adhaar_card,matric_certificate,passport,pan_card,license,category_certificate) values (?,?,?,?,?,?,?)");
            pstmt.setString(1,userid);
            pstmt.setString(2,(files[0]==null) ? "null" : files[0].getAbsolutePath().substring(files[0].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(3,(files[1]==null) ? "null" : files[1].getAbsolutePath().substring(files[1].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(4,(files[2]==null) ? "null" : files[2].getAbsolutePath().substring(files[2].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(5,(files[3]==null) ? "null" : files[3].getAbsolutePath().substring(files[3].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(6,(files[4]==null) ? "null" : files[4].getAbsolutePath().substring(files[4].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(7,(files[5]==null) ? "null" : files[5].getAbsolutePath().substring(files[5].getAbsolutePath().indexOf("userimages")));
     
            n=pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return n;
   }
    
    public ResultSet viewDetails(String uidai_no, String date_of_birth)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=? and date_of_birth=?");
            pst.setString(1,uidai_no);
            pst.setString(2,date_of_birth);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public int updateDetails(String name, String father_name, String mother_name, String gender, String location, String phone_no, String email, String category, String paddress, String caddress, String qualification, String occupation, String blood_group, String uidai_no, String date_of_birth) 
    {
        int n=0; 
        try {
            PreparedStatement pst=con.prepareStatement("update uidai_db.user_details set user_name=?,"
                    + "father_name=?,mother_name=?,gender=?,category=?,region=?,phone_no=?,email=?,"
                    + "permanent_address=?,correspondence_address=?,qualification=?,occupation=?,"
                    + "blood_group=? where uidai_no=? and date_of_birth=?");
            pst.setString(1,name);
            pst.setString(2,father_name);
            pst.setString(3,mother_name);
            pst.setString(4,gender);
            pst.setString(5,category);
            pst.setString(6,location);
            pst.setString(7,phone_no);
            pst.setString(8,email);
            pst.setString(9,paddress);
            pst.setString(10,caddress);
            pst.setString(11,qualification);
            pst.setString(12,occupation);
            pst.setString(13,blood_group);
            pst.setString(14,uidai_no);
            pst.setString(15,date_of_birth);
            
            n = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        System.out.println("n = " + n);
        
        return n;
    }
    
    public ResultSet viewMyUID(String uidai_no, String uidai_password)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=? and uidai_password=?");
            pst.setString(1,uidai_no);
            pst.setString(2,uidai_password);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public boolean lostUID(String name,String email)
    {
        System.out.println(name +"   "+email);
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where (user_name=? and email=?)");
            pst.setString(1,name);
            pst.setString(2,email);
           ResultSet rst=pst.executeQuery();
           if(rst.next())
           {
               userExists=true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userExists;        
    }
    
    public ResultSet sendUID(String name, String email)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where user_name=? and email=?");
            pst.setString(1,name);
            pst.setString(2,email);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public ResultSet getUID()
    {
        ResultSet rst=null;
        int n=0;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details ");
                    rst=pst.executeQuery();
                    
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    public void updateUIDno(long uidno,int password,String userid)
    {
        int n=-1,m=-1;
        String uidNo=String.valueOf(uidno);
        String pass=String.valueOf(password);
        try {
            PreparedStatement pstmt=con.prepareStatement("update uidai_db.user_details set uidai_no=?, uidai_password=? where user_id=?");
           
            pstmt.setString(1,uidNo);
            pstmt.setString(2,pass);
            pstmt.setString(3, userid);
     
            n=pstmt.executeUpdate();
            PreparedStatement pst=con.prepareStatement("update uidai_db.proof_details set uidai_no=? where user_id=?");
            pst.setString(1,uidNo);
            pst.setString(2, userid);
     
            m=pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
    
    
    
    public boolean bankDetails(String uidai_no,String bank_name,String account_number,String account_open_date,String account_balance,String loan_amount,String insurance_amount)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.bank_details(uidai_no,bank_name,account_number,account_open_date,account_balance,loan_amount,insurance_amount) values(?,?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,bank_name);
            pst.setString(3,account_number);
            pst.setString(4,account_open_date);
            pst.setString(5,account_balance);
            pst.setString(6,loan_amount);
            pst.setString(7,insurance_amount);
           
            
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
    
       public boolean educationDetails(String uidai_no,String highest_qualification,String stream_of_qualification,String institution_name,String year_of_passing)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.educational_details(uidai_no,highest_qualification,stream_of_qualification,institution_name,year_of_passing) values(?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,highest_qualification);
            pst.setString(3,stream_of_qualification);
            pst.setString(4,institution_name);
            pst.setString(5,year_of_passing);   
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
       public boolean incometaxDetails(String uidai_no,String annual_salary,String last_tax_payed_amount,String last_tax_payed_time,String income_tax)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.incometax_details(uidai_no,annual_salary,last_tax_payed_amount,last_tax_payed_time,income_tax) values(?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,annual_salary);
            pst.setString(3,last_tax_payed_amount);
            pst.setString(4,last_tax_payed_time);
            pst.setString(5,income_tax);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
        public boolean medicalDetails(String uidai_no,String treatment_name,String hospital_name,String hospital_address,String hospital_expenses,String treatment_year)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.medical_details(uidai_no,treatment_name,hospital_name,hospital_address,hospital_expenses,treatment_year) values(?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,treatment_name);
            pst.setString(3,hospital_name);
            pst.setString(4,hospital_address);
            pst.setString(5,hospital_expenses);
            pst.setString(6,treatment_year);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
        
         public boolean rtoDetails(String uidai_no,String license_number,String vehicle_number,String vehicle_type,String registration_year,String vehicle_color)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.rto_details(uidai_no,license_number,vehicle_number,vehicle_type,registration_year,vehicle_color) values(?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,license_number);
            pst.setString(3,vehicle_number);
            pst.setString(4,vehicle_type);
            pst.setString(5,registration_year);
            pst.setString(6,vehicle_color);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
         
          public boolean travelDetails(String uidai_no,String means_of_travel,String travel_departure_date,String travel_arrival_date,String travel_expense)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.travel_details(uidai_no,means_of_travel,travel_departure_date,travel_arrival_date,travel_expense) values(?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,means_of_travel);
            pst.setString(3,travel_departure_date);
            pst.setString(4,travel_arrival_date);
            pst.setString(5,travel_expense);
         
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
          
           public boolean passportDetails(String uidai_no,String passport_number,String place_of_issue,String birth_date,String place_of_birth,String passport_issue_date,String passport_expiry_date)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.passport_details(uidai_no,passport_number,place_of_issue,birth_date,place_of_birth,passport_issue_date,passport_expiry_date) values(?,?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,passport_number);
            pst.setString(3,place_of_issue);
            pst.setString(4,birth_date);
            pst.setString(5,place_of_birth);
            pst.setString(6,passport_issue_date);
            pst.setString(7,passport_expiry_date);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
           
            public boolean policeDetails(String uidai_no,String case_no,String case_details,String year,String state,String status_of_case)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.police_details(uidai_no,case_no,case_details,year,state,status_of_case) values(?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,case_no);
            pst.setString(3,case_details);
            pst.setString(4,year);
            pst.setString(5,state);
            pst.setString(6,status_of_case);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
            
              public boolean propertytaxDetails(String uidai_no,String property_area,String property_value,String last_tax_payed_amount,String last_tax_payed_time,String property_tax)
    {
        boolean isInserted = false;
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.property_details(uidai_no,property_area,property_value,last_tax_payed_amount,last_tax_payed_time,property_tax) values(?,?,?,?,?,?)");
            pst.setString(1,uidai_no);
            pst.setString(2,property_area);
            pst.setString(3,property_value);
            pst.setString(4,last_tax_payed_amount);
            pst.setString(5,last_tax_payed_time);
            pst.setString(6,property_tax);
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
    }
              
    public boolean Organisationlogin(String username,String password,String organisation_id)
    {
        System.out.println(username+" "+password+" "+organisation_id);
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.organisation_login where organisation_id=?");
           
            pst.setString(1,organisation_id);
           ResultSet rst=pst.executeQuery();
           while(rst.next())
           {
               String uname=rst.getString("organisation_username");
               String pass=rst.getString("organisation_password");
               if(uname.equals(username) && pass.equals(password))
               {
               userExists=true;
               }
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userExists;   
    } 
    
    public int changePassword(String uidai_no,String new_password,String old_password)
    {
        int n=-1;
      
        try {
            PreparedStatement pstmt=con.prepareStatement("update uidai_db.user_details set uidai_password=? where uidai_no=? and uidai_password=?");
           
            pstmt.setString(1,new_password);
            pstmt.setString(2,uidai_no);   
             pstmt.setString(3,old_password);
            n=pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public ResultSet viewAllUsers()
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details ");
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    public ResultSet viewPersonalDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
    
    
    
    public ResultSet viewEducationalDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.educational_details where uidai_no=?");
            pst.setString(1,uidai_no);
      //      pst.setString(2,uidai_password);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(uidai_no+"hihihi");
        return rst;
        
    }
      public ResultSet viewBankDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.bank_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    }
        public ResultSet viewHospitalDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.medical_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    }
             public ResultSet viewrtoDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.rto_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    }
     public ResultSet viewTravelDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.travel_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    }
      public ResultSet viewPassportDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.passport_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    }
      public ResultSet viewPoliceDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.police_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    } 
       public ResultSet viewIncomeTaxDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.incometax_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    } 
       public ResultSet viewPropertyTaxDetails(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.property_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;        
    }
       
    public ResultSet viewProofs(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.proof_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
            
                    } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;        
    }   
     
    public ResultSet getPath(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    } 
         
          public ResultSet getProofPath(String uidai_no)
    {
        ResultSet rst=null;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.proof_details where uidai_no=?");
            pst.setString(1,uidai_no);
            rst=pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
        
    } 
          
          public int proofUploadUpdate(File[] files,String userid, String[] proof)
   {
       int n=-1;
        try {
            PreparedStatement pstmt=con.prepareStatement("update uidai_db.proof_details set adhaar_card=?, matric_certificate=?, passport=?, pan_card=?, license=?, category_certificate=? where user_id=?");           
            pstmt.setString(7,userid);
            pstmt.setString(1,(files[0]==null) ? proof[0] : files[0].getAbsolutePath().substring(files[0].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(2,(files[1]==null) ? proof[1] : files[1].getAbsolutePath().substring(files[1].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(3,(files[2]==null) ? proof[2] : files[2].getAbsolutePath().substring(files[2].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(4,(files[3]==null) ? proof[3] : files[3].getAbsolutePath().substring(files[3].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(5,(files[4]==null) ? proof[4] : files[4].getAbsolutePath().substring(files[4].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(6,(files[5]==null) ? proof[5] : files[5].getAbsolutePath().substring(files[5].getAbsolutePath().indexOf("userimages")));
     
            n=pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return n;
   }
          
   public int photoUploadUpdate(File[] files, String userid, String[] photo)
   {
       int n=-1;
        try {
            PreparedStatement pstmt=con.prepareStatement("update uidai_db.user_details set photo=?, signature=? where user_id=?");
           System.out.println("db photo : " + photo[0]);
            pstmt.setString(1,(files[0]==null) ? photo[0] : files[0].getAbsolutePath().substring(files[0].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(2,(files[1]==null) ? photo[1] : files[1].getAbsolutePath().substring(files[1].getAbsolutePath().indexOf("userimages")));
            pstmt.setString(3, userid);
     
            n=pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return n;
   }   
    public boolean addProvider(String name,String email,String city,String username,String password)
    {
        boolean isInserted = false;
        if(name.equals("") || email.equals("") || city.equals("") || username.equals("") || password.equals(""))
        {
            return isInserted;
        }
        else{
        try
        {
            PreparedStatement pst = con.prepareStatement("insert into uidai_db.service_provider(provider_name,provider_email,provider_city,provider_username,provider_password) values(?,?,?,?,?)");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,city);
            pst.setString(4,username);
            pst.setString(5,password);
           
            int noOfRecordsAffected = pst.executeUpdate();

            if(noOfRecordsAffected == 1)
                isInserted = true;
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return isInserted;
        }
    } 
    public ResultSet serviceProviderList()
    {
        ResultSet rst=null;
         try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.service_provider ");
           
           rst=pst.executeQuery();
       
           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rst;
    }
   public ResultSet viewByOrganisation(String uidai_no, String org_id)
    {
        ResultSet rst=null;
        PreparedStatement pst=null;
        try {
            if(org_id.equals("1"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.educational_details where uidai_no=?");
            }
            else if(org_id.equals("2"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.bank_details where uidai_no=?");
            }
            else if(org_id.equals("3"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.incometax_details where uidai_no=?");
            }
            else if(org_id.equals("4"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.medical_details where uidai_no=?");
            }
            else if(org_id.equals("5"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.rto_details where uidai_no=?");
            }
            else if(org_id.equals("6") )
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.travel_details where uidai_no=?");
            }
            else if(org_id.equals("7"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.passport_details where uidai_no=?");
            }
            else if(org_id.equals("8"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.police_details where uidai_no=?");
            }
            else if(org_id.equals("9"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.property_details where uidai_no=?");
            }
             else if(org_id.equals("0"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.user_details where uidai_no=?");
            }
            else if(org_id.equals("10"))
            {
                pst=con.prepareStatement("SELECT * FROM uidai_db.proof_details where uidai_no=?");
            }
                pst.setString(1,uidai_no);
                rst=pst.executeQuery();
                 
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rst;
    }
  
    public ResultSet viewAllStateUsers(String state)
    {
       
       ResultSet rst=null;
      
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where permanent_address LIKE '%"+state+"%' OR correspondence_address LIKE '%"+state+"%'");
          
            rst=pst.executeQuery();
    
            }
            
                            catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
       return rst;
   }
    public boolean deleteUID(String uid_no)
    {
        
        boolean b=true;
        try {
            PreparedStatement pst=con.prepareStatement("delete from uidai_db.user_details where uidai_no=?");
          pst.setString( 1,uid_no);     
         int n= pst.executeUpdate();
            
             PreparedStatement pst1=con.prepareStatement("delete from uidai_db.travel_details where uidai_no=?");
              pst1.setString( 1,uid_no);
            int n1=pst1.executeUpdate();
            
             PreparedStatement pst2=con.prepareStatement("delete from uidai_db.rto_details where uidai_no=?");
              pst2.setString( 1,uid_no);
            int n2=pst2.executeUpdate();
            
             PreparedStatement pst3=con.prepareStatement("delete from uidai_db.property_details where uidai_no=?");
              pst3.setString( 1,uid_no);
            int n3=pst3.executeUpdate();
            
             PreparedStatement pst4=con.prepareStatement("delete from uidai_db.proof_details where uidai_no=?");
              pst4.setString( 1,uid_no);
            int n4=pst4.executeUpdate();
            
             PreparedStatement pst5=con.prepareStatement("delete from uidai_db.police_details where uidai_no=?");
              pst5.setString( 1,uid_no);
            int n5=pst5.executeUpdate();
            
             PreparedStatement pst6=con.prepareStatement("delete from uidai_db.passport_details where uidai_no=?");
              pst6.setString( 1,uid_no);
            int n6=pst6.executeUpdate();
            
             PreparedStatement pst7=con.prepareStatement("delete from uidai_db.medical_details where uidai_no=?");
              pst7.setString( 1,uid_no);
            int n7=pst7.executeUpdate();
            
             PreparedStatement pst8=con.prepareStatement("delete from uidai_db.incometax_details where uidai_no=?");
              pst8.setString( 1,uid_no);
            int n8=pst8.executeUpdate();
            
             PreparedStatement pst9=con.prepareStatement("delete from uidai_db.educational_details where uidai_no=?");
              pst9.setString( 1,uid_no);
            int n9=pst9.executeUpdate();
            
             PreparedStatement pst10=con.prepareStatement("delete from uidai_db.bank_details where uidai_no=?");
              pst10.setString( 1,uid_no);
            int n10=pst10.executeUpdate();
            System.out.println(n+"   "+n1+"  "+n2+"  "+n3+"  "+n4+" "+n5+" "+n6+" "+n7+" "+n8+ " "+n9+" "+n10+ " hiiiii");
    if(n==1||n1==1||n2==1||n3==1||n4==1||n5==1||n6==1||n7==1||n8==1||n9==1||n10==1){
        b=false;  
    }
    System.out.println(b +"  atabase");
        }
            
                            catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
         System.out.println(b +"  atabase");
        return b;
    }
    
    public ResultSet checkUser(String uidai_no)
    {
        ResultSet rst=null;
           try
        {
            PreparedStatement pst = con.prepareStatement("Select * from uidai_db.user_details where uidai_no=?");
            pst.setString(1,uidai_no);
          
           
           rst = pst.executeQuery();
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return rst;
    }
    
    public boolean updateEmail(String uidai_no)
    {
        boolean userExists=false;
        try {
            PreparedStatement pst=con.prepareStatement("Select * from uidai_db.user_details where uidai_no=?");
            pst.setString(1,uidai_no);
            ResultSet rst=pst.executeQuery();
            if(rst.next())
            {
                userExists=true;
            }           
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userExists;        
    } 
}
