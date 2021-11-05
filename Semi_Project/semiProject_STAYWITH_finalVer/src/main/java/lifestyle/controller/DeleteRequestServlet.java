package lifestyle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lifestyle.model.service.LifestyleService;
import member.modal.vo.Member;

/**
 * Servlet implementation class DeleteRequestServlet
 */
@WebServlet(name = "DeleteRequest", urlPatterns = { "/deleteRequest" })
public class DeleteRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String resNo = request.getParameter("resNo");
		//3.비즈니스로직
		int result = new LifestyleService().deleteRequestLf(resNo);
		//4.결과처리
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("m");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "취소 신청이 완료되었습니다.");
			request.setAttribute("loc", "/mypageBookingFitnessFrm?memberId="+m.getMemberId()+"&reqPage=1");			
		}
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
