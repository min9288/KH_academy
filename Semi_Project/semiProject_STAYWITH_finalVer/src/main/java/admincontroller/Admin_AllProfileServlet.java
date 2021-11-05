package admincontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;



/**
 * Servlet implementation class Admin_AllProfileServlet
 */
@WebServlet(name = "Admin_AllProfile", urlPatterns = { "/admin_AllProfile" })
public class Admin_AllProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_AllProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
				
		//2. 데이터 받기
		String userId = "test_00";//request.getParameter("memberName");		
		
				
		//3. 비지니스
		String userKname = new AdminService().selectOneMember_Test(userId);
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/admin/adminMain.jsp");				
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
