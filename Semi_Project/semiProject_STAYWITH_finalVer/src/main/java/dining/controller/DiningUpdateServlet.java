package dining.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dining.model.service.DiningService;
import dining.model.vo.Dining;
import dining.model.vo.DiningTime;

/**
 * Servlet implementation class DiningUpdateServlet
 */
@WebServlet(name = "DiningUpdate", urlPatterns = { "/diningUpdate" })
public class DiningUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/dining";
		int maxSize = 20*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Dining d = new Dining();
		d.setDiningNo(Integer.parseInt(mRequest.getParameter("diningNo")));
		d.setDiningType(Integer.parseInt(mRequest.getParameter("diningType")));
		d.setDiningName(mRequest.getParameter("diningName"));
		d.setDiningInfo(mRequest.getParameter("diningInfo"));
		d.setDiningLoc(mRequest.getParameter("diningLoc"));
		d.setDiningIntro(mRequest.getParameter("diningIntro"));
		String oldThumb = mRequest.getParameter("oldThumb");
		String oldDetail = mRequest.getParameter("oldDetail");
		d.setThumbnailImg(oldThumb);
		d.setDetailedImg(oldDetail);
		d.setTel(mRequest.getParameter("tel"));
		if(mRequest.getFilesystemName("thumbnail") != null) {
			d.setThumbnailImg(mRequest.getFilesystemName("thumbnail"));
			new File(saveDirectory+"/"+oldThumb).delete();
		}
		if(mRequest.getFilesystemName("detailed") != null) {
			d.setDetailedImg(mRequest.getFilesystemName("detailed"));
			new File(saveDirectory+"/"+oldDetail).delete();
		}
		if(d.getDiningType() != 3) {
			d.setSeatCnt(Integer.parseInt(mRequest.getParameter("seatCnt")));
			d.setRoomCnt(Integer.parseInt(mRequest.getParameter("roomCnt")));
		}else {
			d.setSeatCnt(0);
			d.setRoomCnt(0);
		}
		ArrayList<DiningTime> timeList = new ArrayList<DiningTime>();
		if(d.getDiningType() == 1) {
			DiningTime lunch = new DiningTime();
			lunch.setTimeType(1);
			lunch.setOpen(mRequest.getParameter("lunchOpen"));
			lunch.setClose(mRequest.getParameter("lunchClose"));
			lunch.setDiningNo(d.getDiningNo());
			DiningTime dinner = new DiningTime();
			dinner.setTimeType(2);
			dinner.setOpen(mRequest.getParameter("dinnerOpen"));
			dinner.setClose(mRequest.getParameter("dinnerClose"));
			dinner.setDiningNo(d.getDiningNo());
			timeList.add(lunch);
			timeList.add(dinner);
			d.setTimeList(timeList);
		}else if(d.getDiningType() == 2) {
			DiningTime brunch = new DiningTime();
			brunch.setTimeType(3);
			brunch.setOpen(mRequest.getParameter("brunchOpen"));
			brunch.setClose(mRequest.getParameter("brunchClose"));
			brunch.setDiningNo(d.getDiningNo());
			DiningTime after = new DiningTime();
			after.setTimeType(4);
			after.setOpen(mRequest.getParameter("afterOpen"));
			after.setClose(mRequest.getParameter("afterClose"));
			after.setDiningNo(d.getDiningNo());
			DiningTime day = new DiningTime();
			day.setTimeType(5);
			day.setOpen(mRequest.getParameter("dayOpen"));
			day.setClose(mRequest.getParameter("dayClose"));
			day.setDiningNo(d.getDiningNo());
			timeList.add(brunch);
			timeList.add(after);
			timeList.add(day);
			d.setTimeList(timeList);
		}else {
			DiningTime day = new DiningTime();
			day.setTimeType(5);
			day.setOpen(mRequest.getParameter("dayOpen"));
			day.setClose(mRequest.getParameter("dayClose"));
			day.setDiningNo(d.getDiningNo());
			timeList.add(day);
			d.setTimeList(timeList);
		}
		int result = new DiningService().updateDining(d);
		if(result>0) {
			request.setAttribute("msg", "수정 완료");
		}else {
			request.setAttribute("msg", "수정 실패");
		}
		request.setAttribute("loc", "/diningList");
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
