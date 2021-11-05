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
 * Servlet implementation class UpReserveRServlet
 */
@WebServlet(name = "UpReserveR", urlPatterns = { "/upReserveR" })
public class UpReserveRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpReserveRServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8"); 
		RoomReserve reserve =new RoomReserve();
		//2.데이터추출
		reserve.setResNum(request.getParameter("resNum"));
		reserve.setAdult(Integer.parseInt(request.getParameter("adult")));
		reserve.setCheckIn(request.getParameter("checkIn"));
		reserve.setCheckOut(request.getParameter("checkOut"));
		reserve.setKid(Integer.parseInt(request.getParameter("kid")));
	
		int result =new RoomService().updateRoomR(reserve);
		//결과처리
		  RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		  request.setAttribute("loc", "/");
		  if(result>0) {
			  request.setAttribute("msg", "객실예약이 변경되었습니다.");
		  }else {
			  request.setAttribute("msg", "객실예약 변경이 실패했어요.");
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
