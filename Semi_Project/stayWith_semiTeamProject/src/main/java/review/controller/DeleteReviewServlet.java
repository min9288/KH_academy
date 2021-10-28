package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import review.modal.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet(name = "DeleteReview", urlPatterns = { "/deleteReview" })
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int rRNo = Integer.parseInt(request.getParameter("rRNo"));
		String memberId = request.getParameter("memberId");
		int result = new ReviewService().deleteRoomReview(rRNo);
//		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
//		if(result > 0) {
//			request.setAttribute("msg", "후기 삭제 성공");
//		} else {
//			request.setAttribute("msg", "후기 등록 실패");
//		}
//		request.setAttribute("loc", "/mypageMyReviewRoomFrm?memberId="+memberId);
//		view.forward(request, response);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		new Gson().toJson(result, out);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
