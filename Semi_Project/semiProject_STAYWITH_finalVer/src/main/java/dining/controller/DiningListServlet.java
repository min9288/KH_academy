package dining.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dining.model.service.DiningService;
import dining.model.vo.DiningListData;

/**
 * Servlet implementation class DiningListServlet
 */
@WebServlet(name = "DiningList", urlPatterns = { "/diningList" })
public class DiningListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage = 0;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (NumberFormatException e){
			reqPage = 1;
		}
		DiningListData dld = new DiningService().selectDiningList(reqPage);
		//결과 처리
		request.setAttribute("list", dld.getList());
		request.setAttribute("pageNavi", dld.getPageNavi());
		request.setAttribute("start", dld.getStart());
		request.getRequestDispatcher("/WEB-INF/views/dining/diningList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
