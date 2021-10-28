package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.modal.service.MemberService;
import member.modal.vo.Member;

/**
 * Servlet implementation class UpdateMyInfoServlet
 */
@WebServlet(name = "UpdateMyInfo", urlPatterns = { "/updateMyInfo" })
public class UpdateMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view에서 보낸 값 추출
		Member member = new Member();
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setMemberId(request.getParameter("memberId"));
		// 3. 비즈니스 로직 수행
		int result = new MemberService().updateMember(member);
		// 4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/myInfoFrm");
		if(result > 0) {
			request.setAttribute("msg", "정보변경 성공");
			// 정보변경 성공 시 세션의 데이터를 최신화하는 코드
			Member m = new MemberService().selectOneMember(member.getMemberId());
			HttpSession session = request.getSession(false);
			session.setAttribute("m", m);
		} else {
			request.setAttribute("msg", "정보변경 실패");
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
