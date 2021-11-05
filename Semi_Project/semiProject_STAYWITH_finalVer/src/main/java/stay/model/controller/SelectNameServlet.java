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
import stay.model.vo.RoomPage;
import stay.model.vo.RoomR;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class SelectNameServlet
 */
@WebServlet(name = "SelectName", urlPatterns = { "/selectName" })
public class SelectNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		RoomReserve reserve =new RoomReserve();
		//2.화면에서 전달한 데이터를 추출
		reserve.setCheckIn(request.getParameter("checkInR"));
		reserve.setCheckOut(request.getParameter("checkOutR"));
		reserve.setRoomName(request.getParameter("roomName"));
		reserve.setBed(request.getParameter("bed"));
		reserve.setAdult(Integer.parseInt(request.getParameter("adult")));
		reserve.setKid(Integer.parseInt(request.getParameter("kid")));
		int reqPage =Integer.parseInt(request.getParameter("reqPage"));
		//3.비즈니스로직
		RoomPage rpe =new RoomService().selectLists(reqPage);
		//ArrayList<RoomR> list =new RoomService().selectCheck(reserve);
		//4.화면처리k
		  RequestDispatcher view
		  =request.getRequestDispatcher("/WEB-INF/views/room/reserve2.jsp"); 
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
