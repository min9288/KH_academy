package dining.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dining.model.service.DiningService;
import dining.model.vo.DiningRes;
import member.modal.vo.Member;

/**
 * Servlet implementation class DiningResvServlet
 */
@WebServlet(name = "DiningResv", urlPatterns = { "/diningResv" })
public class DiningResvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningResvServlet() {
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
			DiningRes dr = new DiningRes();
			dr.setDiningNo(Integer.parseInt(request.getParameter("diningNo")));
			dr.setRDate(request.getParameter("rDate"));
			dr.setAdtCnt(Integer.parseInt(request.getParameter("adtCnt")));
			dr.setKidCnt(Integer.parseInt(request.getParameter("kidCnt")));
			dr.setTimeType(Integer.parseInt(request.getParameter("timeType")));
			dr.setResTime(request.getParameter("resTime"));
			dr.setSeatType(Integer.parseInt(request.getParameter("seatType")));
			dr.setMemberId(m.getMemberId());
			int result = new DiningService().insertDiningResv(dr);
			if(result>0) {
				request.setAttribute("msg", "예약이 완료되었습니다.");
			}else {
				request.setAttribute("msg", "정상적으로 처리되지 않았습니다. 1:1문의를 통해 문의해주세요.");
			}
			request.setAttribute("loc", "/mypageBookingDiningFrm?memberId="+m.getMemberId()+"&reqPage=1");
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
