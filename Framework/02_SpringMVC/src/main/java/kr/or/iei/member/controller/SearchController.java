package kr.or.iei.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// 2. 값 추출
		String memberId = request.getParameter("memberId");
		// 3. 비즈니스로직 & 결과처리
		if(memberId.equals("user01")) {
			return "searchSucess";
		} else {
			return "searchFailed";
		}		
	}

}
