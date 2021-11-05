package dining.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dining.model.service.DiningService;
import dining.model.vo.Dining;
import member.modal.vo.Member;

/**
 * Servlet implementation class DiningResvServlet
 */
@WebServlet(name = "DiningResvFrm", urlPatterns = { "/diningResvFrm" })
public class DiningResvFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningResvFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		if(session != null) {
			Member m = (Member)session.getAttribute("m");
			if(m == null) {
				request.setAttribute("msg", "로그인 후 이용 가능합니다.");
				request.setAttribute("loc", "/loginFrm");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
				return;
			}
			int diningNo = 0;
			try {
				diningNo = Integer.parseInt(request.getParameter("diningNo"));
			}catch (NumberFormatException e){
				diningNo = 1;
			}
			ArrayList<Dining> list = new DiningService().selectResvList();
			request.setAttribute("list", list);
			request.setAttribute("diningNo", diningNo);
			request.getRequestDispatcher("/WEB-INF/views/dining/diningResvFrm.jsp").forward(request, response);			
		}else {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			request.setAttribute("loc", "/loginFrm");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
