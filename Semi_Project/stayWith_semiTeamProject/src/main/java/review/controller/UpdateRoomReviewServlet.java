package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.modal.service.ReviewService;
import review.modal.vo.RoomReview;

/**
 * Servlet implementation class UpdateRoomReviewServlet
 */
@WebServlet(name = "UpdateRoomReview", urlPatterns = { "/updateRoomReview" })
public class UpdateRoomReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		RoomReview rr = new RoomReview();
		rr.setReviewWriter(request.getParameter("memberId"));
		rr.setReviewContent(request.getParameter("textArea_byteLimit"));
		rr.setStar(Integer.parseInt(request.getParameter("countStar")));
		rr.setrRNo(Integer.parseInt(request.getParameter("rRNo")));
		int result = new ReviewService().updateRoomReview(rr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "후기 등록 성공!!");
		} else {
			request.setAttribute("msg", "후기 등록 실패");
		}
		request.setAttribute("loc", "/mypageMyReviewRoomFrm?memberId="+rr.getReviewWriter());
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
