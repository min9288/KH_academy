package tourguide.controller;

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

import tourguide.model.service.TourguideService;
import tourguide.model.vo.Tourguide;

/**
 * Servlet implementation class UpdateTgServlet
 */
@WebServlet(name = "UpdateTg", urlPatterns = { "/updateTg" })
public class UpdateTgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//2.값추출
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "작성 실패. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/tourguide");
			view.forward(request, response);
			return;
			
		
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/photo";
		
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		Tourguide tg = new Tourguide();
		tg.setFilepath(mRequest.getFilesystemName("tgfile"));
		tg.setTgContent(mRequest.getParameter("tgContent"));
		tg.setTgLocation(mRequest.getParameter("tgLocation"));
		tg.setTgNo(Integer.parseInt(mRequest.getParameter("tgNo")));
		tg.setTgPhone(mRequest.getParameter("tgPhone"));
		tg.setTgSort(Integer.parseInt(mRequest.getParameter("tgSort")));
		tg.setTgTitle(mRequest.getParameter("tgTitle"));
		//기존 파일명/파일경로
		String oldFilepath= mRequest.getParameter("oldfilepath");
		tg.setFilepath(oldFilepath);
		//삭제여부 판단용 값
		int status = Integer.parseInt(mRequest.getParameter("status"));
		if(status == 2 ) {
			File delFile = new File(saveDirectory+"/"+oldFilepath);
			delFile.delete();
		}
		//3.비즈니스로직
		int result = new TourguideService().updateTg(tg);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "정보수정완료");
		}else {
			request.setAttribute("msg", "정보수정실패");
				
		}
		request.setAttribute("loc", "/tourguide");
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
