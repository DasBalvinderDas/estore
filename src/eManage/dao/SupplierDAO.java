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

import eManage.model.SupplierBean;

public class SupplierDAO {
	static Connection currentCon = null;
	static Statement stmt=null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;

    static String  supplier_name, supplier_address, supplier_contact_num, supplier_description;
    static int supplier_id;
    
    //add new product (register)
    public void add(SupplierBean bean) throws NoSuchAlgorithmException{
    	
    	supplier_name = bean.getSupplier_name();
    	supplier_address = bean.getSupplier_address();
    	supplier_contact_num = bean.getSupplier_contact_num();
    	supplier_description = bean.getSupplier_description();

    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into suppliers(supplier_name, supplier_address, supplier_contact_num, supplier_description)values(?,?,?,?)");
    		ps.setString(1,supplier_name);
    		ps.setString(2,supplier_address);
    		ps.setString(3,supplier_contact_num); 
    		ps.setString(4,supplier_description);
    		ps.execute();
    	
    		System.out.println("Your supplier is " + supplier_name);
    		System.out.println("Your supplier num is " + supplier_contact_num);
            
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
	
    public void edit(SupplierBean bean) throws NoSuchAlgorithmException {

    	supplier_id = bean.getSupplier_id();
    	supplier_name = bean.getSupplier_name();
    	supplier_address = bean.getSupplier_address();
    	supplier_contact_num = bean.getSupplier_contact_num();
    	supplier_description = bean.getSupplier_description(); 
       
        String searchQuery = "UPDATE suppliers SET supplier_name='" + supplier_name + "', supplier_address='" + supplier_address + "', supplier_contact_num='" + supplier_contact_num + "', supplier_description= '"+ supplier_description + "' WHERE supplier_id = '" + supplier_id + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void delete(int supplier_id) {
        try {
            ps = currentCon.prepareStatement("delete from suppliers where supplier_id=?");
            // Parameters start with 1
            ps.setInt(1, supplier_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //list order 
    public List<SupplierBean> getAllSupplier(){
    	
      List<SupplierBean> suppliers = new ArrayList<SupplierBean>();
      
      try {
      	currentCon = ConnectionManager.getConnection();
      	stmt = currentCon.createStatement();
      
      	  String sql = "select * from suppliers";
          ResultSet rs = stmt.executeQuery(sql);
          
          while (rs.next()) {
        	  SupplierBean supplier = new SupplierBean();
              supplier.setSupplier_id(rs.getInt("supplier_id"));
              supplier.setSupplier_name(rs.getString("supplier_name"));
              supplier.setSupplier_address(rs.getString("supplier_address"));
              supplier.setSupplier_contact_num(rs.getString("supplier_contact_num"));
              supplier.setSupplier_description(rs.getString("supplier_description"));
              suppliers.add(supplier);
          }
          
      } catch (SQLException e) {
          e.printStackTrace();
      }
      

      return suppliers;
    }
    
  //get staff by supplierid
    public SupplierBean getSupplierById(int supplierid) {
    	SupplierBean supplier = new SupplierBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from suppliers where supplier_id=?");
            
            ps.setInt(1, supplierid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                supplier.setSupplier_id(rs.getInt("supplier_id"));
                supplier.setSupplier_name(rs.getString("supplier_name"));
                supplier.setSupplier_address(rs.getString("supplier_address"));
                supplier.setSupplier_contact_num(rs.getString("supplier_contact_num"));
                supplier.setSupplier_description(rs.getString("supplier_description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return supplier;
    }
    
}
