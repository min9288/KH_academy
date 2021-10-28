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
import review.modal.vo.RoomReview;

/**
 * Servlet implementation class InsertDiningReviewServlet
 */
@WebServlet(name = "InsertDiningReview", urlPatterns = { "/insertDiningReview" })
public class InsertDiningReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDiningReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DiningReview dr = new DiningReview();
		dr.setReviewWriter(request.getParameter("memberId"));
		dr.setDiningNo(Integer.parseInt(request.getParameter("diningNo")));
		dr.setDiningName(request.getParameter("diningName"));
		dr.setResNo(request.getParameter("resNo"));
		dr.setReviewContent(request.getParameter("textArea_byteLimit"));
		dr.setStar(Integer.parseInt(request.getParameter("countStar")));
		dr.setResDate(request.getParameter("resDate"));
		int result = new ReviewService().insertDiningReview(dr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "후기 등록 성공!!");
		} else {
			request.setAttribute("msg", "후기 등록 실패");
		}
		request.setAttribute("loc", "/mypageBookingDiningFrm?memberId="+dr.getReviewWriter()+"&reqPage=1");
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
