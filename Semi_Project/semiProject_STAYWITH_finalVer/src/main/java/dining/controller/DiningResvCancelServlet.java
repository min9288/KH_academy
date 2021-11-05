package dining.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dining.model.service.DiningService;
import member.modal.vo.Member;

/**
 * Servlet implementation class DiningResvCancelServlet
 */
@WebServlet(name = "DiningResvCancel", urlPatterns = { "/diningResvCancel" })
public class DiningResvCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningResvCancelServlet() {
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
			String resNo = request.getParameter("resNo");
			String memberId = request.getParameter("memberId");
			int result = new DiningService().diningResvCancel(resNo);
			if(result>0) {
				request.setAttribute("msg", "예약이 취소되었습니다.");
			}else {
				request.setAttribute("msg", "정상적으로 처리되지 않았습니다. 1:1문의를 통해 문의해주세요.");
			}
			request.setAttribute("loc", "/mypageBookingDiningFrm?memberId="+memberId+"&reqPage=1");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);		
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
