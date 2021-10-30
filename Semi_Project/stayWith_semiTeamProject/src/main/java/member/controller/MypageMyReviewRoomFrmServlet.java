package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.modal.service.ReviewService;
import review.modal.vo.RoomReview;
import review.modal.vo.RoomReviewPage;

/**
 * Servlet implementation class MypageMyReviewRoomFrmServlet
 */
@WebServlet(name = "MypageMyReviewRoomFrm", urlPatterns = { "/mypageMyReviewRoomFrm" })
public class MypageMyReviewRoomFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReviewRoomFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "room_review";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		RoomReviewPage rrp = new ReviewService().printRoomReviewList(reqPage, memberId, tableType);
		RoomReview rr = new ReviewService().printRoomReview(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("rr", rr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myReview_room.jsp");
		request.setAttribute("rList", rrp.getrList());
		request.setAttribute("pageNavi", rrp.getPageNavi());
		request.setAttribute("start", rrp.getStart());
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
