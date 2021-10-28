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
		ArrayList<RoomReview> rList = new ReviewService().printRoomReviewList(memberId);
		RoomReview rr = new ReviewService().printRoomReview(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("rr", rr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myReview_room.jsp");
		request.setAttribute("rList", rList);
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
