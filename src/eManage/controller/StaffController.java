package eManage.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eManage.dao.StaffDAO;
import eManage.model.StaffBean;
/**
 * Servlet implementation class StaffController
 */
public class StaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String ADD = "/staff_add.jsp";
	private static String VIEW = "/staff_view.jsp";
	private static String EDIT = "/staff_edit.jsp";
	private static String LIST = "/staff.jsp";
//	private static String DELETE = "/staff_delete.jsp";
	String forward="";
	
	private StaffDAO dao;
    /**
     * Default constructor. 
     */
    public StaffController() {
        // TODO Auto-generated constructor stub
        super();
        dao = new StaffDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
        if (action.equalsIgnoreCase("StaffList")){
            forward = LIST;
			try {
				request.setAttribute("staffs", dao.getAllStaff());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else if (action.equalsIgnoreCase("StaffView")){
            forward = VIEW;
            int staffid = Integer.parseInt(request.getParameter("staffid"));
            StaffBean staff = dao.getStaffById(staffid);
            request.setAttribute("staff", staff);
        }
        else if (action.equalsIgnoreCase("StaffDelete")){
        	int staffid = Integer.parseInt(request.getParameter("staffid")); 
            dao.delete(staffid);
//            forward = DELETE;
        }
        else if (action.equalsIgnoreCase("StaffEdit")){
            forward = EDIT;
            int staffid = Integer.parseInt(request.getParameter("staffid"));
            StaffBean staff = dao.getStaffById(staffid);
            request.setAttribute("staff", staff);
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
		
		StaffBean staff = new StaffBean();
		staff.setStaff_name(request.getParameter("staff_name"));
		staff.setStaff_birth_date(request.getParameter("staff_birth_date"));
		staff.setStaff_contact_num(request.getParameter("staff_contact_num"));
		staff.setStaff_address(request.getParameter("staff_address"));
		staff.setStaff_salary(request.getParameter("staff_salary"));
		staff.setStaff_position(request.getParameter("staff_position"));
		staff.setStaff_hire_date(request.getParameter("staff_hire_date"));
		staff.setStaff_email(request.getParameter("staff_email"));
		staff.setStaff_password(request.getParameter("staff_password"));
		 
		String staffid = request.getParameter("staff_id");
		String staff_name = request.getParameter("staff_name");
        if(staffid == null || staffid.isEmpty())
        {
        	try {
				dao.add(staff);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        else{
            staff.setStaff_id(Integer.parseInt(staffid));
            try {
            	if (staff_name == null) {
            		dao.updatepassword(staff);
            	}
            	else {
				dao.edit(staff);
            	}
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

		forward = LIST;
		RequestDispatcher view = request.getRequestDispatcher(forward);
		try {
			request.setAttribute("staffs", dao.getAllStaff());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        view.forward(request, response);
//		doGet(request, response);
	}

}
