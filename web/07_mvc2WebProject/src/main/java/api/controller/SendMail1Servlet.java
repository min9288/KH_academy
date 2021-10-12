package api.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMail1Servlet
 */
@WebServlet(name = "SendMail1", urlPatterns = { "/sendMail1" })
public class SendMail1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. 값 추출
		String email = request.getParameter("email");
		String emailTitle = request.getParameter("emailTitle");
		String emailContent = request.getParameter("emailContent");
		// 3. 비즈니스 로직
		boolean result = new MailSender().mailSend(email, emailTitle, emailContent);
		// 4. 결과확인
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result) {
			request.setAttribute("msg", "메일전송 성공");
		} else {
			request.setAttribute("msg", "메일전송 실패");
		}
		request.setAttribute("loc", "/mailApi");
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
