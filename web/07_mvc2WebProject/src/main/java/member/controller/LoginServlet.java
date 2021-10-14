package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

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
		System.out.println("2. 로그인 서블릿 시작");
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view 에서 보낸 데이터 추출
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		// 3. 비즈니스 로직
		Member member = new MemberService().selectOneMember(memberId, memberPw);
		// 4. 결과처리
		if(member != null) {
			if(member.getMemberLevel() == 3) {
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				request.setAttribute("msg", "로그인 권한이 없습니다. 관리자에게 문의하세요");
				request.setAttribute("loc", "/");
				view.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("m", member);
				response.sendRedirect("/");
			}
		} else {
			// 4-1. 화면을 처리할 페이지 지정
			// msg.jsp는 alert을 화면에 띄운 후 페이지를 이동하는 기능을 가진 jsp
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			// 4-2. 화면에서 사용할 데이터 등록
			// alert에 띄울 메세지는 msg에 등록
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			// 이동할 페이지를 loc에 등록
			request.setAttribute("loc", "/");
			// 4-3. 페이지 이동
			view.forward(request, response);
		}
		System.out.println("3. 로그인 서블릿 끝");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
