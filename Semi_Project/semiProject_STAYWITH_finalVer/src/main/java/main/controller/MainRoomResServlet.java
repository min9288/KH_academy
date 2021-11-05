package main.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.model.vo.MainRoomRes;
import member.modal.vo.Member;

/**
 * Servlet implementation class MainRoomResServlet
 */
@WebServlet(name = "MainRoomRes", urlPatterns = { "/mainRoomRes" })
public class MainRoomResServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainRoomResServlet() {
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
			String checkin = request.getParameter("checkin");
		      String checkout = request.getParameter("checkout");
		      if(checkin.isEmpty() || checkout.isEmpty()) {
		         RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		         request.setAttribute("loc", "/");
		         request.setAttribute("msg", "체크인, 체크아웃 날짜를 확인해주세요.");
		         view.forward(request, response);
		      }else {
		      MainRoomRes mrr = new MainRoomRes();
		      mrr.setCheckin(checkin);
		      mrr.setCheckout(checkout);
		      mrr.setAdult(Integer.parseInt(request.getParameter("adult")));
		      mrr.setKid(Integer.parseInt(request.getParameter("kid")));
		   
		         RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/room/reserve2.jsp");
		         request.setAttribute("mrr", mrr);
		         
		         view.forward(request, response);
		      }
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