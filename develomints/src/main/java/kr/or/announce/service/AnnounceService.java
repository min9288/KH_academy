package kr.or.announce.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.dao.AnnounceDao;
import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnounceList;
import kr.or.announce.vo.AnnounceListPageData;
import kr.or.announce.vo.AnnounceView;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumePageData;

@Service
public class AnnounceService {
	
	@Autowired
	private AnnounceDao dao;

	public int insertAnnounce(Announce a) {
		System.out.println("여기 announceService");
		return dao.insertAnnounce(a);
	}

	public Announce selectAllannounce(int memberNo) {
		return dao.selectAllAnnounce(memberNo);
	}

	public Announce selectOneAnnounce(int announceNo) {
		return dao.selectOneAnnounce(announceNo);
	}
	
	public AnnounceView selectAnnounceView(int announceNo) {
		return dao.selectAnnounceView(announceNo);
	}

	public int updateAnnounce(Announce a) {
		return dao.updateAnnounce(a);
	}

	public int deleteAnnounce(int announceNo) {
		int appResult = dao.deleteApplication(announceNo);
		if(appResult > 0) {
			System.out.println("deleteAnnounce Dao 여기 성공");
			return dao.deleteAnnounce(announceNo);
		} else {
			return 0;
		}
		
	}

	public AnnounceListPageData selectApplyAnnounce(int announceNo, int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("announceNo", announceNo);
		ArrayList<AnnounceList> list = dao.selectApplyAnnounce(map);
		
		int totalCount = dao.selectApplyAnnounceCount(announceNo);
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
			pageNavi += "<a class = 'page-link' href='/applicationStatus.do?announceNo="+announceNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/applicationStatus.do?announceNo="+announceNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/applicationStatus.do?announceNo="+announceNo+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/applicationStatus.do?announceNo="+announceNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		AnnounceListPageData apd = new AnnounceListPageData(list, pageNavi, start, totalCount);
		return apd;
		
	}

	/*
	 * public ArrayList<Announce> selectAllannounce(int memberNo) { return
	 * dao.selectAllAnnounce(memberNo); }
	 */
}
