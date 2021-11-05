package lifestyle.controller;

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

import lifestyle.model.service.LifestyleService;
import lifestyle.model.vo.Lifestyle;

/**
 * Servlet implementation class AddLifestyleServlet
 */
@WebServlet(name = "AddLifestyle", urlPatterns = { "/addLifestyle" })
public class AddLifestyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLifestyleServlet() {
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
			request.setAttribute("msg", "공지사항 작성 오류[enctype]확인");
			request.setAttribute("loc", "/");
			view.forward(request, response);
			return;
		}
			String root = getServletContext().getRealPath("/");
			System.out.println("root : "+root);
			String saveDirectory = root+"upload/thumbnail";
			System.out.println("파일 저장 경로 : "+ saveDirectory);
			
			int maxsize = 10*1024*1024;
			
			MultipartRequest mRequest =new MultipartRequest(request, saveDirectory, maxsize,"UTF-8", new DefaultFileRenamePolicy());	
		

		Lifestyle lf = new Lifestyle();
		lf.setLfCategory(mRequest.getParameter("lfCategory"));
		lf.setLfTitle(mRequest.getParameter("lfTitle"));
		lf.setLfContent(mRequest.getParameter("lfContent"));
		lf.setFilename(mRequest.getOriginalFileName("upfile"));
		lf.setFilepath(mRequest.getFilesystemName("upfile"));
		lf.setThumbnail(mRequest.getParameter("thumbnail"));
		
		//3.비즈니스 로직
		int result = new LifestyleService().insertLifestyle(lf);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "공지사항 등록 성공");
		}else {
			request.setAttribute("msg", "에러찾기");
		}
		request.setAttribute("loc", "/lifestyleList?reqPage=1");
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
