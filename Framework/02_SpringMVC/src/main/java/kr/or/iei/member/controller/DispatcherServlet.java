package kr.or.iei.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 사용자가 요청한 uri 추출
		String uri = request.getRequestURI();
		System.out.println("사용자요청uri : "+uri);
		// 사용자가 요청한 uri를 처리할 컨트롤러 주소를 HandlerMapping에게 질의
		Controller controller = new HandlerMapping().getController(uri);
		// HandlerMapping이 리턴한 주소를 요청
		String result = controller.handleRequest(request, response);
		System.out.println(result);
		String viewName = new ViewResolver().getView(result);
		RequestDispatcher view = request.getRequestDispatcher(viewName);
		view.forward(request, response);
		
//		// 1. 로그인 성공
//		RequestDispatcher view = request.getRequestDispatcher("/views/loginSuccess.jsp");
//		// 2. 로그인 실패
//		RequestDispatcher view = request.getRequestDispatcher("/views/loginFailed.jsp");
//		// 3. 조회 성공
//		RequestDispatcher view = request.getRequestDispatcher("/views/searchSuccess.jsp");
//		// 4. 조회 실패
//		RequestDispatcher view = request.getRequestDispatcher("/views/searchFailed.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
