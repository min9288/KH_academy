package admincontroller.Room;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Room_Res;

/**
 * Servlet implementation class AdminUpdate_RoomresServlet
 */
@WebServlet(name = "AdminUpdate_Roomres", urlPatterns = { "/adminUpdate_Roomres" })
public class AdminUpdate_RoomresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdate_RoomresServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String room_Res = request.getParameter("room_Res");
		int 	room_No = Integer.parseInt(request.getParameter("room_No"));
		String 	room_Type = request.getParameter("room_Type");
		String	room_Name = request.getParameter("room_Name");
		String  chkin = request.getParameter("chkin");
		String  chkout = request.getParameter("chkout");
		
		int payStatus = Integer.parseInt(request.getParameter("payStatus"));
		int adult = Integer.parseInt(request.getParameter("adult"));
		int kid = Integer.parseInt(request.getParameter("kid"));
		
		AdminService service = new AdminService();
		
		Room_Res r = service.get_RoomRes(room_Res);
		
		r.setRoom_No(room_No);
		r.setRoom_Type(room_Type);
		r.setRoom_Name(room_Name);
		r.setCheckin(chkin);
		r.setCheckout(chkout);
		
		r.setPay_Status(payStatus);
		r.setAdult(adult);
		r.setKid(kid);
		
		int result = service.updateRoom_Res(r);
		
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
