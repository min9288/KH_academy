package admincontroller.dining;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Dining_Res;
import admin.model.vo.Room_Res;

/**
 * Servlet implementation class Admin_UpdateDiningResServlet
 */
@WebServlet(name = "Admin_UpdateDiningRes", urlPatterns = { "/admin_UpdateDiningRes" })
public class Admin_UpdateDiningResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_UpdateDiningResServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String res_No = request.getParameter("res_No");		
		int 	dining_No = Integer.parseInt(request.getParameter("dining_No"));		
		String 	member_Id = request.getParameter("member_Id");
		int 	guests_Adt = Integer.parseInt(request.getParameter("guests_Adt"));	
		int 	guests_Cnt = Integer.parseInt(request.getParameter("guests_Cnt"));	
		
		String	res_Date = request.getParameter("res_Date");
		String  res_Time = request.getParameter("res_Time");
		
		int select_Timetype = Integer.parseInt(request.getParameter("select_Timetype"));
		int select_Seattype = Integer.parseInt(request.getParameter("select_Seattype"));
		int select_paySatus = Integer.parseInt(request.getParameter("select_paySatus"));
		
		AdminService service = new AdminService();		
		
		Dining_Res r = service.get_Dining_Res(res_No);
		
		r.setRes_No(res_No);
		r.setDining_No(dining_No);
		r.setMember_Id(member_Id);
		r.setGuests_Adt_Cnt(guests_Adt);
		r.setGuests_Kid_Cnt(guests_Cnt);
		
		r.setRes_Date(res_Date);
		r.setRes_Time(res_Time);
		
		r.setTime_Type(select_Timetype);
		r.setSeat_Type(select_Seattype);
		r.setRes_Status(select_paySatus);
		
		
		int result = service.update_DiningRes(r);
		
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
