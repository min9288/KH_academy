package lifestyle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.ResLifestyle;

/**
 * Servlet implementation class InsertResServlet
 */
@WebServlet(name = "InsertRes", urlPatterns = { "/insertRes" })
public class InsertResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertResServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		//2.값추출
		ResLifestyle rl = new ResLifestyle();
		rl.setMemberId(request.getParameter("memberId"));
		rl.setPrice(Integer.parseInt(request.getParameter("price")));
		rl.setResDate(request.getParameter("resDate"));
		rl.setResTime(request.getParameter("resTime"));
		rl.setLfNo(Integer.parseInt(request.getParameter("lfNo")));
		rl.setResPeople(Integer.parseInt(request.getParameter("resPeople")));
		//3.비즈니스 로직
		int result = new LifestyleService().insertResLifestyle(rl);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "예약에 성공하였습니다.");
			request.setAttribute("loc", "/mypageBookingFitnessFrm?memberId="+rl.getMemberId()+"&reqPage=1");
		}else {
			request.setAttribute("msg", "예약에 실패하였습니다.");
			request.setAttribute("loc", "/lifestyleInfo?lfNo="+rl.getLfNo());
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
