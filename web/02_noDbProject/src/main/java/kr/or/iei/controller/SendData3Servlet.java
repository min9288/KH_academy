package kr.or.iei.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendData3Servlet
 */
@WebServlet(name = "SendData3", urlPatterns = { "/sendData3" })
public class SendData3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendData3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. 화면에서 전송한 데이터 추출
		String str = request.getParameter("str");
		String numString = request.getParameter("num");
		int num = Integer.parseInt(numString);
		// 라디오 데이터 받기
		String gender = request.getParameter("gender");
		// select 데이터 받기
		String age = request.getParameter("age");
		// 체크박스 데이터 받기
		String[] hobby = request.getParameterValues("hobby");
		// hidden 데이터 받기
		String hiddenData = request.getParameter("hiddenData");
		// readonly
		String input1 = request.getParameter("input1");
		// disabled
		String input2 = request.getParameter("input2");
		
		String test = request.getParameter("test");
		
		System.out.println("str : " + str);
		System.out.println("num : " + num);
		System.out.println("gender : " + gender);
		System.out.println("age : " + age);
		for(int i=0;i<hobby.length;i++) {
			System.out.print(hobby[i] + "\t");
		}
		System.out.println();
		System.out.println("hidden : " + hiddenData);
		System.out.println("input1 : " + input1);
		System.out.println("input2 : " + input2);
		System.out.println("test : " + test);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
