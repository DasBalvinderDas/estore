package eManage.dao;

import java.util.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eManage.ConnectionManager;

import eManage.model.StaffBean;


public class StaffDAO {
	static Connection currentCon = null;
	static Statement stmt=null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;

    static String  staff_name, staff_birth_date, staff_address, staff_contact_num, staff_salary, staff_position, staff_hire_date, staff_email, staff_password;
    static int staff_id;
    //login user
    public static StaffBean login(StaffBean bean) throws NoSuchAlgorithmException{
    	
    	staff_email = bean.getStaff_email();
    	staff_password = bean.getStaff_password();
    	
    	//convert password to md5
    	MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
    	mdAlgorithm.update(staff_password.getBytes());

    	byte[] digest = mdAlgorithm.digest();
    	StringBuffer hexString = new StringBuffer();
    	
    	for (int i = 0; i < digest.length; i++) {
    		staff_password = Integer.toHexString(0xFF & digest[i]);

    	    if (staff_password.length() < 2) {
    	    	staff_password = "0" + staff_password;
    	    }

    	    hexString.append(staff_password);
    	}
    	
    	 String searchQuery = "select * from staffs where staff_email='" + staff_email + "' AND staff_password='" + hexString.toString() + "'";
    	 
         System.out.println("Your email is " + staff_email);
         System.out.println("Your password is " + staff_password);
         System.out.println("Query: " + searchQuery);
         
         try {
             currentCon = ConnectionManager.getConnection();
             stmt = currentCon.createStatement();
             rs = stmt.executeQuery(searchQuery);
             boolean more = rs.next();

             // if user exists set the isValid variable to true
             if (more) {
             	String staff_email = rs.getString("staff_email");
            
            		System.out.println("Welcome " + staff_email);
                 bean.setStaff_email(staff_email);
                 bean.setValid(true);
            	}
            
             // if user does not exist set the isValid variable to false
             else if (!more) {
             	System.out.println("Sorry, you are not a registered user!");
             	bean.setValid(false);
             }
            
         }

         catch (Exception ex) {
             System.out.println("Log In failed: An Exception has occurred! " + ex);
         }
         
         finally {
             if (rs != null) {
                 try {
                     rs.close();
                 } catch (Exception e) {
                 }
                 rs = null;
             }

             if (stmt != null) {
                 try {
                     stmt.close();
                 } catch (Exception e) {
                 }
                 stmt = null;
             }

             if (currentCon != null) {
                 try {
                     currentCon.close();
                 } catch (Exception e) {
                 }

                 currentCon = null;
             }
         }

         return bean;
    }
    
    //add new staff (register)
    public void add(StaffBean bean) throws NoSuchAlgorithmException{
    	
    	staff_name = bean.getStaff_name();
    	staff_birth_date = bean.getStaff_birth_date();
    	staff_address = bean.getStaff_address();
    	staff_contact_num = bean.getStaff_contact_num();
    	staff_salary = bean.getStaff_salary();
    	staff_position = bean.getStaff_position();
    	staff_hire_date = bean.getStaff_hire_date();
    	staff_email = bean.getStaff_email();
    	staff_password = bean.getStaff_password();

    	//convert password to md5
    	MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
    	mdAlgorithm.update(staff_password.getBytes());

    	byte[] digest = mdAlgorithm.digest();
    	StringBuffer hexString = new StringBuffer();
    	
    	for (int i = 0; i < digest.length; i++) {
    		staff_password = Integer.toHexString(0xFF & digest[i]);

    	    if (staff_password.length() < 2) {
    	    	staff_password = "0" + staff_password;
    	    }

    	    hexString.append(staff_password);
    	}
    	
    	String md5pass = hexString.toString();
    	
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into staffs(staff_name,staff_birth_date,staff_address,staff_contact_num,staff_salary,staff_position,staff_hire_date,staff_email,staff_password)values(?,?,?,?,?,?,?,?,?)");
    		ps.setString(1,staff_name);
    		ps.setString(2,staff_birth_date);
    		ps.setString(3,staff_address); 
    		ps.setString(4,staff_contact_num);
    		ps.setString(5,staff_salary);
    		ps.setString(6,staff_position);
    		ps.setString(7,staff_hire_date);
    		ps.setString(8,staff_email);
    		ps.setString(9,md5pass);
    		ps.execute();
    	
    		System.out.println("Your email is " + staff_email);
    		System.out.println("Your password is " + staff_password);
            
    	}
    	  
    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}

    	finally {
    		if (ps != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			ps = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
    	}
    }
    
    public void edit(StaffBean bean) throws NoSuchAlgorithmException {

    	staff_id = bean.getStaff_id();
    	staff_name = bean.getStaff_name();
    	staff_birth_date = bean.getStaff_birth_date();
    	staff_address = bean.getStaff_address();
    	staff_contact_num = bean.getStaff_contact_num();
    	staff_salary = bean.getStaff_salary();
    	staff_position = bean.getStaff_position();
    	staff_hire_date = bean.getStaff_hire_date();
    	staff_email = bean.getStaff_email();
//    	staff_password = bean.getStaff_password();
//
//    	//convert password to md5
//    	MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
//    	mdAlgorithm.update(staff_password.getBytes());
//
//    	byte[] digest = mdAlgorithm.digest();
//    	StringBuffer hexString = new StringBuffer();
//    	
//    	for (int i = 0; i < digest.length; i++) {
//    		staff_password = Integer.toHexString(0xFF & digest[i]);
//
//    	    if (staff_password.length() < 2) {
//    	    	staff_password = "0" + staff_password;
//    	    }
//
//    	    hexString.append(staff_password);
//    	}
//    	
//    	String md5pass = hexString.toString();
       
        String searchQuery = "UPDATE staffs SET staff_name='" + staff_name + "', staff_birth_date='" + staff_birth_date + "', staff_address='" + staff_address + "', staff_contact_num= '"+ staff_contact_num + "' , staff_salary='" +staff_salary+ "' , staff_position='" +staff_position+ "' , staff_hire_date= '"+staff_hire_date+"' , staff_email= '"+staff_email+"' WHERE staff_id= '" + staff_id + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void delete(int staff_id) {
        try {
            ps = currentCon.prepareStatement("delete from staffs where staff_id=?");
            // Parameters start with 1
            ps.setInt(1, staff_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }    
    
  //list order 
    public List<StaffBean> getAllStaff(){
    	
      List<StaffBean> staffs = new ArrayList<StaffBean>();
      
      try {
      	currentCon = ConnectionManager.getConnection();
      	stmt = currentCon.createStatement();
      
      	  String sql = "select * from staffs";
          ResultSet rs = stmt.executeQuery(sql);
          
          while (rs.next()) {
              StaffBean staff = new StaffBean();
              staff.setStaff_id(rs.getInt("staff_id"));
              staff.setStaff_name(rs.getString("staff_name"));
              staff.setStaff_contact_num(rs.getString("staff_contact_num"));
              staff.setStaff_salary(rs.getString("staff_salary"));
              staff.setStaff_position(rs.getString("staff_position"));
              staff.setStaff_hire_date(rs.getString("staff_hire_date"));
              staffs.add(staff);
          }
          
      } catch (SQLException e) {
          e.printStackTrace();
      }
      

      return staffs;
    }
    
  //get staff by staffid
    public StaffBean getStaffById(int staffid) {
    	StaffBean staff = new StaffBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from staffs where staff_id=?");
            
            ps.setInt(1, staffid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                staff.setStaff_id(rs.getInt("staff_id"));
                staff.setStaff_name(rs.getString("staff_name"));
                staff.setStaff_birth_date(rs.getString("staff_birth_date"));
                staff.setStaff_address(rs.getString("staff_address"));
                staff.setStaff_contact_num(rs.getString("staff_contact_num"));
                staff.setStaff_salary(rs.getString("staff_salary"));
                staff.setStaff_position(rs.getString("staff_position"));
                staff.setStaff_hire_date(rs.getString("staff_hire_date"));
                staff.setStaff_email(rs.getString("staff_email"));
                staff.setStaff_password(rs.getString("staff_password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staff;
    }
    
    public void updatepassword(StaffBean bean) throws NoSuchAlgorithmException {

    	staff_id = bean.getStaff_id();
    	staff_password = bean.getStaff_password();
    	
    	//convert password to md5
    	MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
    	mdAlgorithm.update(staff_password.getBytes());

    	byte[] digest = mdAlgorithm.digest();
    	StringBuffer hexString = new StringBuffer();
    	
    	for (int i = 0; i < digest.length; i++) {
    		staff_password = Integer.toHexString(0xFF & digest[i]);

    	    if (staff_password.length() < 2) {
    	    	staff_password = "0" + staff_password;
    	    }

    	    hexString.append(staff_password);
    	}
    	
    	String md5pass = hexString.toString();
       
        String searchQuery = "UPDATE staffs SET staff_password= '"+md5pass+"' WHERE staff_id= '" + staff_id + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    
