package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.modal.vo.Member;
import stay.model.service.RoomService;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class RoomCancleRServlet
 */
@WebServlet(name = "RoomCancleR", urlPatterns = { "/roomCancleR" })
public class RoomCancleRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomCancleRServlet() {
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
		//reserve.setRoomNo(Integer.parseInt(request.getParameter("roomNO")));
		//reserve.setMemberId(request.getParameter("memberId"));
		reserve.setMemberKname(request.getParameter("memberKname"));
		//reserve.setAdult(Integer.parseInt(request.getParameter("adult")));
		//reserve.setCheckIn(request.getParameter("checkIn"));
		//reserve.setCheckOut(request.getParameter("checkOut"));
		//reserve.setKid(Integer.parseInt(request.getParameter("kid")));
		//reserve.setPayStatus(Integer.parseInt(request.getParameter("payStatus")));
		//reserve.setRoomName(request.getParameter("RoomName"));
		//reserve.setRoomPrice(Integer.parseInt(request.getParameter("RoomPrice")));
		//reserve.setRoomType(request.getParameter("RoomType"));
		//3.비즈니스 로직처리
		int result =new RoomService().cancleRes(reserve);
		//결과처리
		  RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		  HttpSession session = request.getSession(false);
		  Member m = (Member)session.getAttribute("m");
		  if(result>0) {
			  request.setAttribute("msg", "취소요청이 완료되었습니다.");
			  request.setAttribute("loc", "/mypageBookingRoomFrm?memberId="+m.getMemberId()+"&reqPage=1");
		  }else {
			  request.setAttribute("msg", "수정이 실패했어요.");
			  request.setAttribute("loc", "/mypageBookingRoomFrm?memberId="+m.getMemberId()+"&reqPage=1");
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
