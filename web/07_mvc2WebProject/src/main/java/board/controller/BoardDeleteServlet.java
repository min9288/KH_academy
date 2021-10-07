package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet(name = "BoardDelete", urlPatterns = { "/boardDelete" })
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
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
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		// 3. 비즈니스 로직
		BoardService service = new BoardService();
		Board b = service.getBoard(boardNo); // 삭제 성공시 파일을 삭제하기위해 filepath를 알아오기 위함
		int result = service.deleteBoard(boardNo);
		// 4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result > 0) {
			if(b.getFilepath() != null) { // 게시글 삭제를 성공하고, 해당 게시글에 첨부파일이 있는 경우
				String root = getServletContext().getRealPath("/");
				String file = root + "upload/board/" + b.getFilepath();
				System.out.println(file);
				File delFile = new File(file);
				delFile.delete();
			}
			request.setAttribute("msg", "삭제성공");
			request.setAttribute("loc", "/boardList?reqPage=1");
		} else {
			request.setAttribute("msg", "삭제실패");
			request.setAttribute("loc", "/boardView?boardNo="+boardNo);
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
