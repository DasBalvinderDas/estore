package eManage.dao;

import java.util.*;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eManage.ConnectionManager;
import eManage.model.ProductBean;

	public class ProductDAO {
		static Connection currentCon = null;
		static Statement stmt=null;
		static ResultSet rs = null; 
		static PreparedStatement ps=null;
	
	    static String  product_name, product_description, product_ori_price, product_sell_price, product_profit, product_quantity, product_supplier;
	    static int product_id;
	    
	    //add new product (register)
	    public void add(ProductBean bean) throws NoSuchAlgorithmException{
	    	
	    	product_name = bean.getProduct_name();
	    	product_description = bean.getProduct_description();
	    	product_ori_price = bean.getProduct_ori_price();
	    	product_sell_price = bean.getProduct_sell_price();
	    	product_profit = bean.getProduct_profit();
	    	product_quantity = bean.getProduct_quantity();
	    	product_supplier = bean.getProduct_supplier();	   
	    	
	    	try {
	    		currentCon = ConnectionManager.getConnection();
	    		ps=currentCon.prepareStatement("insert into products(product_name, product_description, product_ori_price, product_sell_price, product_profit, product_quantity, product_supplier)values(?,?,?,?,?,?,?)");
	    		ps.setString(1,product_name);
	    		ps.setString(2,product_description);
	    		ps.setString(3,product_ori_price); 
	    		ps.setString(4,product_sell_price);
	    		ps.setString(5,product_profit);
	    		ps.setString(6,product_quantity);
	    		ps.setString(7,product_supplier);
	    		ps.execute();
	    	
	    		System.out.println("Your product name is " + product_name);
	    		System.out.println("Your product price is " + product_ori_price);
	            
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
	    
	    public void edit(ProductBean bean) throws NoSuchAlgorithmException {

	    	product_id = bean.getProduct_id();
	    	product_name = bean.getProduct_name();
	    	product_description = bean.getProduct_description();
	    	product_ori_price = bean.getProduct_ori_price();
	    	product_sell_price = bean.getProduct_sell_price();
	    	product_profit = bean.getProduct_profit();
	    	product_quantity = bean.getProduct_quantity();
	    	product_supplier = bean.getProduct_supplier();	 
	       
	        String searchQuery = "UPDATE products SET product_name='" + product_name + "', product_description='" + product_description + "', product_ori_price='" + product_ori_price + "', product_sell_price= '"+ product_sell_price + "' , product_profit='" +product_profit+ "' , product_quantity='" +product_quantity+ "' , product_supplier= '"+product_supplier+"'  WHERE product_id = '" + product_id + "'";
	    	
	    	try {

	            currentCon = ConnectionManager.getConnection();
	            stmt = currentCon.createStatement();
	            stmt.executeUpdate(searchQuery);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void delete(int product_id) {
	        try {
	            PreparedStatement preparedStatement = currentCon.prepareStatement("delete from products where product_id=?");
	            // Parameters start with 1
	            preparedStatement.setInt(1, product_id);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    //list order 
	    public List<ProductBean> getAllProduct(){
	    	
	      List<ProductBean> products = new ArrayList<ProductBean>();
	      
	      try {
	      	currentCon = ConnectionManager.getConnection();
	      	stmt = currentCon.createStatement();
	      
	      	  String sql = "select * from products";
	          ResultSet rs = stmt.executeQuery(sql);
	          
	          while (rs.next()) {
	        	  ProductBean product = new ProductBean();
	              product.setProduct_id(rs.getInt("product_id"));
	              product.setProduct_name(rs.getString("product_name"));
	              product.setProduct_ori_price(rs.getString("product_ori_price"));
	              product.setProduct_sell_price(rs.getString("product_sell_price"));
	              product.setProduct_profit(rs.getString("product_profit"));
	              product.setProduct_quantity(rs.getString("product_quantity"));
	              products.add(product);
	          }
	          
	      } catch (SQLException e) {
	          e.printStackTrace();
	      }
	      

	      return products;
	    }
	    
	  //get product by productid
	    public ProductBean getProductById(int productid) {
	    	ProductBean product = new ProductBean();
	        try {
	        	currentCon = ConnectionManager.getConnection();
	            ps=currentCon.prepareStatement("select * from products where product_id=?");
	            
	            ps.setInt(1, productid);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
		              product.setProduct_id(rs.getInt("product_id"));
		              product.setProduct_name(rs.getString("product_name"));
		              product.setProduct_description(rs.getString("product_description"));
		              product.setProduct_ori_price(rs.getString("product_ori_price"));
		              product.setProduct_sell_price(rs.getString("product_sell_price"));
		              product.setProduct_profit(rs.getString("product_profit"));
		              product.setProduct_quantity(rs.getString("product_quantity"));
		              product.setProduct_supplier(rs.getString("product_supplier"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return product;
	    }
	    
		//get product_sell_price by productid
	    public static int getProductSellPriceById(int productid) throws SQLException, NoSuchElementException {
	        try (Connection currentCon = ConnectionManager.getConnection();
	             PreparedStatement ps = currentCon.prepareStatement("select product_sell_price from products where product_id=?")) {

	            ps.setInt(1, productid);

	            try (ResultSet rs = ps.executeQuery()) { 
	                if (rs.next()) {
	                    return Integer.parseInt(rs.getString("product_sell_price"));
	                }
	            }
	        }

	        throw new NoSuchElementException(String.format("No product with id %d found", productid));
	    } 
	    
	}
	
	
