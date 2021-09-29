package kr.or.iei.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendData1Servlet
 */
@WebServlet(name = "SendData1", urlPatterns = { "/sendData1" })
public class SendData1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendData1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서버 호출 성공!!!");
		// 1. 인코딩
		request.setCharacterEncoding("utf-8"); // 요청정보의 데이터를 모두 utf-8형식으로 인코딩
		// 2. 화면에서 전달한 데이터를 추출
		// test=abc		name=정민우		
		String test = request.getParameter("test");
		String name = request.getParameter("name");
		System.out.println("test : " + test);
		System.out.println("name : " + name);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
