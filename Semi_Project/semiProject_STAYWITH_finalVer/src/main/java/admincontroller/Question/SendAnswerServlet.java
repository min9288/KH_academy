package admincontroller.Question;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class SendAnswerServlet
 */
@WebServlet(name = "SendAnswer", urlPatterns = { "/sendAnswer" })
public class SendAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		
		int q_no = Integer.parseInt( request.getParameter("q_no") );		
		String reply = request.getParameter("reply");
		String a_content = request.getParameter("a_content");
		
		int result = 0;
		if(Boolean.parseBoolean(reply) == false)
		{
			result = new AdminService().sendAnswer(q_no, a_content);
		}
		else
		{
			result = new AdminService().updateAnswer(q_no, a_content);
		}		
		
		
		String msg = "";
		String loc = "";
		if(result == 0)
		{
			msg = "err _ doesn't Update Answer";			
		}
		else
		{
			msg = "success Update youre Anser";
		}
		loc = "/adminQuestionList?reqPage=1";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
		
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
