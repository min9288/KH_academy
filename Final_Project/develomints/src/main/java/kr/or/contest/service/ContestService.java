package kr.or.contest.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.contest.dao.ContestDao;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;

@Service
public class ContestService {

	@Autowired
	private ContestDao dao;
	
	@Transactional
	public int insertContest(Contest c) {
		return dao.insertContest(c);
	}

	public ArrayList<Contest> contestAllList() {
		return dao.contestAllList();
	}

	public ContestList selectContestList() {
		ArrayList<Contest> newContest = dao.newContestList();
		ArrayList<Contest> hotContest = dao.hotContestList();
		ContestList list = new ContestList(newContest, hotContest);
		return list;
	}

	public ContestList contestView(int contestNo) {
		int result = dao.contestCountUp(contestNo);
		Contest contest = dao.contestView(contestNo);
		int enrollCount = dao.enrollCount(contestNo);
		ArrayList<Comment> commentList = dao.commentList(contestNo);
		ContestList list = new ContestList(commentList, contest, enrollCount);
		return list;
	}
	
	@Transactional
	public int insertContestComment(Comment cm) {
		return dao.insertContestComment(cm);
	}
	
	@Transactional
	public int updateContestComment(Comment cm) {
		return dao.updateContestComment(cm);
	}
	
	@Transactional
	public int deleteContestComment(Comment cm) {
		return dao.deleteContestComment(cm);
	}
	
	@Transactional
	public int reportContestComment(Report rp) {
		return dao.reportContestComment(rp);
	}
	
	@Transactional
	public int insertContestMember(ContestMember conmem) {
		return dao.insertContestMember(conmem);
	}

	public ContestList contestCateList(int reqPage, int type) {
		//한페이지에 보여줄 공모전 수
		int numPerPage = 8;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		ArrayList<Contest> contestList = dao.contestCateList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalCount(type);
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination pagination-lg' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allContestList.do?reqPage="+(pageNo-1)+"&type="+type+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/allContestList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allContestList.do?reqPage="+pageNo+"&type="+type+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allContestList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ContestList list = new ContestList(contestList, start, pageNavi);
		
		return list;
	}

	public ArrayList<Contest> searchContest(String contestDeadline) {
		return dao.searchContest(contestDeadline);
	}

	public int deleteContest(int contestNo) {
		return dao.deleteContest(contestNo);
	}

	public int duplicationCheckCon(String memberId, int contestNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("contestNo", contestNo);
		return dao.duplicationCheckCon(map);
	}
}












