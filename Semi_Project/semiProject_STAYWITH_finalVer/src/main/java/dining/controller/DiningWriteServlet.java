package dining.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dining.model.service.DiningService;
import dining.model.vo.Dining;
import dining.model.vo.DiningData;
import dining.model.vo.DiningTime;

/**
 * Servlet implementation class DiningWriteServlet
 */
@WebServlet(name = "DiningWrite", urlPatterns = { "/diningWrite" })
public class DiningWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiningWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/dining";
		int maxSize = 20*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Dining d = new Dining();
		d.setDiningType(Integer.parseInt(mRequest.getParameter("diningType")));
		d.setDiningName(mRequest.getParameter("diningName"));
		d.setDiningInfo(mRequest.getParameter("diningInfo"));
		d.setDiningLoc(mRequest.getParameter("diningLoc"));
		d.setDiningIntro(mRequest.getParameter("diningIntro"));
		d.setThumbnailImg(mRequest.getFilesystemName("thumbnail"));
		d.setDetailedImg(mRequest.getFilesystemName("detailed"));
		d.setTel(mRequest.getParameter("tel"));
		if(d.getDiningType() != 3) {
			d.setSeatCnt(Integer.parseInt(mRequest.getParameter("seatCnt")));
			d.setRoomCnt(Integer.parseInt(mRequest.getParameter("roomCnt")));
		}else {
			d.setSeatCnt(0);
			d.setRoomCnt(0);
		}
		DiningData dd = new DiningData();
		dd.setD(d);
		if(d.getDiningType() == 1) {
			DiningTime lunch = new DiningTime();
			lunch.setTimeType(1);
			lunch.setOpen(mRequest.getParameter("lunchOpen"));
			lunch.setClose(mRequest.getParameter("lunchClose"));
			DiningTime dinner = new DiningTime();
			dinner.setTimeType(2);
			dinner.setOpen(mRequest.getParameter("dinnerOpen"));
			dinner.setClose(mRequest.getParameter("dinnerClose"));
			dd.setLunch(lunch);
			dd.setDinner(dinner);
		}else if(d.getDiningType() == 2) {
			DiningTime brunch = new DiningTime();
			brunch.setTimeType(3);
			brunch.setOpen(mRequest.getParameter("brunchOpen"));
			brunch.setClose(mRequest.getParameter("brunchClose"));
			DiningTime after = new DiningTime();
			after.setTimeType(4);
			after.setOpen(mRequest.getParameter("afterOpen"));
			after.setClose(mRequest.getParameter("afterClose"));
			DiningTime day = new DiningTime();
			day.setTimeType(5);
			day.setOpen(mRequest.getParameter("dayOpen"));
			day.setClose(mRequest.getParameter("dayClose"));
			dd.setBrunch(brunch);
			dd.setAfter(after);
			dd.setDay(day);
		}else {
			DiningTime day = new DiningTime();
			day.setTimeType(5);
			day.setOpen(mRequest.getParameter("dayOpen"));
			day.setClose(mRequest.getParameter("dayClose"));
			dd.setDay(day);
		}
		int result = new DiningService().insertDining(dd);
		if(result>0) {
			request.setAttribute("msg", "등록 완료");
		}else {
			request.setAttribute("msg", "등록 실패");
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
