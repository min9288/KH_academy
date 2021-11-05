package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class ReserveConfirmServlet
 */
@WebServlet(name = "ReserveConfirm", urlPatterns = { "/reserveConfirm" })
public class ReserveConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveConfirmServlet() {
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
		String resNum =request.getParameter("resNum");
		//3.비즈니스로직
		RoomReserve res =new RoomService().detailRoomReserve(resNum);
		//4.화면처리
        RequestDispatcher view
        =request.getRequestDispatcher("/WEB-INF/views/room/rConfirm.jsp");
        request.setAttribute("res", res);
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
