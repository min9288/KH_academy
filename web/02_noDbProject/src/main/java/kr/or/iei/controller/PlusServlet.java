package kr.or.iei.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PlusServlet
 */
@WebServlet(name = "Plus", urlPatterns = { "/plus" })
public class PlusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. 화면에서 전송한 값 추출
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		// 3. 비즈니스 로직 처리
		int sum = num1 + num2;
		// 4. 사용자 화면 출력(HTML작성)
		response.setContentType("text/html; charset=utf-8"); // 응답 형식 지정
		PrintWriter out = response.getWriter(); // 사용자가 볼 HTML을 작성하는 객체 생성
		
		out.println("<!DOCTYPE html>");
		out.println("<html><head><title>더하기결과</title></head><body>");
		out.println("<h1>더하기 결과<h1>");
		out.println("<hr>");
		out.println("<h2>"+num1+" + "+num2+" = "+sum+"</h2>");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
