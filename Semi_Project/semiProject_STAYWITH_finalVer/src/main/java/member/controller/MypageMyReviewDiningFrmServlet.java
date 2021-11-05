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
import review.modal.vo.DiningReview;
import review.modal.vo.DiningReviewPage;

/**
 * Servlet implementation class MypageMyReviewDiningFrmServlet
 */
@WebServlet(name = "MypageMyReviewDiningFrm", urlPatterns = { "/mypageMyReviewDiningFrm" })
public class MypageMyReviewDiningFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReviewDiningFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memberId = request.getParameter("memberId");
		String tableType = "dining_review";
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		DiningReviewPage drp = new ReviewService().printDiningReviewList(reqPage, memberId, tableType);
		DiningReview dr = new ReviewService().printDiningReview(memberId);
		HttpSession session = request.getSession();
		session.setAttribute("dr", dr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myReview_dining.jsp");
		request.setAttribute("dList", drp.getdList());
		request.setAttribute("pageNavi", drp.getPageNavi());
		request.setAttribute("start", drp.getStart());
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
