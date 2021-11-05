package admincontroller.Room;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import admin.model.vo.Room_Res;
import member.modal.vo.Member;

/**
 * Servlet implementation class RoomResViewDetailServlet
 */
@WebServlet(name = "RoomResViewDetail", urlPatterns = { "/roomResViewDetail" })
public class RoomResViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomResViewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");		
		String rNo = request.getParameter("rNum");
		
		HttpSession session = request.getSession(false);
		if(session != null) 
		{
			Member m = (Member)session.getAttribute("m");
			if(m == null || m.getMemberLevel() != 1) 
			{
				request.setAttribute("msg", "로그인 후 이용 가능합니다.");
				request.setAttribute("loc", "/loginFrm");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
				return;
			}
		}
		
		Room_Res r = new AdminService().get_RoomRes(rNo);
		
		request.setAttribute("r", r);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminRoomResView.jsp");
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
