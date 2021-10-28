package inquiryView.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiryView.modal.service.InquiryViewService;
import inquiryView.vo.InquiryAnswer;
import inquiryView.vo.InquiryView;
import inquiryView.vo.InquiryViewPageData;

/**
 * Servlet implementation class InquiryDetailServlet
 */
@WebServlet(name = "InquiryDetail", urlPatterns = { "/inquiryDetail" })
public class InquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		String qType = request.getParameter("qType");
		InquiryAnswer ia = new InquiryViewService().searchAnswer(qNo);
		InquiryView iv = new InquiryViewService().selectOneInquiryList(qNo);
		if(qType.equals("의견")) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myInquiry_opinion.jsp");
			request.setAttribute("ia", ia);
			request.setAttribute("iv", iv);
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myInquiry_inquiry.jsp");
			request.setAttribute("ia", ia);
			request.setAttribute("iv", iv);
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
