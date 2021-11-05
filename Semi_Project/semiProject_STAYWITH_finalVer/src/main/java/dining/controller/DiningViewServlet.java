package dining.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dining.model.service.DiningService;
import dining.model.vo.Dining;

/**
 * Servlet implementation class DiningViewServlet
 */
@WebServlet(name = "DiningView", urlPatterns = { "/diningView" })
public class DiningViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int diningNo = Integer.parseInt(request.getParameter("diningNo"));
		DiningService service = new DiningService();
		ArrayList<Dining> list = service.selectAllDining();
		Dining d = service.selectOneDining(diningNo);
		request.setAttribute("list", list);
		request.setAttribute("d", d);
		request.getRequestDispatcher("/WEB-INF/views/dining/diningView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
