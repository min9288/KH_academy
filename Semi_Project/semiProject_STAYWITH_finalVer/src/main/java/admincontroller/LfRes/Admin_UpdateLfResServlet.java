package admincontroller.LfRes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Dining_Res;
import admin.model.vo.Lf_Res;

/**
 * Servlet implementation class Admin_UpdateLfResServlet
 */
@WebServlet(name = "Admin_UpdateLfRes", urlPatterns = { "/admin_UpdateLfRes" })
public class Admin_UpdateLfResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_UpdateLfResServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		
		String res_No = request.getParameter("res_No");
		int lf_No = Integer.parseInt(request.getParameter("lf_No"));
		int res_People = Integer.parseInt(request.getParameter("res_People"));
		String res_Date = request.getParameter("res_Date");
		String res_Time = request.getParameter("res_Time");
		
		int res_Status = Integer.parseInt(request.getParameter("res_Status"));
		int lf_Price = Integer.parseInt(request.getParameter("lf_Price"));
		
		
		AdminService service = new AdminService();		
		
		Lf_Res r = service.get_Lf_Res(res_No);
		int result = 0;
		
		if(r == null)
		{
			result = 0;
			System.out.println("not found call res_Num in Lf_Res Table");
		}
		else
		{
			r.setRes_No(res_No);
			r.setLf_No(lf_No);
			r.setRes_People(res_People);
			r.setRes_Date(res_Date);
			r.setRes_Time(res_Time);
			
			r.setStatus(res_Status);
			r.setPrice(lf_Price);
			result = service.update_LfRes(r);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
