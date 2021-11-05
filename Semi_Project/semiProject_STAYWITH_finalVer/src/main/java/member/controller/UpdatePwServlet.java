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
 * Servlet implementation class UpdatePwServlet
 */
@WebServlet(name = "UpdatePw", urlPatterns = { "/updatePw" })
public class UpdatePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member member = new Member();
		member.setMemberPw(request.getParameter("pwRe"));
		member.setMemberId(request.getParameter("memberId"));
		int result = new MemberService().updatePw(member);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/myInfoFrm");
		if(result > 0) {
			request.setAttribute("msg", "정보변경 성공");
			// 정보변경 성공 시 세션의 데이터를 최신화하는 코드
			Member m = new MemberService().selectOneMember(member.getMemberId());
			HttpSession session = request.getSession(false);
			session.setAttribute("m", m);
		} else {
			request.setAttribute("msg", "비밀번호 입력값이 올바른지 확인해주세요");
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
