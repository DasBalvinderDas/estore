package eManage.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eManage.dao.ProductDAO;
import eManage.dao.StaffDAO;
import eManage.model.SaleInMonth;
import eManage.model.StaffBean;


/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN = "/login.jsp";
	private StaffDAO dao;
	private ProductDAO productdao;   
	String forward="";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        
        dao = new StaffDAO();
        productdao = new ProductDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String action = request.getParameter("action");
		
		forward = LOGIN;
		
		StaffBean staff = new StaffBean();
		staff.setStaff_email(request.getParameter("staff_email"));
		staff.setStaff_password(request.getParameter("staff_password"));
		
		try {
			staff = StaffDAO.login(staff);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(staff.isValid())
		{
			HttpSession session = request.getSession();
			session.setAttribute("currentSessionUser", staff.getStaff_email());
			 if (session == null || session.getAttribute("currentSessionUser") == null) {
			        // Forward the control to login.jsp if authentication fails or session expires
			        request.getRequestDispatcher("/jsp-projek/login.jsp").forward(request,
			            response);
			 }
			 else {
			populateMonthlySales(session);
			response.sendRedirect("/jsp-projek/index.jsp");
				 //request.getRequestDispatcher("/jsp-projek/index.jsp").forward(request,
				            //response);
			 }
			// logged-in page
		}
		else
		{
			request.setAttribute("errorMessage", "Invalid username or password");
			RequestDispatcher view = request.getRequestDispatcher(forward);
	        view.forward(request, response);
	        
		}
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	public void populateMonthlySales(HttpSession session)  {
		try {      
			
			SaleInMonth saleInMonth = null;
			String storeName = "";
			try {
				saleInMonth = productdao.getMonthlySales();
				storeName = productdao.getStoreName();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			System.out.println("storeName" + storeName);
			
			session.setAttribute("saleInMonth", saleInMonth);
			session.setAttribute("storeName", storeName);
			
			System.out.println("session value" + session.getAttribute("storeName"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}


