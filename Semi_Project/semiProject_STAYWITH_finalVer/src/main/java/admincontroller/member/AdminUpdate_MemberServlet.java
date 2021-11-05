package admincontroller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Admin_Member;
import admin.model.vo.Lf_Res;


/**
 * Servlet implementation class AdminUpdate_MemberServlet
 */
@WebServlet(name = "AdminUpdate_Member", urlPatterns = { "/adminUpdate_Member" })
public class AdminUpdate_MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdate_MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");

		int member_No = Integer.parseInt(request.getParameter("Member_No"));
		String member_Pw = request.getParameter("Member_Pw");
		String member_Kname = request.getParameter("Member_Kname");
		String member_Lname = request.getParameter("Member_Lname");
		String member_Fname = request.getParameter("Member_Fname");
		int member_Level = Integer.parseInt(request.getParameter("Member_Level"));
		
		String phone = request.getParameter("Member_Phone");
		int birth = Integer.parseInt(request.getParameter("Member_Brith"));
		int point = Integer.parseInt(request.getParameter("Member_Point"));		
		
		AdminService service = new AdminService();		
		
		Admin_Member r = service.get_Member(member_No);
		int result = 0;
		
		if(r == null)
		{
			result = 0;
			System.out.println("not found call Member_No in Member Table");
		}
		else
		{
			r.setMember_Pw(member_Pw);
			r.setMember_Kname(member_Kname);
			r.setMember_Lname(member_Lname);
			r.setMember_Fname(member_Fname);
			r.setMember_Level(member_Level);
			
			r.setPhone(phone);
			r.setBirth(birth);
			r.setPoint(point);
			
			result = service.update_Member(r);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
