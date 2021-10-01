package kr.or.iei.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view 에서 보낸 데이터 추출
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		// 3. 비즈니스 로직 수행
		Member member = new MemberService().selectOneMember(memberId, memberPw);
		// 4. 화면처리
		// 성공한 경우 -> 메인페이지 
		// 실패한 경우 -> alert이후 로그인창으로 이동
		if(member != null) {
			// 로그인이 성공한 경우
			// 세션객체 성공
			
			// request.getSession()
			// -> 매개변수가 없는 경우 세션이 이미 존재하면 있는 세션가져오고
			// -> 세션이 존재하지 않으면 새로 세션을 만들어서 리턴
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("/");
		} else {
			response.sendRedirect("/views/loginFail.jsp");
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
