package stay.model.controller;

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

import stay.model.service.RoomService;
import stay.model.vo.Room;



/**
 * Servlet implementation class InsertRoomServlet
 */
@WebServlet(name = "InsertRoom", urlPatterns = { "/insertRoom" })
public class InsertRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");

		//2.화면에서 전달한 데이터를 추출
		if(!ServletFileUpload.isMultipartContent(request)) {
	        RequestDispatcher view
	        =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");	
			request.setAttribute("msg", "객실등록오류[enctype]확인");
			request.setAttribute("loc", "/");
			 view.forward(request, response);
			 return;	
		}
		//파일업로드 준비
		//1)파일 업로드 경로지정
		String root =getServletContext().getRealPath("/");
		String saveDirectory =root+"upload/room";
		//2)파일크기지정
		int maxSize =10*1024*1024;//(byte단위로 변환)
		//3)request객체를 multipartRequest객체로 변환(변환하면서 파일이 서버에 업로드 됨)
		MultipartRequest mRequest
		=new MultipartRequest(request,saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());

		
		Room r =new Room();  //하나로 데이터 묶기
       
       r.setRoomType(mRequest.getParameter("roomType"));
       r.setRoomName(mRequest.getParameter("roomName"));
       r.setRoomDetail(mRequest.getParameter("roomDetail"));
       r.setRoomLoc(mRequest.getParameter("roomLoc"));
       r.setRoomSize(mRequest.getParameter("roomSize"));
       r.setBed(mRequest.getParameter("bed"));
       r.setRoomForm(mRequest.getParameter("roomForm"));
       r.setRoomView(mRequest.getParameter("roomView"));
       r.setMaxNum(Integer.parseInt(mRequest.getParameter("maxNum")));
       r.setRoomPrice(Integer.parseInt(mRequest.getParameter("roomPrice")));
       r.setRoomImg(mRequest.getFilesystemName("r-Img"));
       r.setRoomInfo(mRequest.getFilesystemName("roomInfo"));
       r.setRoomStatus(Integer.parseInt(mRequest.getParameter("roomStatus")));
       
		//3.비즈니스 로직처리
		int result =new RoomService().insertRoom(r);
		//결과처리
	   if(result>0) {
		   response.sendRedirect("/roomManage");
	   }else {
		  RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		  request.setAttribute("msg", "객실등록실패");
		  request.setAttribute("loc", "/roomFrm");
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
