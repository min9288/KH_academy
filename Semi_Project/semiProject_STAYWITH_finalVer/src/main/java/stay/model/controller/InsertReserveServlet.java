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
 * Servlet implementation class InsertReserveServlet
 */
@WebServlet(name = "InsertReserve", urlPatterns = { "/insertReserve" })
public class InsertReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		RoomReserve reserve =new RoomReserve();  //하나로 데이터 묶기
		//2.화면에서 전달한 데이터를 추출

		//reserve.setResNum(request.getParameter("resNum"));
		reserve.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		
		reserve.setMemberId(request.getParameter("memberId"));
		reserve.setMemberKname(request.getParameter("memberKname"));
		reserve.setAdult(Integer.parseInt(request.getParameter("adult")));
		reserve.setCheckIn(request.getParameter("checkIn"));
		reserve.setCheckOut(request.getParameter("checkOut"));
		reserve.setKid(Integer.parseInt(request.getParameter("kid")));
		reserve.setPayStatus(2);
		reserve.setRoomName(request.getParameter("RoomName"));
		reserve.setRoomPrice(Integer.parseInt(request.getParameter("RoomPrice")));
		reserve.setRoomType(request.getParameter("RoomType"));
	
	/*	reserve.setRoomNo(10);
		reserve.setMemberId("testda");
		reserve.setMemberKname("테스트");
		reserve.setRoomType("스탠다드");
		reserve.setRoomName("위드 스위트");
		reserve.setCheckIn("2021-11-05");
		reserve.setCheckOut("2021-11-06");
		reserve.setRoomPrice(330000);
		reserve.setPayStatus(2);
		reserve.setAdult(2);
		reserve.setKid(1);
		
/*		System.out.println(request.getParameter("roomNO"));
		System.out.println(request.getParameter("adult"));
		System.out.println(request.getParameter("kid"));
		System.out.println(request.getParameter("RoomPrice"));
		System.out.println(request.getParameter("RoomType"));
		System.out.println(request.getParameter("checkIn"));
		System.out.println(request.getParameter("checkOut"));
	*/	

	
		
	
		//3.비즈니스 로직처리
		int result =new RoomService().insertReserve(reserve);
		//결과처리
	   if(result>0) {
		   response.sendRedirect("/");
		   
	   }else {
		  RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		  request.setAttribute("msg", "예약실패");
		  request.setAttribute("loc", "/");
		  view.forward(request, response);
	   }
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
