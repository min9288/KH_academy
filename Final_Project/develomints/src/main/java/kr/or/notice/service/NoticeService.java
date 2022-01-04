package kr.or.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.notice.dao.NoticeDao;
import kr.or.notice.vo.Criteria;
import kr.or.notice.vo.Notice;
import kr.or.notice.vo.NoticePageData;
import kr.or.notice.vo.Rnum;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;
	
	public NoticePageData selectNoticeList(int reqPage) {
		ArrayList<Notice> fixlist = dao.selectFin();
		int numPerPage = 10;	// 1-10 / 11-20 / 21-30 
		int end = reqPage * numPerPage;            	
		int start = end - numPerPage + 1;
		Criteria cr = new Criteria();
		cr.setStart(start);
		cr.setEnd(end);
		ArrayList<Notice> list = dao.selectNoticeList(cr);
		int totalCount = dao.selectTotalCount();  
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1; // 네비 시작번호
		String pageNavi = "<ul class='pagination'>";
		if (pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/noticeList.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {  // 0,1,2,3,4
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/noticeList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/noticeList.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {  // 최종 페이지보다 네비게이션 시작번호가 더 클 경우, break
				break;				   // ex.totalPage는 5
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/noticeList.do?reqPage=" + pageNo + "'>";  // 페이지가 이미 1이 증가된 상태로 들어오기때문에 pageNo로 작성
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		int fixPage = dao.fixPageCount();
		fixlist.addAll(list);  // 고정페이지와 일반페이지 합침
		NoticePageData npd = new NoticePageData(fixlist, fixPage, pageNavi, start, totalCount);
		return npd;
	}

	public Notice selectOneNotice(int noticeNo) {
		int result = dao.noticeCountUp(noticeNo);
		Notice n = dao.selectOneNotice(noticeNo);
		return n;
	}

	@Transactional
	public int insertNotice(Notice n) {
		int result = dao.insertNotice(n);
		return result;
	}

	public ArrayList<Notice> noticeAroundList(int noticeNo) {
		ArrayList<Notice> nlist = dao.noticeAroundList(noticeNo);
		return nlist;
	}

	@Transactional
	public int deleteNoticeNo(int noticeNo) {
		int result = dao.deleteNoticeNo(noticeNo);
		return result;
	}

	@Transactional
	public int updateNoticeNo(Notice n) {
		return dao.updateNoticeNo(n);
	}

	public Rnum selectRnum(int noticeNo) {
		return dao.selectRnum(noticeNo);
	}

	public ArrayList<Rnum> selectRnumList(int rnum) {
		ArrayList<Rnum> rlist = dao.selectRnumList(rnum);
		return rlist;
	}

	public ArrayList<Notice> noticeList() {
		ArrayList<Notice> nlist = dao.noticeList();
		return nlist;
	}

	
}
