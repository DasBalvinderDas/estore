package eManage.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

import com.eManage.ConnectionManager;

import eManage.model.SalesBean;

public class SalesDAO {
	static Connection currentCon = null;
	static Statement stmt=null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;

    static String transaction_date, product_name, product_quantity;
	int product_sell_price;
	static int product_amount;
    static int transaction_id;
    
    //add new product (register)
    public void add(SalesBean bean) throws NoSuchAlgorithmException{
    	
    	//transaction_id = bean.getTransaction_id();
    	transaction_date = bean.getTransaction_date();
    	product_name = bean.getProduct_name();
    	product_quantity = bean.getProduct_quantity();
    	product_sell_price = bean.getProduct_sell_price();
    	product_amount = bean.getProduct_amount();  
    	
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into sales_product(transaction_id, transaction_date, product_name, product_quantity, product_sell_price, product_amount)values(?,?,?,?,?,?)");
    		ps.setInt(1,transaction_id);
    		ps.setString(2,transaction_date);
    		ps.setString(3,product_name); 
    		ps.setString(4,product_quantity);
    		ps.setInt(5,product_sell_price);
    		ps.setInt(6,product_amount);
    		ps.execute();
    	
//    		System.out.println("Your transaction date is " + transaction_date);
//    		System.out.println("Your product name is " + product_name);
            
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
    
    
	
//    public void edit(SalesBean bean) throws NoSuchAlgorithmException {
//
//    	transaction_id = bean.getTransaction_id();
//    	transaction_date = bean.getTransaction_date();
//    	product_name = bean.getProduct_name();
//    	product_quantity = bean.getProduct_quantity();
//    	product_sell_price = bean.getProduct_sell_price();
//    	product_amount = bean.getProduct_amount(); 	 
//       
//        String searchQuery = "UPDATE sales_product SET transaction_date='" + transaction_date + "', product_name='" + product_name + "', product_quantity='" + product_quantity + "', product_sell_price='" + product_sell_price + "', product_amount= '"+ product_amount + "' transaction_id = '" + transaction_id + "'";
//    	
//    	try {
//
//            currentCon = ConnectionManager.getConnection();
//            stmt = currentCon.createStatement();
//            stmt.executeUpdate(searchQuery);
//            
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//     
//    
    public void delete(int transaction_id) {
        try {
            PreparedStatement preparedStatement = currentCon.prepareStatement("delete from sales_product where transaction_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, transaction_id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
//    //list order 
    
    public List<SalesBean> getAllSalesProduct(){
    	
      List<SalesBean> sales = new ArrayList<SalesBean>();
      
      try {
      	currentCon = ConnectionManager.getConnection();
      	stmt = currentCon.createStatement();
      
      	  String sql = "select * from sales_product";
          ResultSet rs = stmt.executeQuery(sql);
          
          while (rs.next()) {
        	  SalesBean sale = new SalesBean();
        	  sale.setTransaction_id(rs.getInt("transaction_id"));
        	  sale.setTransaction_date(rs.getString("transaction_date"));
        	  sale.setProduct_name(rs.getString("product_name"));
        	  sale.setProduct_quantity(rs.getString("product_quantity"));
        	  sale.setProduct_sell_price(rs.getInt("product_sell_price"));
        	  sale.setProduct_amount(rs.getInt("product_amount"));
        	  sales.add(sale);
          }
          
      } catch (SQLException e) {
          e.printStackTrace();
      }
      

      return sales;
    }
    
	//get product_sell_price by productid
//    public static int getTransactionId() throws SQLException, NoSuchElementException {
//        try (Connection currentCon = ConnectionManager.getConnection();
//             PreparedStatement ps = currentCon.prepareStatement("select transaction_id from sales_product where transaction_id=?")) {
//
//            ps.setInt(1, transactionid);
//
//            try (ResultSet rs = ps.executeQuery()) { 
//                if (rs.next()) {
//                    return (rs.getInt("transaction_id"));
//                }
//            }
//        }
//
//        throw new NoSuchElementException(String.format("No product with id %d found", transactionid));
//    }
    
}
