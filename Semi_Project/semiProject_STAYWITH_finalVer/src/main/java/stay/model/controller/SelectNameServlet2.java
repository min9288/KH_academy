package stay.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.model.service.RoomService;
import stay.model.vo.Room;
import stay.model.vo.RoomR;
import stay.model.vo.RoomReserve;

/**
 * Servlet implementation class SelectNameServlet
 */
@WebServlet(name = "SelectName2", urlPatterns = { "/selectName2" })
public class SelectNameServlet2 extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNameServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //1.인코딩
      request.setCharacterEncoding("utf-8");
      String checkInR = request.getParameter("checkInR");
      String checkOutR = request.getParameter("checkOutR");
      
     if(checkInR.isEmpty() || checkOutR.isEmpty()) {

      int roomNo = Integer.parseInt(request.getParameter("roomNo"));
      RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
      request.setAttribute("loc", "/reserveRFrm?roomNo="+roomNo);
      request.setAttribute("msg", "체크인, 체크아웃 날짜를 확인해주세요.");
      view.forward(request, response);
   }else {
      RoomReserve reserve =new RoomReserve();
      //2.화면에서 전달한 데이터를 추출
      reserve.setCheckIn(checkInR);
      reserve.setCheckOut(checkOutR);
      reserve.setRoomName(request.getParameter("roomName"));
      reserve.setBed(request.getParameter("bed"));
      reserve.setAdult(Integer.parseInt(request.getParameter("adult")));
      reserve.setKid(Integer.parseInt(request.getParameter("kid")));
      //3.비즈니스로직
      ArrayList<RoomR> list =new RoomService().selectCheck(reserve);
      //4.화면처리k
        RequestDispatcher view
        =request.getRequestDispatcher("/WEB-INF/views/room/reserve2.jsp"); 
        request.setAttribute("reserve", reserve);
        request.setAttribute("list", list);
        view.forward(request, response);
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