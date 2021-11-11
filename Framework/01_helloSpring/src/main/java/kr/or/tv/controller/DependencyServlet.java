package kr.or.tv.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.tv.model.vo.LgTV;
import kr.or.tv.model.vo.SamsungTV;
import kr.or.tv.model.vo.TV;
import kr.or.tv.model.vo.TvFactory;

/**
 * Servlet implementation class DependencyServlet
 */
public class DependencyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DependencyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String brand = request.getParameter("brand");
		TvFactory factory = new TvFactory();
		// 만약 삼성TV -> LGTV로 변경한다면 수정되야하는 코드는?
		// SamsungTV tv = new SamsungTV();
//		TV tv = new LgTV();
//		TV tv = new SamsungTV();
		TV tv = factory.getTV(brand);
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
