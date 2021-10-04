package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet(name = "CheckId", urlPatterns = { "/checkId" })
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view 에서 넘어온 데이터 추출
		String memberId = request.getParameter("checkId");
		// 3. 비즈니스 로직
		// boolean, int, Member 이 중 하나로 진행
		Member member = new MemberService().selectOneMember(memberId);
		// 4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/member/checkId.jsp");
		if (member == null) {
			// 입력받은 아이디로 사용자가 조회되지 않음 -> 사용가능한 아이디인 경우
			request.setAttribute("result", true);
		} else {
			// 입력받은 아이디로 사용자가 조회 -> 이미 사용중인 아이디
			request.setAttribute("result", false);
		}
		// 중복체크한 아이디를 결과페이지에서 사용하기 위해 등록
		request.setAttribute("memberId", memberId);
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
