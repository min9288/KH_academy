package lifestyle.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.LfReview;
import lifestyle.model.vo.Lifestyle;

/**
 * Servlet implementation class LifestyleSelectInfoServlet
 */
@WebServlet(name = "LifestyleSelectInfo", urlPatterns = { "/lifestyleSelectInfo" })
public class LifestyleSelectInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifestyleSelectInfoServlet() {
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
		String lfCategory = request.getParameter("lfCategory");
		//3.비즈니스 로직
		Lifestyle lf = new LifestyleService().selectOneLifestyle(lfCategory);
		int lfNo = lf.getLfNo();
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/lifestyleInfo?lfNo="+lfNo);
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
