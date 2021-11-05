package dining.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dining.model.service.DiningService;
import dining.model.vo.Dining;

/**
 * Servlet implementation class DiningDeleteServlet
 */
@WebServlet(name = "DiningDelete", urlPatterns = { "/diningDelete" })
public class DiningDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int diningNo = Integer.parseInt(request.getParameter("diningNo"));
		DiningService service = new DiningService();
		Dining d = service.selectOneDining(diningNo);
		int result = service.deleteDining(diningNo);
		if(result>0) {
			String root = getServletContext().getRealPath("/");
			String thumbnail = root+"upload/dining/"+d.getThumbnailImg();
			String detailed = root+"upload/dining/"+d.getDetailedImg();
			new File(thumbnail).delete();
			new File(detailed).delete();
			request.setAttribute("msg", "삭제 완료");
		}else {
			request.setAttribute("msg", "삭제 실패");
		}
		request.setAttribute("loc", "/diningList");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
