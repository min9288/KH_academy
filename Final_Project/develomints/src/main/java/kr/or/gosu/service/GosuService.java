package kr.or.gosu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.gosu.dao.GosuDao;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuListPageData;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuNoticeListPageData;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuRequestCostListPageData;
import kr.or.gosu.vo.GosuRequestCount;
import kr.or.gosu.vo.GosuRequestListPageData;
import kr.or.gosu.vo.GosuRequestProject;
import kr.or.gosu.vo.GosuRequestProjectSub;
import kr.or.gosu.vo.GosuRequestReview;
import kr.or.gosu.vo.GosuReview;
import kr.or.gosu.vo.GosuTalk;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.projectDevLanguage;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Service
public class GosuService {
	@Autowired
	private GosuDao dao;

	@Transactional
	public int insertGosu(Gosu g, ArrayList<GosuPhoto> photoList, ArrayList<GosuProject> projectList) {
		System.out.println(g.getGgsouNo());
		int gosuResult = dao.insertGosu(g);
		System.out.println(g.getGgsouNo());
		int photoResult = 0;
		int projectResult = 0;

		if (gosuResult > 0) {
			for (GosuPhoto gph : photoList) {
				gph.setGgsouNo(g.getGgsouNo());
				photoResult += dao.insertGPhoto(gph);
			}
			for (GosuProject gpr : projectList) {
				gpr.setGgsouNo(g.getGgsouNo());
				projectResult += dao.insertGProject(gpr);
			}
		} else {
			return -1;
		}
		return projectResult;
	}


	public Gosu selectGosuOne(int ggosuNo) {
		Gosu gosu = dao.selectGosuOne(ggosuNo);
		gosu.setGosuId(dao.selectGosuId(gosu.getGsouNo()));
		gosu.setGosuImg(dao.selectGosuImg(gosu.getGsouNo()));
		ArrayList<GosuReview> list2 = dao.selectGosuReviewList(gosu.getGgsouNo());
		if(!list2.isEmpty()) {
			gosu.setReviewAvg(dao.selectReviewAvg(gosu.getGgsouNo()));
			gosu.setReviewCount(dao.selectReviewCount(gosu.getGgsouNo()));
		}
		return gosu;
	}

	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		ArrayList<GosuProject> gList = dao.selectGosuProject(gNo);
		return gList;
	}

	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		ArrayList<GosuPhoto> gList = dao.selectGosuPhoto(gNo);
		return gList;
	}
	@Transactional
	public int insertGosuNotice(GosuNotice gNotice) {
		int result = dao.insertGosuNotice(gNotice);
		return result;
	}

	public GosuNotice selectGosuNoticeOne(int gnoticeNo) {
		GosuNotice gNotice = dao.selectGosuNoticeOne(gnoticeNo);
		gNotice.setWriteImg(dao.selectGosuImg(gNotice.getWriteId()));
		return gNotice;
	}


	public ArrayList<GosuNotice> selectGosuNoticeList2() {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList2();
		return list;
	}

	public ArrayList<Gosu> selectNewGosuList() {
		ArrayList<Gosu> list = dao.selectNewGosuList();
		return list;
	}

	public int selectGosuCount() {
		int gosuCount = dao.selectGosuCount();
		return gosuCount;
	}

	public GosuProject selectGProject(int pNo) {
		GosuProject gList = dao.selectGProject(pNo);
		return gList;
	}
	@Transactional
	public int insertGosuFeedback(GosuFeedback gf) {
		int result = dao.insertGosuFeedback(gf);
		return result;
	}

	public GosuFeedback selectFeedbackOne(int fbNo) {
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(fbNo);
		return gosuFeedback;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList(memberId);
		for (GosuFeedback g : list) {
			int ggosuNo = g.getGgosuNo();
			g.setGosuId(dao.selectGosuId2(ggosuNo));
			g.setGosuImg(dao.selectGosuImg(g.getGosuId()));
		}
		return list;
	}
	@Transactional
	public int insertGosuTalk(GosuTalk gt) {
		int result = dao.insertGosuTalk(gt);
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(gt.getFeedbackNo());
		if (gosuFeedback.getFeedbackNum() == 1) {
			int feedbackNumResult = dao.updateFeedbackNum(gt.getFeedbackNo());
		}
		return result;
	}

	public ArrayList<GosuTalk> selectGosuTalk(int fbNo) {
		ArrayList<GosuTalk> list = dao.selectGosuTalk(fbNo);
		for (GosuTalk g : list) {
			String writer = g.getWriter();
			g.setGosuImg(dao.selectGosuImg(writer));
			g.setMemberImg(dao.selectGosuImg(writer));
		}
		return list;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList2(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList2(memberId);
		for (GosuFeedback g : list) {
			g.setMemberId(dao.selectMemberId(g.getFeedbackNo()));
			g.setMemberImg(dao.selectGosuImg(g.getMemberId()));
		}
		return list;
	}
	@Transactional
	public int talkStop(int feedbackNo) {
		int result = dao.talkStop(feedbackNo);
		return result;
	}

	public Gosu selectgosuWriteList(String gosuId) {
		Gosu list = dao.selectgosuWriteList(gosuId);

		return list;
	}
	@Transactional
	public int insertGosuRequest(GosuRequest gr) {
		int result = dao.insertGosuRequest(gr);
		return result;
	}


	public GosuRequest selectGosuRequestContent(int mrn) {
		GosuRequest gosuRequest = dao.selectGosuRequestContent(mrn);	
		gosuRequest.setRequestWriterId(dao.selectGosuId(gosuRequest.getRequestWriterNo()));
		
		return gosuRequest;
	}
	@Transactional
	public int gosuRequestCostInsert(GosuRequestCost grc) {
		int result = dao.gosuRequestCostInsert(grc);
		return result;
	}



	public GosuRequestCost selectRequestNoGosuNo(GosuRequestCost grc) {
		GosuRequestCost requestNoGosuNo = dao.selectRequestNoGosuNo(grc);	
		return requestNoGosuNo;
	}

	public GosuRequestCost selectGosuRequestCost(int costNo) {
		GosuRequestCost gosuRequestCost = dao.selectGosuRequestCost(costNo);
		gosuRequestCost.setGosuId(dao.selectGosuId(gosuRequestCost.getGosuNo()));
		return gosuRequestCost;
	}

	public GosuRequestCount selectGosuCountRequestCount() {
		GosuRequestCount gosuRequestCount = new GosuRequestCount();
		gosuRequestCount.setCountGosu(dao.selectGosuCount());
		gosuRequestCount.setCountRequest(dao.selectRequestCount());		
		return gosuRequestCount;
	}
	@Transactional
	public int insertGosuRequestProjectSub(GosuRequestProjectSub grps) {
		int result = dao.insertGosuRequestProjectSub(grps);
		return result;
	}

	public ArrayList<GosuRequestProject> selectGosuRequestProjectOne(int rpsNo) {
		ArrayList<GosuRequestProject> list = dao.selectGosuRequestProjectOne(rpsNo);
	
		return list;
	}

	public GosuRequestProjectSub selectGosuRequestProjectSub(int rpsNo) {
		GosuRequestProjectSub grps = dao.selectGosuRequestProjectSub(rpsNo);
		
		return grps;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList(int memberNo) {
		ArrayList<GosuRequestProjectSub> list = dao.selectGosuRequestProjectSubList(memberNo);
	
		return list;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList2(int memberNo) {
		ArrayList<GosuRequestProjectSub> list = dao.selectGosuRequestProjectSubList2(memberNo);
	
		return list;
	}

	public int insertGosuRequestProject(GosuRequestProject grp) {
		int result = dao.insertGosuRequestProject(grp);
		return result;
	}

	@Transactional
	public int talkStop2(int requestProjectSubNo) {
		int result = dao.talkStop2(requestProjectSubNo);
		return result;
	}
	@Transactional
	public int insetReviewOne(GosuReview gr) {
		int result = dao.insetReviewOne(gr);
		return result;
	}

	public GosuReview selectGosuReviewOne(GosuReview gr) {
		GosuReview gosuReviewOne = dao.selectGosuReviewOne(gr);	
		return gosuReviewOne;
	}

	public ArrayList<GosuReview> selectGosuReviewList(int ggsouNo) {
		ArrayList<GosuReview> list = dao.selectGosuReviewList(ggsouNo);
		return list;
	}

	public GosuReview selectReviewCountAVG(int ggsouNo) {
		GosuReview gosuReviewOne = new GosuReview();
		
		gosuReviewOne.setReviewCount(dao.selectReviewCount(ggsouNo));	
		gosuReviewOne.setReviewAvg(dao.selectReviewAvg(ggsouNo));
		return gosuReviewOne;
	}
	@Transactional
	public int insertRequestReviewAjax(GosuRequestReview grr) {
		int result = dao.insertRequestReviewAjax(grr);
		return result;
	}

	public GosuRequestReview selectGosuRequestReviewOne(GosuRequestReview grr2) {
		GosuRequestReview gosuReviewOne = dao.GosuRequestReview(grr2);	
		return gosuReviewOne;
	}
	@Transactional
	public int gosuNoticeUpdate(GosuNotice gNotice) {
		int result = dao.gosuNoticeUpdate(gNotice);
		return result;
	}
	@Transactional
	public int noticeContentdelete(int gnn) {
		int result = dao.noticeContentdelete(gnn);
		return result;
	}

	public ArrayList<GosuRequestReview> selectGosuRequestReviewList(int ggsouNo) {
		ArrayList<GosuRequestReview> list = dao.selectGosuRequestReviewList(ggsouNo);
		return list;
	}

	public int selectGrrCount(int ggsouNo) {
		int selectGrrCount = dao.selectGrrCount(ggsouNo);
		return selectGrrCount;
	}

	public ArrayList<GosuReview> selectMemberReviewList(String memberId) {
		ArrayList<GosuReview> list = dao.selectMemberReviewList(memberId);
		return list;
	}

	public ArrayList<GosuRequestReview> selectMemberRequestReviewList(String memberId) {
		ArrayList<GosuRequestReview> list = dao.selectMemberRequestReviewList(memberId);
		return list;
	}

	public GosuListPageData selectGosuList(int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Gosu> list = dao.selectGosuList(map);
		for (Gosu g : list) {
			int gosuNo = g.getGsouNo();

			g.setGosuId(dao.selectGosuId(gosuNo));
			g.setGosuImg(dao.selectGosuImg(gosuNo));

			ArrayList<GosuReview> list2 = dao.selectGosuReviewList(g.getGgsouNo());
			if(!list2.isEmpty()) {
				g.setReviewAvg(dao.selectReviewAvg(g.getGgsouNo()));
				g.setReviewCount(dao.selectReviewCount(g.getGgsouNo()));
			}
		}
		int totalCount = dao.selectGosuListTotalCount();
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
			pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";

		ArrayList<Gosu> list2 = dao.selectGosuListAll();
		GosuListPageData glpd = new GosuListPageData(list, pageNavi, start,list2);
		return glpd;
	}


	public ArrayList<Gosu> selectGosuList() {

		ArrayList<Gosu> list = dao.selectGosuList();
		for (Gosu g : list) {
			g.setGosuImg(dao.selectGosuImg(g.getGsouNo()));

			ArrayList<GosuReview> list2 = dao.selectGosuReviewList(g.getGgsouNo());
			if(!list2.isEmpty()) {
				g.setReviewAvg(dao.selectReviewAvg(g.getGgsouNo()));
				g.setReviewCount(dao.selectReviewCount(g.getGgsouNo()));
				
			}
		}
		return list;
	}


	public GosuNoticeListPageData selectGosuNoticeList(int reqPage) {
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList(map);
		
		int totalCount = dao.selectGosuNoticeListTotalCount();
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
			pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		GosuNoticeListPageData glpd = new GosuNoticeListPageData(list, pageNavi, start);
		return glpd;
	}


	public GosuRequestListPageData selectMemberRequestList(int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<GosuRequest> list = dao.selectMemberRequestList(map);
		for (GosuRequest g : list) {
			g.setRequestWriterImg(dao.selectGosuImg(g.getRequestWriterNo()));
			g.setRequestWriterId(dao.selectGosuId(g.getRequestWriterNo()));
		}
		int totalCount = dao.selectRequestCount();
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		GosuRequestListPageData glpd = new GosuRequestListPageData(list, pageNavi, start);
		return glpd;
	}


	public GosuRequestCostListPageData selectGosuRequestCostList(int reqPage, String memberId) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId",memberId);
		ArrayList<GosuRequestCost> list = dao.selectGosuRequestCostList(map);
		for (GosuRequestCost g : list) {
			g.setGosuImg(dao.selectGosuImg(g.getGosuNo()));
			g.setGosuId(dao.selectGosuId(g.getGosuNo()));
		}
		int totalCount = dao.selectRequestCostCount(memberId);
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestCostList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestCostList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestCostList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestCostList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		GosuRequestCostListPageData glpd = new GosuRequestCostListPageData(list, pageNavi, start);
		return glpd;
	}


	public GosuListPageData selectGosuList2(int reqPage, String keyword, String type) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword",keyword);
		map.put("type",type);
		ArrayList<Gosu> list = dao.selectGosuListKeyword(map);
		for (Gosu g : list) {
			int gosuNo = g.getGsouNo();

			g.setGosuId(dao.selectGosuId(gosuNo));
			g.setGosuImg(dao.selectGosuImg(gosuNo));

			ArrayList<GosuReview> list2 = dao.selectGosuReviewList(g.getGgsouNo());
			if(!list2.isEmpty()) {
				g.setReviewAvg(dao.selectReviewAvg(g.getGgsouNo()));
				
			}
		}
		int totalCount = dao.selectGosuListTotalCountKeyword(map);
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
			pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		ArrayList<Gosu> list2 = dao.selectGosuListAll();
		GosuListPageData glpd = new GosuListPageData(list, pageNavi, start,list2);
		return glpd;
	}


	public GosuNoticeListPageData selectGosuNoticeList2(int reqPage, String keyword, String type) {
		int numPerPage = 18;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword",keyword);
		map.put("type",type);
		ArrayList<GosuNotice> list = dao.selectGosuNoticeListKeyword(map);
		
		int totalCount = dao.selectGosuNoticeListTotalCountKeyword(map);
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
			pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuNoticeList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		GosuNoticeListPageData glpd = new GosuNoticeListPageData(list, pageNavi, start);
		return glpd;
	}

	@Transactional
	public int insertGosuNoticeComment(Comment cmt) {
		int result = dao.insertGosuNoticeComment(cmt);
		return result;
	}


	public ArrayList<Comment> selectGosuNoticeCommentList(int gnn) {
		ArrayList<Comment> list = dao.selectGosuNoticeCommentList(gnn);
		return list;
	}

	@Transactional
	public int insertGosuNoticeCommentRe(Comment cmt) {
		int result = dao.insertGosuNoticeCommentRe(cmt);
		return result;
	}

	@Transactional
	public int gNoticeCommentUpdateAjax(Comment cmt) {
		int result = dao.gNoticeCommentUpdateAjax(cmt);
		return result;
	}


	@Transactional
	public int gNoticeCommentDeleteAjax(int commentNo) {
		int result = dao.gNoticeCommentDeleteAjax(commentNo);
		return result;
	}


	public GosuRequestListPageData selectMemberRequestListGosuNoIN(int reqPage, int gosuNo,String type) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("gosuNo",gosuNo);
		System.out.println("type : "+type);
		map.put("type",type);
		ArrayList<GosuRequest> list = dao.selectMemberRequestListGosuNoIN(map);
		for (GosuRequest g : list) {
			g.setRequestWriterImg(dao.selectGosuImg(g.getRequestWriterNo()));
			g.setRequestWriterId(dao.selectGosuId(g.getRequestWriterNo()));
		}
		int totalCount = dao.selectRequestCountGosuNoIN(map);
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestListGosuNo.do?reqPage="+(pageNo-1)+"&gosuNo="+gosuNo+"&type="+type+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestListGosuNo.do?reqPage="+pageNo+"&gosuNo="+gosuNo+"&type="+type+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/gosuRequestListGosuNo.do?reqPage="+pageNo+"&gosuNo="+gosuNo+"&type="+type+"'>";
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
			pageNavi += "<a class = 'page-link' href='/gosuRequestListGosuNo.do?reqPage="+pageNo+"&gosuNo="+gosuNo+"&type="+type+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		GosuRequestListPageData glpd = new GosuRequestListPageData(list, pageNavi, start);
		return glpd;
	}


	public GosuRequest gosuMemberRequestAjax(GosuRequestCost grc) {
		GosuRequest gosuRequest = dao.gosuMemberRequestAjax(grc);	
		return gosuRequest;
	}


	public int selectGosuRequestCostListCount(String memberId) {
		int costCount= dao.selectGosuRequestCostListCount(memberId);
		return costCount;
	}


	public int selectGosuRequestListCount(int memberNo) {
		int costCount= dao.selectGosuRequestListCount(memberNo);
		return costCount;
	}


	@Transactional
	public int insertGNComment(Comment cm) {
		return dao.insertGNComment(cm);
	}


	@Transactional
	public int reportContestComment(Report rp) {
		return dao.reportContestComment(rp);
	}


	public ArrayList<GosuNotice> selectGosuNoticeListSelf(String gosuId) {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeListSelf(gosuId);
		return list;
	}


	public int selectMyGgosuNo(int memberNo) {
		int ggosuNo= dao.selectMyGgosuNo(memberNo);
		return ggosuNo;
	}


	public ArrayList<GosuRequestReview> selectGosuRequestReviewList2(int memberNo) {
		ArrayList<GosuRequestReview> list = dao.selectGosuRequestReviewList2(memberNo);
		return list;
	}


	public int selectGrrCount2(int memberNo) {
		int grrCount= dao.selectGrrCount2(memberNo);
		return grrCount;
	}



}
