package dining.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dining.model.service.DiningService;
import dining.model.vo.ResInfo;

/**
 * Servlet implementation class SelDateServlet
 */
@WebServlet(name = "SelDate", urlPatterns = { "/selDate" })
public class SelDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int diningNo = Integer.parseInt(request.getParameter("diningNo"));
		String date = request.getParameter("dateStr");
		ResInfo r = new DiningService().selectResInfo(diningNo, date);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		new Gson().toJson(r, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
