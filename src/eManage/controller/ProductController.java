package eManage.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eManage.model.ProductBean;
import eManage.dao.ProductDAO;
import eManage.dao.SupplierDAO;

/**
 * Servlet implementation class ProductController
 */

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String ADD = "/product_add.jsp";
	private static String VIEW = "/product_view.jsp";
	private static String EDIT = "/product_edit.jsp";
	private static String LIST = "/product.jsp";
	String forward="";
	
	private ProductDAO dao;
	private SupplierDAO Supplierdao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        dao = new ProductDAO();
        Supplierdao = new SupplierDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
        if (action.equalsIgnoreCase("ProductList")){
            forward = LIST;
			try {
				request.setAttribute("products", dao.getAllProduct());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else if (action.equalsIgnoreCase("ProductView")){
            forward = VIEW;
            int productid = Integer.parseInt(request.getParameter("productid"));
            ProductBean product = dao.getProductById(productid);
            request.setAttribute("product", product);
        }
        else if (action.equalsIgnoreCase("ProductDelete")){
        	int productid = Integer.parseInt(request.getParameter("productid"));
            dao.delete(productid);
//            forward = DELETE;
            request.setAttribute("products", dao.getAllProduct());    
        }
        else if (action.equalsIgnoreCase("ProductEdit")){
            forward = EDIT;
            int productid = Integer.parseInt(request.getParameter("productid"));
            ProductBean product = dao.getProductById(productid);
            request.setAttribute("product", product);
        }
        else if (action.equalsIgnoreCase("ProductAdd")){
		forward = ADD;
			request.setAttribute("suppliers", Supplierdao.getAllSupplier());
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
		ProductBean product = new ProductBean();	
        product.setProduct_name(request.getParameter("product_name"));
        product.setProduct_description(request.getParameter("product_description"));
        product.setProduct_ori_price(request.getParameter("product_ori_price"));
        product.setProduct_sell_price(request.getParameter("product_sell_price"));
        product.setProduct_profit(request.getParameter("product_profit"));
        product.setProduct_quantity(request.getParameter("product_quantity"));
        product.setProduct_supplier(request.getParameter("product_supplier"));
        
		String productid = request.getParameter("product_id");
        if(productid == null || productid.isEmpty())
        {
        	try {
				dao.add(product);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else{
            product.setProduct_id(Integer.parseInt(productid));
            try {
				dao.edit(product);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

		forward = LIST;
		RequestDispatcher view = request.getRequestDispatcher(forward);
		try {
			request.setAttribute("products", dao.getAllProduct());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        view.forward(request, response);
//		doGet(request, response);
	}

}
