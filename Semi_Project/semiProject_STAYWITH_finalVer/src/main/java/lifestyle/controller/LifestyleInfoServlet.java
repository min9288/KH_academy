package lifestyle.controller;

import java.io.IOException;

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
 * Servlet implementation class LifestyleInfoServlet
 */
@WebServlet(name = "LifestyleInfo", urlPatterns = { "/lifestyleInfo" })
public class LifestyleInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifestyleInfoServlet() {
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
		LifestyleList ll = new LifestyleService().selectOneLifestyle(lfNo);
		//4.결과처리
		if(ll != null) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/lifestyle/lifestyleInfo.jsp");
			request.setAttribute("lf", ll.getLf());
			request.setAttribute("categoryList", ll.getCategoryList());
			request.setAttribute("list", ll.getList());
			request.setAttribute("review", ll.getLfReview());
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "조회오류");
			request.setAttribute("loc", "/lifestyleList?reqPage=1");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
