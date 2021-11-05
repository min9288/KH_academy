package lifestyle.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.ResLifestyle;

/**
 * Servlet implementation class ResDateServlet
 */
@WebServlet(name = "ResDate", urlPatterns = { "/resDate" })
public class ResDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//1.인코딩
				request.setCharacterEncoding("utf-8");
				//2.값추출
				int lfNo = Integer.parseInt(request.getParameter("lfNo"));
				//3.비즈니스 로직
				ArrayList<ResLifestyle> resList = new LifestyleService().selectNoDate(lfNo);
				//4.결과처리
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(resList,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
