package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.modal.service.ReviewService;
import review.modal.vo.LifeReview;
import review.modal.vo.RoomReview;

/**
 * Servlet implementation class UpdateLifeReviewServlet
 */
@WebServlet(name = "UpdateLifeReview", urlPatterns = { "/updateLifeReview" })
public class UpdateLifeReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLifeReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		LifeReview lr = new LifeReview();
		lr.setReviewWriter(request.getParameter("memberId"));
		lr.setReviewContent(request.getParameter("textArea_byteLimit"));
		lr.setStar(Integer.parseInt(request.getParameter("countStar")));
		lr.setLfRNo(Integer.parseInt(request.getParameter("lfRNo")));
		int result = new ReviewService().updateLifeReview(lr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "후기 등록 성공!!");
		} else {
			request.setAttribute("msg", "후기 등록 실패");
		}
		request.setAttribute("loc", "/mypageMyReviewFitnessFrm?memberId="+lr.getReviewWriter()+"&reqPage=1");
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
