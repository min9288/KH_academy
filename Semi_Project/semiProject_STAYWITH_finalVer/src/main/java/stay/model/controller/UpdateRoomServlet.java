package stay.model.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class UpdateRoomServlet
 */
@WebServlet(name = "UpdateRoom", urlPatterns = { "/updateRoom" })
public class UpdateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomServlet() {
        super();
        // TODO Aurooto-generated constructor stub
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
			request.setAttribute("msg", "오류[enctype]확인");
			request.setAttribute("loc", "/");
			view.forward(request, response);
			return;	
		}
		//파일업로드 준비
		//1)파일 업로드 경로지정
		String root =getServletContext().getRealPath("/");
		System.out.println("root :"+root);
		String saveDirectory =root+"upload/room";
		System.out.println("파일지정경로 :"+saveDirectory);
		//2)파일크기지정
		int maxSize =10*1024*1024;//(byte단위로 변환)
		//3)request객체를 multipartRequest객체로 변환(변환하면서 파일이 서버에 업로드 됨)
		MultipartRequest mRequest
		=new MultipartRequest(request,saveDirectory,maxSize,"UTF-8",new DefaultFileRenamePolicy());

		
		Room r =new Room();
		  r.setRoomNo(Integer.parseInt(mRequest.getParameter("roomNo")));
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
	       r.setRoomStatus(Integer.parseInt(mRequest.getParameter("roomStatus")));
	       //파일명저장
	       r.setRoomImg(mRequest.getFilesystemName("upfile")); 
	       //기존파일경로
	       String oldFilename =mRequest.getParameter("oldFilename");
	       
		//삭제여부 판단용 값
		int status =Integer.parseInt(mRequest.getParameter("status"));
		if(status==2) {//기존파일을 지운경우
			File delFile =new File(saveDirectory+"/"+oldFilename);
			delFile.delete();

		}else if(oldFilename!=null){
			r.setRoomImg(oldFilename);	
		}
		
		//3.비즈니스 로직처리
		int result =new RoomService().updateRoom(r);
		//4.결과처리
		  RequestDispatcher view =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp"); 
		  
		  if(result>0) {
			  request.setAttribute("msg", "수정성공.");
		  }else {
			  request.setAttribute("msg", "수정이 실패입니다..");
		  }
		  request.setAttribute("loc", "/roomManage?roomNo="+r.getRoomNo());
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
