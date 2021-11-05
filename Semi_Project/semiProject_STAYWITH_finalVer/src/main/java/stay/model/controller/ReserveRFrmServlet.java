package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dining.model.service.DiningService;
import dining.model.vo.DiningRes;
import member.modal.vo.Member;
import stay.model.service.RoomService;
import stay.model.vo.Room;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class ReserveRFrmServlet
 */
@WebServlet(name = "ReserveRFrm", urlPatterns = { "/reserveRFrm" })
public class ReserveRFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReserveRFrmServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Member m = (Member) session.getAttribute("m");
			if (m == null) {
				request.setAttribute("msg", "로그인 후 이용 가능합니다.");
				request.setAttribute("loc", "/loginFrm");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
				return;
			}
			int roomNo = Integer.parseInt(request.getParameter("roomNo"));
			Room r = new RoomService().detailRoom(roomNo);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/room/reserve2.jsp");
			request.setAttribute("r", r);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "로그인 후 이용 가능합니다.");
			request.setAttribute("loc", "/loginFrm");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
