package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inquiryView.modal.service.InquiryViewService;
import inquiryView.vo.InquiryView;
import inquiryView.vo.InquiryViewPageData;

/**
 * Servlet implementation class MyInquiryFrmServlet
 */
@WebServlet(name = "MyInquiryFrm", urlPatterns = { "/myInquiryFrm" })
public class MyInquiryFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInquiryFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String memberId = request.getParameter("memberId");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		InquiryViewPageData ivpd = new InquiryViewService().selectInquiryList(reqPage, email, memberId);
		InquiryView iV = new InquiryViewService().selectMyInquiry(email);
		HttpSession session = request.getSession();
		session.setAttribute("iv", iV);
//		response.sendRedirect("/WEB-INF/views/member/mypage_myInquiry.jsp");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_myInquiry.jsp");
		request.setAttribute("list", ivpd.getList());
		request.setAttribute("pageNavi", ivpd.getPageNavi());
		request.setAttribute("start", ivpd.getStart());
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
