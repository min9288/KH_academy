package tourguide.controller;

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

import faq.model.vo.Faq;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import tourguide.model.service.TourguideService;
import tourguide.model.vo.Tourguide;

/**
 * Servlet implementation class TgWriteServlet
 */
@WebServlet(name = "TgWrite", urlPatterns = { "/tgWrite" })
public class TgWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TgWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "작성 오류");
			request.setAttribute("loc", "/tourguide");
			view.forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root +"upload/photo";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest  = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		Tourguide tg = new Tourguide();
		tg.setFilepath(mRequest.getFilesystemName("tgfile"));
		tg.setTgContent(mRequest.getParameter("tgContent"));
		tg.setTgLocation(mRequest.getParameter("tgLocation"));
		tg.setTgPhone(mRequest.getParameter("tgPhone"));
		tg.setTgSort(Integer.parseInt(mRequest.getParameter("tgSort")));
		tg.setTgTitle(mRequest.getParameter("tgTitle"));
		
		int result = new TourguideService().insertTg(tg);
	
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/tourguide");
		if(result>0) {
			request.setAttribute("msg", "등록 성공");
		}else {
			request.setAttribute("msg", "등록 실패");
				
			
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
