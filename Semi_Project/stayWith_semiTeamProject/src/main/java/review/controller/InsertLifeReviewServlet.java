package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.modal.service.ReviewService;
import review.modal.vo.DiningReview;
import review.modal.vo.LifeReview;

/**
 * Servlet implementation class InsertLifeReviewServlet
 */
@WebServlet(name = "InsertLifeReview", urlPatterns = { "/insertLifeReview" })
public class InsertLifeReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLifeReviewServlet() {
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
		lr.setLfNo(Integer.parseInt(request.getParameter("lfNo")));
		lr.setLfName(request.getParameter("lfName"));
		lr.setResNo(request.getParameter("resNo"));
		lr.setReviewContent(request.getParameter("textArea_byteLimit"));
		lr.setStar(Integer.parseInt(request.getParameter("countStar")));
		lr.setResDate(request.getParameter("resDate"));
		lr.setLfImg(request.getParameter("lfImg"));
		int result = new ReviewService().insertLifeReview(lr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "후기 등록 성공!!");
		} else {
			request.setAttribute("msg", "후기 등록 실패");
		}
		request.setAttribute("loc", "/mypageBookingFitnessFrm?memberId="+lr.getReviewWriter()+"&reqPage=1");
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
