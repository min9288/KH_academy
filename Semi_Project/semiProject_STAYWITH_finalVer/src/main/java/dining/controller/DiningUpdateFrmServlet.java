package dining.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dining.model.service.DiningService;
import dining.model.vo.Dining;

/**
 * Servlet implementation class DiningUpdateFrmServlet
 */
@WebServlet(name = "DiningUpdateFrm", urlPatterns = { "/diningUpdateFrm" })
public class DiningUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningUpdateFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int diningNo = Integer.parseInt(request.getParameter("diningNo"));
		Dining d = new DiningService().selectOneDining(diningNo);
		request.setAttribute("d", d);
		request.getRequestDispatcher("/WEB-INF/views/dining/diningUpdateFrm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
