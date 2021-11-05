package lifestyle.controller;

import java.io.File;
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
 * Servlet implementation class UpdateLifestyleConfirmServlet
 */
@WebServlet(name = "UpdateLifestyleConfirm", urlPatterns = { "/updateLifestyleConfirm" })
public class UpdateLifestyleConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLifestyleConfirmServlet() {
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
			request.setAttribute("msg", "enctype오류");
			request.setAttribute("loc", "/");
			view.forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/thumbnail";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		Lifestyle lf = new Lifestyle();
		lf.setLfNo(Integer.parseInt(mRequest.getParameter("lfNo")));
		lf.setLfCategory(mRequest.getParameter("lfCategory"));
		lf.setLfTitle(mRequest.getParameter("lfTitle"));
		lf.setLfContent(mRequest.getParameter("lfContent"));
		lf.setFilename(mRequest.getOriginalFileName("upfile"));
		lf.setFilepath(mRequest.getFilesystemName("upfile"));
		lf.setThumbnail(mRequest.getParameter("thumbnail"));
		System.out.println(lf.getThumbnail());
		System.out.println(lf.getFilename());
		//3.비즈니스 로직
		int result = new LifestyleService().updateLifestlye(lf);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result >0) {
			request.setAttribute("msg", "수정이 완료되었습니다.");
			request.setAttribute("loc", "/lifestyleInfo?lfNo="+lf.getLfNo());
		}else {
			request.setAttribute("msg", "수정에 실패하였습니다.");
			request.setAttribute("loc", "/updateLifestyle?lfNo="+lf.getLfNo());
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
