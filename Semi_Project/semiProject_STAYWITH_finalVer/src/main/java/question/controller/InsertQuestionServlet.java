package question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import question.model.service.QuestionService;
import question.model.vo.Question;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet(name = "InsertQuestion", urlPatterns = { "/insertQuestion" })
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");	
			request.setAttribute("msg", "1:1문의 작성 오류[enctype]확인");
			request.setAttribute("loc", "/");
			view.forward(request, response);
			return;
		}
		//파일업로드
		String root = getServletContext().getRealPath("/");
		System.out.println("root : "+root);
		String saveDirectory = root+"upload/question";
		System.out.println("파일 저장 경로 : "+ saveDirectory);
		
		int maxsize = 10*1024*1024;
		
		MultipartRequest mRequest =new MultipartRequest(request, saveDirectory, maxsize,"UTF-8", new DefaultFileRenamePolicy());
		String memberId = request.getParameter("memberId");
		Question q = new Question();
		
		q.setEmail(mRequest.getParameter("email"));
		q.setFileName(mRequest.getOriginalFileName("upfile"));
		q.setFilepath(mRequest.getFilesystemName("upfile"));
		q.setHome(mRequest.getParameter("home"));
		q.setPhone(mRequest.getParameter("phone"));
		q.setqAbout(mRequest.getParameter("qAbout"));
		q.setqAuto(mRequest.getParameter("qAuto"));
		q.setqCategory(mRequest.getParameter("qCategory"));
		q.setqContent(mRequest.getParameter("qContent"));
		q.setqName(mRequest.getParameter("qName"));
		/*q.setqNo(Integer.parseInt(mRequest.getParameter("qNo")));*/
		q.setqTitle(mRequest.getParameter("qTitle"));
		q.setqType(mRequest.getParameter("qType"));
		q.setResNo(mRequest.getParameter("resNo"));
		q.setUsedDate(mRequest.getParameter("usedDate"));
		//3.비즈니스 로직
		int result= new QuestionService().insertQuestion(q);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "문의 등록 성공");
			request.setAttribute("loc", "/myInquiryFrm?email="+q.getEmail()+"&memberId="+memberId+"&reqPage=1");	//마이페이지로 이동
		}else {
			request.setAttribute("msg", "필수 항목을 전부 입력 해주세요.");
			request.setAttribute("loc", "/question");
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
