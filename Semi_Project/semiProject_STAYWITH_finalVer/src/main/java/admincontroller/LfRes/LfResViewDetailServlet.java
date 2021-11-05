package admincontroller.LfRes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import admin.model.vo.Lf_Res;
import member.modal.vo.Member;


/**
 * Servlet implementation class LfResViewDetailServlet
 */
@WebServlet(name = "LfResViewDetail", urlPatterns = { "/lfResViewDetail" })
public class LfResViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LfResViewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String lNum = request.getParameter("lNum");
		
		HttpSession session = request.getSession(false);
		if(session != null) 
		{
			Member m = (Member)session.getAttribute("m");
			if(m == null || m.getMemberLevel() != 1) 
			{
				request.setAttribute("msg", "로그인 후 이용 가능합니다.");
				request.setAttribute("loc", "/loginFrm");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
				return;
			}
		}
		
		Lf_Res l = new AdminService().get_Lf_Res(lNum);
		
		RequestDispatcher view = null;
		
		view = request.getRequestDispatcher("/WEB-INF/views/admin/adminLfResView.jsp");
		request.setAttribute("l", l);
		
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
