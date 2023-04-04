package eManage.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eManage.dao.SupplierDAO;
import eManage.model.SupplierBean;
/**
 * Servlet implementation class SupplierController
 */
public class SupplierController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String ADD = "/supplier_add.jsp";
//	private static String VIEW = "/supplier_view.jsp";
	private static String EDIT = "/supplier_edit.jsp";
	private static String LIST = "/supplier.jsp";
	String forward="";
	
	private SupplierDAO dao;
    /**
     * Default constructor. 
     */
    public SupplierController() {
        super();
        dao = new SupplierDAO ();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
        if (action.equalsIgnoreCase("SupplierList")){
            forward = LIST;
			try {
				request.setAttribute("suppliers", dao.getAllSupplier());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else if (action.equalsIgnoreCase("SupplierDelete")){
        	int supplierid = Integer.parseInt(request.getParameter("supplierid"));
            dao.delete(supplierid);
//            forward = DELETE;
            request.setAttribute("suppliers", dao.getAllSupplier());    
        }
        else if (action.equalsIgnoreCase("SupplierEdit")){
            forward = EDIT;
            int supplierid = Integer.parseInt(request.getParameter("supplierid"));
            SupplierBean supplier = dao.getSupplierById(supplierid);
            request.setAttribute("supplier", supplier);
        }
        else {
		forward = ADD;
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
		SupplierBean supplier = new SupplierBean();	
        supplier.setSupplier_name(request.getParameter("supplier_name"));
        supplier.setSupplier_address(request.getParameter("supplier_address"));
        supplier.setSupplier_contact_num(request.getParameter("supplier_contact_num"));
        supplier.setSupplier_description(request.getParameter("supplier_description"));
        
		String supplierid = request.getParameter("supplier_id");
        if(supplierid == null || supplierid.isEmpty())
        {
        	try {
				dao.add(supplier);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else{
            supplier.setSupplier_id(Integer.parseInt(supplierid));
            try {
				dao.edit(supplier);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

		forward = LIST;
		RequestDispatcher view = request.getRequestDispatcher(forward);
		try {
			request.setAttribute("suppliers", dao.getAllSupplier());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        view.forward(request, response);
//		doGet(request, response);
	}

}
