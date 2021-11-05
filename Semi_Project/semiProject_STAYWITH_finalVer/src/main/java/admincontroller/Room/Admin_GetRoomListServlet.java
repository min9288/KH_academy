package admincontroller.Room;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Room_Res;
import admin.model.vo.Room_ResPageData;

/**
 * Servlet implementation class Admin_GetRoomListServlet
 */
@WebServlet(name = "Admin_GetRoomList", urlPatterns = { "/admin_GetRoomList" })
public class Admin_GetRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_GetRoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		boolean msg = Boolean.parseBoolean(request.getParameter("msg"));	
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		
		AdminService service = new AdminService();
		ArrayList<Room_Res> list = null;
		
		Room_ResPageData pagedata =  new Room_ResPageData();
		
		
		
		if(msg == false)
		{
			list =  service.get_RoomResList();
			pagedata.setList(list);
		}
		else
		{
			pagedata =  service.get_RoomResList_All(reqPage);			
		}
		
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
