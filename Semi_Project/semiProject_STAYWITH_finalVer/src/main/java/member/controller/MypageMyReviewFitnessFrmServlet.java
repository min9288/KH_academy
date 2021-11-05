package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.modal.service.ReviewService;
import review.modal.vo.LifeReview;
import review.modal.vo.LifeReviewPage;
import review.modal.vo.RoomReviewPage;

/**
 * Servlet implementation class MypageMyReviewFitnessFrmServlet
 */
@WebServlet(name = "MypageMyReviewFitnessFrm", urlPatterns = { "/mypageMyReviewFitnessFrm" })
public class MypageMyReviewFitnessFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReviewFitnessFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "life_review";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		LifeReviewPage lrp = new ReviewService().printLifeReviewList(reqPage, memberId, tableType);
		LifeReview lr = new ReviewService().printLifeReview(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("lr", lr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myReview_fitness.jsp");
		request.setAttribute("lfList", lrp.getLfList());
		request.setAttribute("pageNavi", lrp.getPageNavi());
		request.setAttribute("start", lrp.getStart());
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
