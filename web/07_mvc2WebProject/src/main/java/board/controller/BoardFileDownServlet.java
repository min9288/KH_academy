package board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;


/**
 * Servlet implementation class BoardFileDownServlet
 */
@WebServlet(name = "BoardFileDown", urlPatterns = { "/boardFileDown" })
public class BoardFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownServlet() {
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
				Board b = new BoardService().getBoard(boardNo);
				// 4. 결과처리
				// 파일 위치를 지정
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root + "upload/board/";
				String file = saveDirectory + b.getFilepath();
				System.out.println("다운로드 파일 전체 경로 : " + file);
				// 서버의 물리공간에서 서블릿으로 파일을 읽어오는 객체
				FileInputStream fis = new FileInputStream(file);
				// 파일을 읽어오는 속도를 개선하기 위한 보조스트림
				BufferedInputStream bis = new BufferedInputStream(fis);
				
				// 클라이언트로 파일을 보내주는 객체
				ServletOutputStream sos = response.getOutputStream();
				// 파일 전송속도를 개선하기 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(sos);
				
				// 테스트.txt -> ㅌ ㅔ ㅅ ㅡ ㅌ ㅡ .txt		%20%2f 
			    // -> 브라우저에 따른 파일이름 처리
				String resFilename = "";	// 최종 다운로드할 파일이름
				// 브라우저가 IE인지 확인
				boolean bool = 
						request.getHeader("user-agent").indexOf("MSIE") != -1 ||
						request.getHeader("user-agent").indexOf("Trident") != -1;
				System.out.println("IE 여부 : " + bool);
				if(bool) {	// 브라우저가 IE인 경우
					resFilename = URLEncoder.encode(b.getFilename(), "UTF-8");
					resFilename = resFilename.replaceAll("\\\\", "%20");
				} else {	// 그외 다른 브라우저인 경우
					resFilename = new String(b.getFilename().getBytes("UTF-8"), "ISO-8859-1");
				}
				// 파일 다운로드를 위한 HTTP header설정 (사용자 브라우저에 파일다운로드임을 선언)
				response.setContentType("application/octet-stream");
				// 다운로드할 파일 이름 지정
				response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
				
				// 파일전송
				while(true) {
					int read = bis.read();
					if(read != -1) {
						bos.write(read);
					}else {
						break;
					}
				}
				bis.close();
				bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
