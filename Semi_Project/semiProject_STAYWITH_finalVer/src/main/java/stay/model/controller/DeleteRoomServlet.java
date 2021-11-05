package stay.model.controller;

import java.io.File;
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
 * Servlet implementation class DeleteRoomServlet
 */
@WebServlet(name = "DeleteRoom", urlPatterns = { "/deleteRoom" })
public class DeleteRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRoomServlet() {
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
		RoomService service =new RoomService();
		Room r =service.detailRoom(roomNo);
		int result =new RoomService().deleteRoom(roomNo);
		//결과처리
		 RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		 if(result>0) {
			 request.setAttribute("msg", "삭제성공");
			 request.setAttribute("loc", "/roomManage");
		 }else {
			 request.setAttribute("msg", "삭제실패");
			 //request.setAttribute("loc", "/noticeView?noticeNp="+noticeNo);
			 
		 }
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
