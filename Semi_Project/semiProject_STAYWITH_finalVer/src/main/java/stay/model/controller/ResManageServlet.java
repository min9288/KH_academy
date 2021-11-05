package stay.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class ResManageServlet
 */
@WebServlet(name = "ResManage", urlPatterns = { "/resManage" })
public class ResManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//3.비즈니스 로직처리
		ArrayList<RoomReserve> list =new RoomService().selectAllReserve();
		//4.결과처리
        RequestDispatcher view
        =request.getRequestDispatcher("/WEB-INF/views/room/reserveManage.jsp");
        request.setAttribute("list", list);
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
