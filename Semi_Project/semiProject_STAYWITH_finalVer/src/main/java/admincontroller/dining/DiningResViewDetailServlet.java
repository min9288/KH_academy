package admincontroller.dining;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Dining_Res;
import admin.model.vo.Room_Res;


/**
 * Servlet implementation class DiningResViewDetailServlet
 */
@WebServlet(name = "DiningResViewDetail", urlPatterns = { "/diningResViewDetail" })
public class DiningResViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningResViewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String dNum = request.getParameter("dNum");
		Dining_Res d = new AdminService().get_Dining_Res(dNum);
		
		request.setAttribute("d", d);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminDiningView.jsp");
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
