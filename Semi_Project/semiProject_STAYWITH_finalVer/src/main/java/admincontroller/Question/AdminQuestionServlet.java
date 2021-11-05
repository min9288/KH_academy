package admincontroller.Question;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Admin_Question;
import admin.model.vo.QuestionPageData;

/**
 * Servlet implementation class AdminQuestionServlet
 */
@WebServlet(name = "AdminQuestion", urlPatterns = { "/adminQuestion" })
public class AdminQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		boolean Switch = Boolean.parseBoolean(request.getParameter("msg"));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		
		AdminService service = new AdminService();
		
		ArrayList<Admin_Question> list;
		QuestionPageData pageData;
		if(Switch == true)
		{
			pageData = new QuestionPageData();
			list =  service.get_QuestionList_noReply();
			pageData.setList(list);
		}
		else
		{
			pageData = service.get_QuestionList(reqPage);			
		}		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(pageData,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
