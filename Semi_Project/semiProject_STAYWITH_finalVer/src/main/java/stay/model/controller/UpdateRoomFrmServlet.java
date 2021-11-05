package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.Room;

/**
 * Servlet implementation class UpdateRoomFrmServlet
 */
@WebServlet(name = "UpdateRoomFrm", urlPatterns = { "/updateRoomFrm" })
public class UpdateRoomFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		//추출
		int roomNo =Integer.parseInt(request.getParameter("roomNo"));
		//비즈니스로직
		Room r =new RoomService().detailRoom(roomNo);
		//결과처리
		 RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/room/updateRoom.jsp");
		 request.setAttribute("r", r);
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
