package board.controller;

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

import board.model.service.BoardService;
import board.model.vo.Board;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet(name = "BoardUpdate", urlPatterns = { "/boardUpdate" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. 값 추출
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "enctype 오류");
			request.setAttribute("loc", "/");
			view.forward(request, response);
			return;
		}
		// 1) 파일업로드 경로 설정
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root + "upload/board";
		// 2) 파일업로드 최대 크기 지정(10MB)
		int maxSize = 10*1024*1024;
		// 3) request -> MultipartRequest로 변환 (파일이 업로드되는 시점)
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		Board b = new Board();
		b.setBoardNo(Integer.parseInt(mRequest.getParameter("boardNo")));
		b.setBoardTitle(mRequest.getParameter("boardTitle"));
		b.setBoardContent(mRequest.getParameter("boardContent"));
		// 파일명 저장 (새로운 파일이 업로드되면 새로운 파일정보, 새로운 파일이 업로드되지 않으면 null)
		b.setFilename(mRequest.getOriginalFileName("upfile"));
		b.setFilepath(mRequest.getFilesystemName("upfile"));
		// 기존 파일명 / 파일경로
		String oldFilename = mRequest.getParameter("oldFilename");
		String oldFilepath = mRequest.getParameter("oldFilepath");
		// 삭제여부 판단용 값
		int status = Integer.parseInt(mRequest.getParameter("status"));
		if(status == 2) { // 기존파일을 지운경우
			File delFile = new File(saveDirectory+"/"+oldFilepath);
			delFile.delete();
		} else if(oldFilename != null) {
			b.setFilename(oldFilename);
			b.setFilepath(oldFilepath);
		}
		// 3. 비즈니스 로직
		int result = new BoardService().updateBoard(b);
		// 4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			request.setAttribute("msg", "정보 수정 완료");
		}else {
			request.setAttribute("msg", "정보 수정 실패");
		}
		request.setAttribute("loc", "/boardView?boardNo="+b.getBoardNo());
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
