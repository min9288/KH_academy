package lifestyle.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.ResLifestyle;

/**
 * Servlet implementation class ResLifestyle2Servlet
 */
@WebServlet(name = "ResLifestyle2", urlPatterns = { "/resLifestyle2" })
public class ResLifestyle2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResLifestyle2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값 추출
		ResLifestyle rl = new ResLifestyle();
		rl.setLfNo(Integer.parseInt(request.getParameter("lfNo")));
		rl.setResPeople(Integer.parseInt(request.getParameter("resPeople")));
		rl.setResDate(request.getParameter("resDate"));
		rl.setResTime(request.getParameter("resTime"));
		rl.setPrice(Integer.parseInt(request.getParameter("price")));
			//테스트용 로그인 정보
		
		//3.비즈니스 로직
		Lifestyle lf = new LifestyleService().selectOneLfContent(rl.getLfNo());
		/*Member m = new MemberService.selectOneMember(m.getMemberNo());*/
		//4.결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/lifestyle/payLifestyle.jsp");
		request.setAttribute("rl", rl);
		request.setAttribute("lf", lf);
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
