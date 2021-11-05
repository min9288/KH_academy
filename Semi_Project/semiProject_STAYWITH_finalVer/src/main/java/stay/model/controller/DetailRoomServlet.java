package stay.model.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCTemplate;
import stay.model.service.RoomService;
import stay.model.vo.Room;

/**
 * Servlet implementation class DetailRoomServlet
 */
@WebServlet(name = "DetailRoom", urlPatterns = { "/detailRoom" })
public class DetailRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailRoomServlet() {
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
		int roomNo =Integer.parseInt(request.getParameter("roomNo"));
		//3.비즈니스로직
		Room r =new RoomService().detailRoom(roomNo);
		
		//4.화면처리
		  RequestDispatcher view
		  =request.getRequestDispatcher("/WEB-INF/views/room/detailRoom.jsp"); 
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
