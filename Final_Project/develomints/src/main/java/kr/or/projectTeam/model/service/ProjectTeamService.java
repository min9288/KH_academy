package kr.or.projectTeam.model.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Report;
import kr.or.projectTeam.model.dao.ProjectTeamDao;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectReview;
import kr.or.projectTeam.model.vo.ProjectTask;
import kr.or.projectTeam.model.vo.ProjectTaskViewData;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamApplicantViewData;
import kr.or.projectTeam.model.vo.ProjectTeamApplyPageData;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.projectTeam.model.vo.ProjectTeamMember;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeViewData;
import kr.or.projectTeam.model.vo.Shortcuts;
import kr.or.projectTeam.model.vo.TaskShortcuts;
import kr.or.projectTeam.model.vo.UseDevelopLanguage;
import kr.or.projectTeam.model.vo.projectDevLanguage;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Service
public class ProjectTeamService {
	@Autowired
	private ProjectTeamDao dao;

	public projectTeamMainPageData selectAllrecruitProject(int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<ProjectTeam> list = dao.selectAllprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
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
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ArrayList<String> langList = null; 
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	public projectTeamMainPageData selectAllrecruitSelectProject(int reqPage, int viewValue, int checkValue) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("checkValue", checkValue);
		ArrayList<ProjectTeam> list = dao.selectAllCheckprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
		int totalCount = dao.selectCheckTotalCount(map);
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
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
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
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ArrayList<String> langList = null; 
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	public projectTeamMainPageData selectAllrecruitSelectProject(int reqPage, int viewValue, int checkValue,
			ArrayList<String> langList) {
		
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("checkValue", checkValue);
		map.put("langList", langList);
		ArrayList<ProjectTeam> list = dao.selectAllCheckprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
		int totalCount = dao.selectCheckTotalCount(map);
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
			String pdNaviUrl1 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
			for(int i = 0; i < langList.size(); i++) {
				String addData = "&langValue="+langList.get(i);
				pdNaviUrl1 += addData;
			}
			pdNaviUrl1 += "'>";
			
			pageNavi += "<li class='page-item'>";
			pageNavi += pdNaviUrl1;
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				String pdNaviUrl2 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
				for(int j = 0; j < langList.size(); j++) {
					String addData = "&langValue="+langList.get(j);
					pdNaviUrl2 += addData;
				}
				pdNaviUrl2 += "'>";
				
				pageNavi += "<li class='page-item active'>";
				pageNavi += pdNaviUrl2;
				pageNavi += pageNo + "</a></li>";
			} else {
				String pdNaviUrl3 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
				for(int j = 0; j < langList.size(); j++) {
					String addData = "&langValue="+langList.get(j);
					pdNaviUrl3 += addData;
				}
				pdNaviUrl3 += "'>";
				
				pageNavi += "<li class='page-item'>";
				pageNavi += pdNaviUrl3;
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			String pdNaviUrl4 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
			for(int i = 0; i < langList.size(); i++) {
				String addData = "&langValue="+langList.get(i);
				pdNaviUrl4 += addData;
			}
			pdNaviUrl4 += "'>";
			
			pageNavi += "<li class='page-item'>";
			pageNavi += pdNaviUrl4;
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	
	@Transactional
	public int writeRecruitTeam(ProjectTeam pt, int memberNo, ArrayList<String> langList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("pt", pt);
		map.put("langList", langList);
		int result = dao.writeRecruitTeam(map);
		return result;
	}

	public ArrayList<DevelopLanguage> selectAllDevelopLang() {
			ArrayList<DevelopLanguage> dlList = dao.selectAllDevelopLangList();
		return dlList;
	}

	public ProjectTeamNoticeViewData selectOneNotice(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.updateReadCount(projectNo);
		if(result <= 0) {
			return null;
		}
		ProjectTeam pt = dao.selectOneNotice(map);
		ArrayList<ProjectTeamNoticeComment> list = dao.selectCommentList(projectNo);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ProjectTeamNoticeViewData ptnvd = new ProjectTeamNoticeViewData(list, pt, pdLangList);
		return ptnvd;
		
	}
	
	@Transactional
	public int updateRecruitTeam(ProjectTeam pt, int memberNo, ArrayList<String> langList, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		map.put("pt", pt);
		map.put("langList", langList);
		int result = dao.updateRecruitTeam(map);
		return result;
	}
	
	@Transactional
	public int deleteOneNotice(int projectNo) {
		int result = dao.deleteOneNotice(projectNo);
		return result;
	}
	
	@Transactional
	public int updateStatus() {
		int result = dao.updateStatus();
		return result;
	}
	
	@Transactional
	public int insertComment(String commentContent, int boardNo, String memberId, int boardType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		map.put("boardType", boardType);
		int result = dao.insertComment(map);
		return result;
	}
	
	@Transactional
	public int deleteComment(int commentNo) {
		int result = dao.deleteComment(commentNo);
		return result;
	}
	
	@Transactional
	public int updateComment(int commentNo, String commentContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("commentNo", commentNo);
		int result = dao.updateComment(map);
		return result;
	}
	
	@Transactional
	public int reCommentInsert(String commentContent, int boardNo, String memberId, int commentNo, int boardType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		map.put("commentNo", commentNo);
		map.put("boardType", boardType);
		int result = dao.reCommentInsert(map);
		return result;
	}
	
	@Transactional
	public int insertDibCount(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = dao.insertDibCount(map);
		return result;
	}
	
	@Transactional
	public int deleteDibCount(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = dao.deleteDibCount(map);
		return result;
	}
	
	@Transactional
	public int insertApplyProject(ProjectEntry pta, ArrayList<String> langList, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pta", pta);
		map.put("langList", langList);
		map.put("projectNo", projectNo);
		int result = dao.insertApplyProject(map);
		return result;
	}

	public ProjectTeamApplyPageData selectAllManageEntry(int reqPage, int viewValue, int projectNo) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("projectNo", projectNo);
		ArrayList<ProjectEntry> entryList = dao.selectAllManageEntry(map);
		ArrayList<UseDevelopLanguage> udLangList = dao.selectAllUseDevelopLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		int entryNo = entryList.get(0).getEntryNo();
		
		int totalCount = dao.selectentryTotalCount(entryNo);
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
			pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
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
			pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTeamApplyPageData ptapd = new ProjectTeamApplyPageData(entryList, pageNavi, start, developLangList, udLangList);
		return ptapd;
	}

	public int selectMember(int entryNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entryNo", entryNo);
		map.put("memberNo", memberNo);
		int result = dao.selectMember(map);
		return result;
	}
	@Transactional
	public int closeRecruitTeam(int projectNo, int memberNo) {
		ArrayList<Integer> finalList = dao.selectFinalMember(projectNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("finalList", finalList);
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = 0;
		int updateResult1 = dao.updateFinalRecruitTeam(map);
		if (updateResult1 > 0) {
			int updateResult2 = dao.updateFinalRecruitTeam2(map);
			if (updateResult2 > 0) {
				int writerInsertResult = dao.insertFinalTeamWriter(map);
				if (writerInsertResult > 0) {
					result = dao.closeRecruitTeam(map);
				}
			}
		}
		return result;
	}
	
	@Transactional
	public int deleteTeamMember(int entryNo) {
		int result = dao.deleteTeamMember(entryNo);
		return result;
	}
	
	public ProjectTeamApplyPageData manageFinalEntryFrm(int projectNo, int viewValue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("viewValue", viewValue);
		map.put("projectNo", projectNo);
		ArrayList<ProjectEntry> entryList = dao.manageFinalEntryFrm(map);
		ArrayList<UseDevelopLanguage> udLangList = dao.selectAllUseDevelopLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		int entryNo = entryList.get(0).getEntryNo();
		String pageNavi= null;
		int start = 0;
		ProjectTeamApplyPageData ptapd = new ProjectTeamApplyPageData(entryList, pageNavi, start, developLangList, udLangList);
		return ptapd;
	}
	
	@Transactional
	public int projectStartProcess() {
		
		int result = 0;
		int updateEntryResult = 0;
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		ArrayList<Integer> startProjectList = dao.selectStartProjectList(today);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startProjectList", startProjectList);
		ArrayList<Integer> startProjectMemberList = dao.startProjectMemberList(map);
		if(startProjectMemberList.size() != 0) {
			map.put("startProjectMemberList", startProjectMemberList);
			updateEntryResult = dao.updateEntryResult(map);
			ArrayList<ProjectEntry> startProjectListFinalList = dao.startProjectListFinal(map);
			if(updateEntryResult > 0) {
				result = dao.insertTeamMember(startProjectListFinalList);
				for(int i = 0; i < startProjectList.size(); i++) {
					int deleteZeroTeam = dao.deleteZeroTeam(startProjectList.get(i));
				}
			}
		} 
		return result;
	}

	@Transactional
	public int insertFinalTeamMember(int entryNo, int projectNo, int memberNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entryNo", entryNo);
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = 0;
		int updateResult = dao.updateFinalTeamMember(entryNo);
		if(updateResult > 0) {
			result = dao.insertFinalTeamMember2(map);
		}
		return result;
	}
	
	
	@Transactional
	public int returnTeamMember(int entryNo) {
		int result = dao.returnTeamMember(entryNo);
		return result;
	}

	public ProjectTeamApplicantViewData selectOneApplicant(int entryNo) {
		ProjectEntry pe = dao.selectOneApplicant(entryNo);
		ArrayList<ProjectTeamNoticeComment> commentList = dao.selectApplyCommentList(entryNo);
		ArrayList<UseDevelopLanguage> udlList = dao.selectAllUseDevelopLangList();
		ProjectTeamApplicantViewData ptavd = new ProjectTeamApplicantViewData(commentList, pe, udlList);
		return ptavd;
	}

	public int searchEntryNo(int boardNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		int entryNo = dao.searchEntryNo(map);
		return entryNo;
	}

	@Transactional
	public int cancelApplyProject(int entryNo, int applicantNo, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entryNo", entryNo);
		map.put("applicantNo", applicantNo);
		map.put("projectNo", projectNo);
		int result = 0;
		int result1 = dao.cancelApplyProject(map);
		if(result1 >0) {
			result = dao.deleteUseLang(map);
		}
		return result;
	}
	
	@Transactional
	public int updateApplyForm(ProjectEntry pe, ArrayList<String> langList, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("pe", pe);
		map.put("langList", langList);
		int result = 0;
		int tempResult = dao.updateApplyData(map);
		if (tempResult > 0) {
			int tempResult2 = dao.deleteApplyLangList(map);
			if (tempResult2 > 0) {
				int insertLangValue = 2;
				map.put("insertLangValue", insertLangValue);
				result = dao.insertApplyLangList(map);
			}
		}
		return result;
	}

	@Transactional
	public int insertComment(String commentContent, int boardNo, String memberId, int boardType, int entryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("projectNo", boardNo);
		map.put("memberId", memberId);
		map.put("boardType", boardType);
		map.put("entryNo", entryNo);
		int result = dao.insertApplyComment(map);
		return result;
	}

	public int applyCheckValue(int projectNo, Integer memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.applyCheckValue(map);
		return result;
	}

	public int searchEntryNo2(int projectNo, Integer memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.searchEntryNo2(map);
		return result;
	}

	public ProjectTeam projectInfo(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		ProjectTeam pt = dao.projectInfo(map);
		return pt;
	}

	public ArrayList<ProjectTeamMember> memberInfoList(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		ArrayList<ProjectTeamMember> list = dao.memberInfoList(map);
		return list;
	}

	public ProjectTask recentTask(int projectNo) {
		ProjectTask ptk = dao.recentTask(projectNo);
		return ptk;
	}

	public ProjectTask toDoTask(int projectNo) {
		ProjectTask ptk = dao.toDoTask(projectNo);
		return ptk;
	}

	public ArrayList<projectDevLanguage> selectAllprojectLangList() {
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		return pdLangList;
	}
	
	@Transactional
	public int addShortcut(String shortcutAddr, String shortcutName, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shortcutAddr", shortcutAddr);
		map.put("shortcutName", shortcutName);
		map.put("projectNo", projectNo);
		int result = dao.addShortcut(map);
		return result;
	}

	public ArrayList<Shortcuts> shortcutList(int projectNo) {
		ArrayList<Shortcuts> shortcutList = dao.shortcutList(projectNo);
		return shortcutList;
	}

	@Transactional
	public int deleteShortcut(int shortcutNo) {
		int result = dao.deleteShortcut(shortcutNo);
		return result;
	}
	
	@Transactional
	public int endProject(ArrayList<ProjectReview> reviewlist, int backProjectNo, int backMemberNo) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewlist", reviewlist);
		map.put("backProjectNo", backProjectNo);
		map.put("backMemberNo", backMemberNo);
		int reviewResult = dao.insertReview(map);
		int memberPointResult = 0;
		if(reviewResult > 0) {
			for(int i = 0; i < reviewlist.size(); i++) {
				memberPointResult = dao.reviewMemberPointUpdate(reviewlist.get(i));
			}
			if(memberPointResult > 0) {
				result = dao.endProject(map);
			}
		}
		return result;
	}
	
	@Transactional
	public int insertReview(ArrayList<ProjectReview> reviewlist, int backProjectNo, int backMemberNo) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewlist", reviewlist);
		map.put("backProjectNo", backProjectNo);
		map.put("backMemberNo", backMemberNo);
		int reviewResult = dao.insertReview(map);
		int memberPointResult = 0;
		if(reviewResult > 0) {
			for(int i = 0; i < reviewlist.size(); i++) {
				result = dao.reviewMemberPointUpdate(reviewlist.get(i));
			}
		}
		return result;
	}
	
	@Transactional
	public int updateProjectOutline(ArrayList<String> langList, ProjectTeam pt, String crueRoll, int sessionMemberNo,
			int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("langList", langList);
		map.put("pt", pt);
		map.put("crueRoll", crueRoll);
		map.put("sessionMemberNo", sessionMemberNo);
		map.put("projectNo", projectNo);
		
		int result1 = 1;
		int result2 = 1;
		int result3 = 1;
		int result = 0;
		
		if(langList.size() != 0) {
			int tempResult = dao.updateProjectLangList1(map);
			if (tempResult > 0) {
				result1 = dao.updateProjectLangList2(map);
			}
		}
		if(pt != null) {
			result2 = dao.projectUpdate(map);
		}
		if(crueRoll != null && crueRoll != "") {
			result3 = dao.crueRollUpdate(map);
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			result = 1;
		}
		
		return result;
	}

	public ArrayList<ProjectTask> projectTaskList(int projectNo) {
		ArrayList<ProjectTask> list = dao.projectTaskList(projectNo);
		return list;
	}

	public ProjectTaskViewData enterProjectTaskM(int projectNo, int reqPage ) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("projectNo", projectNo);
		ArrayList<ProjectTask> tasklist = dao.selectAllTaskMList(projectNo);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectTaskMTotalCount(projectNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}
	
	@Transactional
	public int addIssue(int projectNo, int memberNo, int taskType, String issueTitle, String taskStartDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		map.put("taskType", taskType);
		map.put("issueTitle", issueTitle);
		map.put("taskStartDate", taskStartDate);
		int result = dao.addIssue(map);
		return result;
	}
	
	@Transactional
	public int addIssueToday(int projectNo, int memberNo, int taskType, String issueTitle, String taskStartDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		map.put("taskType", taskType);
		map.put("issueTitle", issueTitle);
		map.put("taskStartDate", taskStartDate);
		int result = dao.addIssueToday(map);
		return result;
	}
	
	public projectTeamMainPageData mainProjectTeamPageData() {
		
		// 무시
		int numPerPage = 0;
		int end = 0;
		int start = 0;
		String pageNavi = null;
		ArrayList<String> langList = null; 
		ArrayList<DevelopLanguage> developLangList = null;
		// 무시
		
		ArrayList<ProjectTeam> list = dao.selectMainProjectList();
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		
		// 컨트롤러 아래 요렇게만 가져가서 하구, 변수명은 사용하기 편한걸로 바꿔서 사용해도됭 (모집중&최신순 8개만 나오는 리스트 (개수는 수정 가능))
//		projectTeamMainPageData ptmpd = service.mainProjectTeamPageData();
//		model.addAttribute("list", ptmpd.getList());
//		model.addAttribute("pdLangList", ptmpd.getPdLangList());
		
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	public ArrayList<TaskShortcuts> taskShortcutList(int projectNo) {
		ArrayList<TaskShortcuts> list= dao.taskShortcutList(projectNo);
		return list;
	}
	
	@Transactional
	public int updateIssue(String taskNo, int projectNo, int taskType, String modalcontent, String selectCharUser,
			int selectPriority, int selectProcessSort) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("taskNo", taskNo);
		map.put("taskType", taskType);
		map.put("modalcontent", modalcontent);
		map.put("selectCharUser", selectCharUser);
		map.put("selectPriority", selectPriority);
		map.put("selectProcessSort", selectProcessSort);
		if(selectProcessSort == 3) {
			result = dao.updateCompleteIssue(map);
		} else {
			result = dao.updateIssue(map);
		}
		return result;
	}

	public int taskDateUpdate(ProjectTask projectTask) {
		int result = dao.taskDateUpdate(projectTask);
		return result;
	}

	public int connectIssue(String taskNo, String connectIssue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("connectIssue", connectIssue);
		int result = dao.connectIssue(map);
		return result;
	}

	public int deleteConnectIssue(String taskNo) {
		int result = dao.deleteConnectIssue(taskNo);
		return result;
	}

	public int connectLink(String taskNo, String shortcutName, String shortcutAddr, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("shortcutName", shortcutName);
		map.put("shortcutAddr", shortcutAddr);
		map.put("projectNo", projectNo);
		int result = dao.connectLink(map);
		return result;
	}

	public int deleteConnectLink(int taskShortcutNo) {
		int result = dao.deleteConnectLink(taskShortcutNo);
		return result;
	}

	public int deleteTask(String taskNo) {
		int result = dao.deleteTask(taskNo);
		return result;
	}

	public ProjectTaskViewData enterProjectTaskSelectM(int projectNo, int reqPage, int viewValue, int checkValue, int teamMemberNo) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("checkValue", checkValue);
		map.put("projectNo", projectNo);
		map.put("teamMemberNo", teamMemberNo);
		ArrayList<ProjectTask> tasklist = dao.selectAllTaskMSelectList(map);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectCheckTotalSelectCount(map);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterTaskMSelect.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskMSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskMSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterTaskMSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskT(int projectNo, int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("projectNo", projectNo);
		ArrayList<ProjectTask> tasklist = dao.enterProjectTaskT(projectNo);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectTaskTTotalCount(projectNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskSelectT(int projectNo, int reqPage, int viewValue, int checkValue,
			int teamMemberNo) {
		
			int numPerPage = 10;
			int end = reqPage * numPerPage;
			int start = end - numPerPage + 1;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("viewValue", viewValue);
			map.put("checkValue", checkValue);
			map.put("projectNo", projectNo);
			map.put("teamMemberNo", teamMemberNo);
			ArrayList<ProjectTask> tasklist = dao.selectAllTaskTSelectList(map);
			ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
			
			int totalCount = dao.selectCheckTotalCountT(map);
			int totalPage = 0;
			if(totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
			String pageNavi = "<ul class='pagination'>";
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskTSelect.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += "&lt;</a></li>";
			}// 페이지 숫자
			for(int i=0; i < pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li class='page-item active'>";
					pageNavi += "<a class = 'page-link' href='/enterTaskTSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
					pageNavi += pageNo + "</a></li>";
				} else {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class = 'page-link' href='/enterTaskTSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
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
				pageNavi += "<a class = 'page-link' href='/enterTaskTSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += "&gt;</a></li>";
			}
			pageNavi += "</ul>";
			
			ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
			return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskB(int projectNo, int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("projectNo", projectNo);
		ArrayList<ProjectTask> tasklist = dao.enterProjectTaskB(projectNo);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectTaskBTotalCount(projectNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskSelectB(int projectNo, int reqPage, int viewValue, int checkValue,
			int teamMemberNo) {
		
			int numPerPage = 10;
			int end = reqPage * numPerPage;
			int start = end - numPerPage + 1;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("viewValue", viewValue);
			map.put("checkValue", checkValue);
			map.put("projectNo", projectNo);
			map.put("teamMemberNo", teamMemberNo);
			ArrayList<ProjectTask> tasklist = dao.selectAllTaskBSelectList(map);
			ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
			
			int totalCount = dao.selectCheckTotalCountB(map);
			int totalPage = 0;
			if(totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
			String pageNavi = "<ul class='pagination'>";
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskBSelect.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += "&lt;</a></li>";
			}// 페이지 숫자
			for(int i=0; i < pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li class='page-item active'>";
					pageNavi += "<a class = 'page-link' href='/enterTaskBSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
					pageNavi += pageNo + "</a></li>";
				} else {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class = 'page-link' href='/enterTaskBSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
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
				pageNavi += "<a class = 'page-link' href='/enterTaskBSelect.do?reqPage="+(pageNo)+"&viewValue="+viewValue+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += "&gt;</a></li>";
			}
			pageNavi += "</ul>";
			
			ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
			return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskH(int projectNo, int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("projectNo", projectNo);
		ArrayList<ProjectTask> tasklist = dao.enterProjectTaskH(projectNo);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectTaskHTotalCount(projectNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}

	public ProjectTaskViewData enterProjectTaskSelectH(int projectNo, int reqPage, int checkValue, int teamMemberNo) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("checkValue", checkValue);
		map.put("projectNo", projectNo);
		map.put("teamMemberNo", teamMemberNo);
		ArrayList<ProjectTask> tasklist = dao.selectAllTaskHList(map);
		ArrayList<ProjectTeamMember> ptmList = dao.selectTeamMember(projectNo);
		
		int totalCount = dao.selectCheckTotalCountH(map);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/enterTaskHSelect.do?reqPage="+(pageNo-1)+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskHSelect.do?reqPage="+(pageNo)+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/enterTaskHSelect.do?reqPage="+(pageNo)+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/enterTaskHSelect.do?reqPage="+(pageNo)+"&checkValue="+checkValue+"&projectNo="+projectNo+"&teamMemberNo="+teamMemberNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTaskViewData ptvd = new ProjectTaskViewData(tasklist, pageNavi, start, ptmList);
		return ptvd;
	}

	public int reportProjectNoticeComment(Report rp) {
		return dao.reportProjectNoticeComment(rp);
	}

	public int reCommentInsert(String commentContent, int boardNo, String memberId, int commentNo, int boardType,
			int entryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("boardNo", entryNo);
		map.put("memberId", memberId);
		map.put("commentNo", commentNo);
		map.put("boardType", boardType);
		int result = dao.reCommentInsert(map);
		return result;
	}

}
