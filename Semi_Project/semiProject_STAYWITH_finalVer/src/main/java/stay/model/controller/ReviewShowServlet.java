package stay.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import stay.model.service.RoomService;
import stay.model.vo.RoomReview;

/**
 * Servlet implementation class ReviewShowServlet
 */
@WebServlet(name = "ReviewShow", urlPatterns = { "/reviewShow" })
public class ReviewShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //1.인코딩
      request.setCharacterEncoding("utf-8");

      //2.화면에서 전달한 데이터를 추출
      String roomName =request.getParameter("roomName");
      //3.비즈니스로직
      ArrayList<RoomReview> list =new RoomService().selectRoomReview(roomName);
      

      response.setContentType("application/json"); //되돌려주는게 json임을 명시하기
      response.setCharacterEncoding("utf-8");
      new Gson().toJson(list,response.getWriter());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
