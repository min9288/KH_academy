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
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet(name = "InsertReview", urlPatterns = { "/insertReview" })
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
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
		rr.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		rr.setResNum(request.getParameter("resNum"));
		rr.setRoomName(request.getParameter("roomName"));
		rr.setCheckInDate(request.getParameter("checkIn"));
		rr.setCheckOutDate(request.getParameter("checkOut"));
		rr.setRoomImg(request.getParameter("roomImg"));
		int result = new ReviewService().insertReview(rr);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "후기 등록 성공!!");
		} else {
			request.setAttribute("msg", "후기 등록 실패");
		}
		request.setAttribute("loc", "/mypageBookingRoomFrm?memberId="+rr.getReviewWriter()+"&reqPage=1");
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
