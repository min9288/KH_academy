package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class AllMemberServlet
 */
@WebServlet(name = "AllMember", urlPatterns = { "/allMember" })
public class AllMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 1. 인코딩
				request.setCharacterEncoding("utf-8");
				// 2. 화면에서 보낸 데이터 추출
				
				// 3. 비즈니스 로직수행
				MemberService service = new MemberService();
				ArrayList<Member> list = service.allMember();
				// 4. 화면처리
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE html>");
				out.println("<html><head><title>전체회원조회</title></head><body>");
				out.println("<h1>전체회원 조회</h1><hr>");
				if(list.isEmpty()) { // list.size() == 0
					out.println("<h2>회원 정보가 없습니다.</h2>");
				} else {
					out.println("<table border = '1'>");
					out.println("<tr><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>주소</th>"
							+ "<th>회원등급</th><th>가입일</th></tr>");
					for(Member m : list) {
						out.println("<tr>");
						out.println("<td>"+m.getMemberNo()+"</td>");
						out.println("<td>"+m.getMemberId()+"</td>");
						out.println("<td>"+m.getMemberPw()+"</td>");
						out.println("<td>"+m.getMemberName()+"</td>");
						out.println("<td>"+m.getPhone()+"</td>");
						out.println("<td>"+m.getAddress()+"</td>");
						out.println("<td>"+m.getMemberLevel()+"</td>");
						out.println("<td>"+m.getEnrollDate()+"</td>");
						out.println("</tr>");
					}
				}
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
