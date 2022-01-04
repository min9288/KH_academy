package kr.or.jobSearch.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnouncePageData;
import kr.or.announce.vo.SearchAnnounce;
import kr.or.announce.vo.SearchAnnouncePageData;
import kr.or.jobSearch.dao.JobSearchDao;

@Service
public class JobSearchService {

	@Autowired
	private JobSearchDao dao;

	public AnnouncePageData selectAllAnnounce(int reqPage) {
		
			int numPerPage = 5;
			int end = reqPage * numPerPage;
			int start = end - numPerPage + 1;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			ArrayList<Announce> list = dao.selectJobSearchList(map);
			int totalCount = dao.selectTotalCount();
			int totalPage = 0;
			if(totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
			String pageNavi = "<ul class='pagination pagination-lg'>";
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/jobSearchList.do?reqPage="+(pageNo-1)+"'>";
				pageNavi += "&lt;</a></li>";
			}// 페이지 숫자
			for(int i=0; i < pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li class='page-item active'>";
					pageNavi += "<a class = 'page-link' href='/jobSearchList.do?reqPage="+pageNo+"'>";
					pageNavi += pageNo + "</a></li>";
				} else {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class = 'page-link' href='/jobSearchList.do?reqPage="+pageNo+"'>";
					pageNavi += pageNo + "</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
			// 다음 버튼
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/jobSearchList.do?reqPage="+pageNo+"'>";
				pageNavi += "&gt;</a></li>";
			}
			pageNavi += "</ul>";
			AnnouncePageData apd = new AnnouncePageData(list, pageNavi, start);
			return apd;
		}

	public int selectAllAnnounceCount() {
		return dao.selectAllAnnounceCount();
	}

	public String selectComName(int comNo) {
		return dao.selectComName(comNo);
	}

	public SearchAnnouncePageData selectSearchAnnouncePageData(int reqPage, String keyword, int placeType, int workType) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		map.put("placeType", placeType);
		map.put("workType", workType);
		ArrayList<SearchAnnounce> list = dao.selectSearchAllAnnounce(map);
		
		int totalCount = dao.selectSearchAllAnnounceCount();
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/searchAnnounce.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"&placeType="+placeType+"&workType="+workType+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/searchAnnounce.do?reqPage="+pageNo+"&keyword="+keyword+"&placeType="+placeType+"&workType="+workType+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/searchAnnounce.do?reqPage="+pageNo+"&keyword="+keyword+"&placeType="+placeType+"&workType="+workType+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/searchAnnounce.do?reqPage="+pageNo+"&keyword="+keyword+"&placeType="+placeType+"&workType="+workType+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		SearchAnnouncePageData sapd = new SearchAnnouncePageData(list, pageNavi, start, totalCount);
		return sapd;
	}

	
}
