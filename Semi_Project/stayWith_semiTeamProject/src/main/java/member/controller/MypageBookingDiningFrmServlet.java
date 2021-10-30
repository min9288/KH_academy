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
import bookingView.modal.vo.BookingViewDining;
import bookingView.modal.vo.BookingViewPageDining;
import bookingView.modal.vo.BookingViewRoom;

/**
 * Servlet implementation class MypageBookingDiningFrmServlet
 */
@WebServlet(name = "MypageBookingDiningFrm", urlPatterns = { "/mypageBookingDiningFrm" })
public class MypageBookingDiningFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookingDiningFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "dining_res";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		BookingViewPageDining bvpd1 = new BookingViewService().printBookingDiningList(reqPage, memberId, tableType);
		if(bvpd1 != null) {
			BookingViewPageDining bvpd = new BookingViewService().printBookingDiningList(reqPage, memberId, tableType);
			BookingViewDining bvd = new BookingViewService().printMyBookingDiningList(memberId);
			HttpSession session = request.getSession();
			session.setAttribute("bvd", bvd);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_booking_dining.jsp");
			request.setAttribute("dList", bvpd.getdList());
			request.setAttribute("pageNavi", bvpd.getPageNavi());
			request.setAttribute("start", bvpd.getStart());
			view.forward(request, response);
		} else {
			BookingViewPageDining bvpd = new BookingViewService().printBookingDiningList(reqPage, memberId, tableType);
			BookingViewDining bvd = new BookingViewService().printMyBookingDiningList(memberId);
			HttpSession session = request.getSession();
			session.setAttribute("bvd", bvd);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_booking_dining.jsp");
			request.setAttribute("dList", bvpd.getdList());
			request.setAttribute("pageNavi", bvpd.getPageNavi());
			request.setAttribute("start", bvpd.getStart());
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
