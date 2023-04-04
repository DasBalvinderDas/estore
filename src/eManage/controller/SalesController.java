package eManage.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eManage.model.ProductBean;
import eManage.model.SalesBean;
import eManage.model.StaffBean;
import eManage.dao.ProductDAO;
import eManage.dao.SalesDAO;


/**
 * Servlet implementation class SalesController
 */

public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST = "/sales.jsp";

	String forward="";
	
	private SalesDAO dao;
	private ProductDAO Productdao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesController() {
        super();
        dao = new SalesDAO();
        Productdao = new ProductDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		 if (action.equalsIgnoreCase("SalesAdd")){
			 forward = LIST;
				try {            
					request.setAttribute("products", Productdao.getAllProduct());
					request.setAttribute("sales", dao.getAllSalesProduct());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        else if (action.equalsIgnoreCase("SalesDelete")){
	        	int salesid = Integer.parseInt(request.getParameter("salesid"));
	            dao.delete(salesid);
//	            forward = DELETE;
	            request.setAttribute("sales", dao.getAllSalesProduct());    
	        }
		  
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		int productid = Integer.parseInt(request.getParameter("product_name"));
		int productsellprice = 0;
		try {
			productsellprice = ProductDAO.getProductSellPriceById(productid);
		} catch (NoSuchElementException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int quantity = Integer.parseInt(request.getParameter("product_quantity"));
		int amount = quantity * productsellprice;
		
		Date myDate = new Date();
		SalesBean sales = new SalesBean();
//		sales.setTransaction_id(Integer.parseInt(request.getParameter("transaction_id")));
		sales.setTransaction_date(new SimpleDateFormat("yyyy-MM-dd").format(myDate));
		sales.setProduct_name(request.getParameter("product_name"));
		sales.setProduct_sell_price(productsellprice);
		sales.setProduct_quantity(request.getParameter("product_quantity"));
        sales.setProduct_amount(amount);
        
//        String transactionid = request.getParameter("transaction_id");
//        if(transactionid == null || transactionid.isEmpty())
//        {
	        try {
				dao.add(sales);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//        }
//        else{
//            sales.setTransaction_id(Integer.parseInt(transactionid));
            try {
            	dao.add(sales);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//        }
        
//		HttpSession session = request.getSession();
//		session.setAttribute("transactionid", sales.getTransaction_id());
        response.sendRedirect("SalesController?action=SalesAdd");  
//        forward = LIST;
//		RequestDispatcher view = request.getRequestDispatcher(forward);
		try {
			request.setAttribute("products", Productdao.getAllProduct());
			request.setAttribute("sales", dao.getAllSalesProduct());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//        view.forward(request, response);
	}

}
