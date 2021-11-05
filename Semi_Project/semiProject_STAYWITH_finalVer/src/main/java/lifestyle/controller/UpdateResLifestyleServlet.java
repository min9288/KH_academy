package lifestyle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.ResLifestyle;

/**
 * Servlet implementation class UpdateResLifestyleServlet
 */
@WebServlet(name = "UpdateResLifestyle", urlPatterns = { "/updateResLifestyle" })
public class UpdateResLifestyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateResLifestyleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		//2.값추출
		String resNo = request.getParameter("resNo");
		System.out.println(resNo);
		//3.비즈니스로직
		ResLifestyle rl = new LifestyleService().selectOneResLifestyle(resNo);
		Lifestyle lf = new LifestyleService().selectOneLfContent(rl.getLfNo());
		//4.결과처리
		RequestDispatcher view =  request.getRequestDispatcher("/WEB-INF/views/lifestyle/updateResLifestyle.jsp");
		request.setAttribute("rl", rl);
		request.setAttribute("lf", lf);
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
