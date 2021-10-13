package api.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import member.model.service.MemberService;

/**
 * Servlet implementation class MovieRankServlet
 */
@WebServlet(name = "MovieRank", urlPatterns = { "/movieRank" })
public class MovieRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieRankServlet() {
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
		String targetDt = request.getParameter("targetDt");
		
		String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList";
		String key = "2d1960a325f72e312330c46c40440bb2";
		
		String result = Jsoup.connect(url)		// 접속할 url
						.data("key",key)		// 매개변수 key 설정
						.data("targetDt", targetDt) 	// 매개변수 targetDt 설정
						.userAgent("Mozilla") 			// 접속 브라우저 설정
						.ignoreContentType(true)  		// 리턴하는 데이터 타입은 상관없음
						.execute() 				// 실행
						.body();				// 실행결과를 문자열 형태로 변환
		System.out.println(result);
		
		JsonParser parser = new JsonParser();	// 문자열을 json객체로 변환해줄 객체
		JsonObject movieRank = (JsonObject)parser.parse(result);	// result 문자열을 json 타입으로 변환
		// movieRank 객체에서 key가 boxOfficeResult인 값을 JsonObject로 추출
		JsonObject boxOffice = (JsonObject)movieRank.get("boxOfficeResult");
		// boxOffice 객체에서 key가 dailyBoxOfficeList인 값을 JsonArray 타입으로 추출
		JsonArray movieList =  (JsonArray)boxOffice.get("dailyBoxOfficeList");
		// 가져온 데이터를 자바에서 사용하기 위해 자바형식 객체로 변환
		ArrayList<Movie> list = new ArrayList<Movie>();
		for(int i=0;i<movieList.size();i++) {
			// movieList에서 0번째 데이터를 꺼내서 JsonObject 타입으로 변환
			JsonObject movie = (JsonObject)movieList.get(i);
			String rank = movie.get("rank").getAsString();
			String movieNm = movie.get("movieNm").getAsString();
			String openDt = movie.get("openDt").getAsString();
			String salesAcc = movie.get("salesAcc").getAsString();
			String audiAcc = movie.get("audiAcc").getAsString();
			Movie m = new Movie(rank, movieNm, openDt, salesAcc, audiAcc);
			list.add(m);
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
