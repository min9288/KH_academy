package stay.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.Room;
import stay.model.vo.RoomPage;
import stay.model.vo.RoomR;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class SelectTypeServlet
 */
@WebServlet(name = "SelectType", urlPatterns = { "/selectType" })
public class SelectTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");

		//2.화면에서 전달한 데이터를 추출
		String roomType =request.getParameter("roomType");
		//3.비즈니스로직
		ArrayList<Room> list =new RoomService().selectRoomType(roomType);
		
		
		//4.화면처리
		  RequestDispatcher view
		  =request.getRequestDispatcher("/WEB-INF/views/room/allRoom2.jsp"); 
		  request.setAttribute("list", list);
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
