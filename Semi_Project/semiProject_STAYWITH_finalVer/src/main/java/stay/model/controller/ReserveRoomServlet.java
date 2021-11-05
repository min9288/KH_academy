package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.RoomR;

/**
 * Servlet implementation class ReserveRoomServlet
 */
@WebServlet(name = "ReserveRoom", urlPatterns = { "/reserveRoom" })
public class ReserveRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		RoomR r =new RoomR();
		//2.화면에서 전달한 데이터를 추출
		r.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		r.setAdult(Integer.parseInt(request.getParameter("adult")));
		r.setCheckIn(request.getParameter("checkIn"));
		r.setCheckOut(request.getParameter("checkOut"));
		r.setKid(Integer.parseInt(request.getParameter("kid")));
		//3.비즈니스로직
		RoomR rr = new RoomService().RoomReserve(r);
		//4.화면처리
        RequestDispatcher view
        =request.getRequestDispatcher("/WEB-INF/views/room/rConfirm.jsp");
        request.setAttribute("rr", rr);
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
