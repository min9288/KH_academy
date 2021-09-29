package kr.or.iei.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet(name = "Calc", urlPatterns = { "/calc" })
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		int result = 0;
		switch(oper){
		case "+":
			result = su1 + su2;
			break;
		case "-":
			result = su1 - su2;
			break;
		case "*":
			result = su1 * su2;
			break;
		case "/":
			result = su1 / su2;
			break;
		}
		
		response.setContentType("text/html; charset=utf-8"); // 응답 형식 지정
		PrintWriter out = response.getWriter(); // 사용자가 볼 HTML을 작성하는 객체 생성
		
		out.println("<!DOCTYPE html>");
		out.println("<html><head><title>더하기결과</title></head><body>");
		out.println("<h1>계산 결과<h1>");
		out.println("<hr>");
//		out.println("<h2>"+su1+oper+su2+" = "+result+"</h2>");
		out.printf("<h2>%d %s %d = %d</h2>", su1, oper, su2, result);
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
