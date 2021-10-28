package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookingView.modal.service.BookingViewService;
import bookingView.modal.vo.BookingViewPageRoom;
import bookingView.modal.vo.BookingViewRoom;

/**
 * Servlet implementation class MypageBookingRoomFrmServlet
 */
@WebServlet(name = "MypageBookingRoomFrm", urlPatterns = { "/mypageBookingRoomFrm" })
public class MypageBookingRoomFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookingRoomFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "room_res";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		BookingViewPageRoom bvpr = new BookingViewService().printBookingList(reqPage, memberId, tableType);
		BookingViewRoom bvr = new BookingViewService().printMyBookingList(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("bvr", bvr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_booking_room.jsp");
		request.setAttribute("rList", bvpr.getrList());
		request.setAttribute("pageNavi", bvpr.getPageNavi());
		request.setAttribute("start", bvpr.getStart());
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
