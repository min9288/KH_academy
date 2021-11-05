package stay.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.Room;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class RoomCancleServlet
 */
@WebServlet(name = "RoomCancle", urlPatterns = { "/roomCancle" })
public class RoomCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomCancleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		//추출
		String checkIn =request.getParameter("checkIn");
		String checkOut =request.getParameter("checkout");
		String resNum =request.getParameter("resNum");
		String memberKname =request.getParameter("memberKname");	
		String adult =request.getParameter("adult");
		String kid =request.getParameter("kid");
		//비즈니스로직
		RoomService service =new RoomService();
		RoomReserve res =service.detailRerserve(resNum);
		int result =new RoomService().cancleRes(res);
		//결과처리
		 RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		 if(result>0) {
			 request.setAttribute("msg", "삭제성공");
			 request.setAttribute("loc", "/roomManage");
		 }else {
			 request.setAttribute("msg", "삭제실패");
			 //request.setAttribute("loc", "/noticeView?noticeNp="+noticeNo);
			 
		 }
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
