package admincontroller.LfRes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.Lf_Res;
import admin.model.vo.Lf_ResPageData;
import admin.model.vo.Room_Res;
import admin.model.vo.Room_ResPageData;

/**
 * Servlet implementation class Admin_GetLfListServlet
 */
@WebServlet(name = "Admin_GetLfList", urlPatterns = { "/admin_GetLfList" })
public class Admin_GetLfListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_GetLfListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		
		AdminService service = new AdminService();
		ArrayList<Lf_Res> list = null;
		Lf_ResPageData pagedata =  new Lf_ResPageData();
		
		pagedata =  service.get_LfResList(reqPage);	
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(pagedata,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
