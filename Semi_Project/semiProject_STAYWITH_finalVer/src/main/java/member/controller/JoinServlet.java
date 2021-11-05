package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.modal.service.MemberService;
import member.modal.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member m = new Member();
		m.setEmail(request.getParameter("email"));
		m.setBirth(Integer.parseInt(request.getParameter("birth")));
		m.setMemberFname(request.getParameter("memberFname"));
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberKname(request.getParameter("memberKname"));
		m.setMemberLname(request.getParameter("memberLname"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setPhone(request.getParameter("phone"));
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			// 회원가입 성공시 -> 메인페이지
			response.sendRedirect("/");
		} else {
			// 실패시 -> 실패 알람 띄운 후 회원가입페이지로 이동
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원 가입에 실패했습니다.");
			request.setAttribute("loc", "/joinFrm");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
