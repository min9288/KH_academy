package admincontroller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Admin_Member;
import admin.model.vo.MemberPageData;

/**
 * Servlet implementation class Admin_GetMemberListServlet
 */
@WebServlet(name = "Admin_GetMemberList", urlPatterns = { "/admin_GetMemberList" })
public class Admin_GetMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_GetMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));		
		String dataType = request.getParameter("dataType");
		String data = request.getParameter("data");	
		
		
		AdminService service = new AdminService();
		ArrayList<Admin_Member> list = null;
		MemberPageData pagedata =  new MemberPageData();
		
		pagedata =  service.get_MemberList(reqPage,dataType,data);	
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(pagedata,response.getWriter());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
