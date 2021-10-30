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
import bookingView.modal.vo.BookingViewLife;
import bookingView.modal.vo.BookingViewPageLife;

/**
 * Servlet implementation class MypageBookingFitnessFrmServlet
 */
@WebServlet(name = "MypageBookingFitnessFrm", urlPatterns = { "/mypageBookingFitnessFrm" })
public class MypageBookingFitnessFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookingFitnessFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "lf_res";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		BookingViewPageLife bvpl1 = new BookingViewService().printBookingLifeList(reqPage, memberId, tableType);
		if(bvpl1 != null) {
			BookingViewPageLife bvpl = new BookingViewService().printBookingLifeList(reqPage, memberId, tableType);
			BookingViewLife bvl = new BookingViewService().printMyBookingLifeList(memberId);
			HttpSession session = request.getSession();
			session.setAttribute("bvl", bvl);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_booking_fitness.jsp");
			request.setAttribute("lfList", bvpl.getLfList());
			request.setAttribute("pageNavi", bvpl.getPageNavi());
			request.setAttribute("start", bvpl.getStart());
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
