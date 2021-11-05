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


/**
 * Servlet implementation class AllRoomServlet
 */
@WebServlet(name = "AllRoom2", urlPatterns = { "/allRoom2" })
public class AllRoomServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllRoomServlet2() {
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
		int reqPage =Integer.parseInt(request.getParameter("reqPage"));
		//3.비즈니스로직
		RoomPage rpe =new RoomService().selectAllRoomLists(reqPage);
		//4.화면처리
		  RequestDispatcher view
		  =request.getRequestDispatcher("/WEB-INF/views/room/allRoom.jsp"); 
		  request.setAttribute("list", rpe.getList());
		  request.setAttribute("pageNavi", rpe.getPageNavi());
		  request.setAttribute("start", rpe.getStart());

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
