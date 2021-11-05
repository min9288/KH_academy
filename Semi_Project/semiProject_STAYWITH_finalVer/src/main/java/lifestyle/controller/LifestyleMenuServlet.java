package lifestyle.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.LifestyleList;

/**
 * Servlet implementation class LifestyleMenuServlet
 */
@WebServlet(name = "LifestyleMenu", urlPatterns = { "/lifestyleMenu" })
public class LifestyleMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifestyleMenuServlet() {
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
		//3.비즈니스 로직
		LifestyleList ll = new LifestyleService().selectAllLifestyle();
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/lifestyle/lifestyleMain.jsp");
		request.setAttribute("list", ll.getList());
		request.setAttribute("categoryList", ll.getCategoryList());
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
