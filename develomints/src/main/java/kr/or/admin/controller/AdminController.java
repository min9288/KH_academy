package kr.or.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.admin.service.AdminService;
import kr.or.admin.vo.TotalBoard;
import kr.or.admin.vo.TotalData;
import kr.or.admin.vo.TotalMember;
import kr.or.comment.vo.Report;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;
import kr.or.contest.vo.ContestMemberList;

@Controller
public class AdminController {

	@Autowired
	private AdminService service; 
	
	
	//관리자 페이지로 이동
		@RequestMapping(value="/adminPage.do")
		public String adminPage(Model model) {
			LocalDate today = LocalDate.now();
			model.addAttribute("today",today);
			return "admin/adminPage";
		}
		
		//대시보드로 이동
		@RequestMapping(value="/dashboard.do")
		public String dashboard(Model model) {
			//오늘 날짜 전송
			LocalDate today = LocalDate.now();
			model.addAttribute("today",today);
			//오늘 날짜 String으로 변환
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String sToday = today.format(formatter);
			//통계자료
			TotalData td = service.totaldata(sToday);
			
			model.addAttribute("todayTotalMember",td.getTodayTotalMember());
			model.addAttribute("todayJoinMember",td.getTodayJoinMember());
			model.addAttribute("todayOutMember",td.getTodayOutMember());
			model.addAttribute("todayTotalContent",td.getTodayTotalContent());
			model.addAttribute("dateList",td.getDateList());
			model.addAttribute("joinList",td.getJoinList());
			model.addAttribute("outList",td.getOutList());
			model.addAttribute("gradeList",td.getGradeList());
			model.addAttribute("cateList",td.getCateList());
			model.addAttribute("yesterDayTotalMember", td.getYesterDayTotalMember());
			model.addAttribute("yesterDayTotalBoard", td.getYesterDayTotalBoard());
			model.addAttribute("noticeList", td.getNoticeList());
			model.addAttribute("qnaList", td.getQnaList());
			model.addAttribute("nonQnaList", td.getNonQnaList());
			return "admin/dashboard";
		}
		
		//전체회원리스트 목록으로 이동
		@RequestMapping(value="/allMemberList.do")
		public String allMemberList(Model model, int reqPage, int type, int list, String id) {
			TotalMember tm = service.totalMember(reqPage,type,list,id);
			model.addAttribute("memberList", tm.getAllMemberList());
			model.addAttribute("start",tm.getStart());
			model.addAttribute("pageNavi",tm.getPageNavi());
			model.addAttribute("totalCount",tm.getTotalCountList());
			model.addAttribute("type",type);
			model.addAttribute("list",list);
			return "admin/allMemberList";
		}
		
		//신고회원목록으로 이동
		@RequestMapping(value="/reportMember.do")
		public String reportMember(Model model, int reqPage) {
			TotalMember tm = service.totalReposrtList(reqPage);
			model.addAttribute("reportList", tm.getAllReportList());
			model.addAttribute("start",tm.getStart());
			model.addAttribute("pageNavi",tm.getPageNavi());
			model.addAttribute("totalCount", tm.getTotalCount());
			model.addAttribute("report5List", tm.getReport5List());
			return "admin/reportMember";
		}
		
		//차단회원목록으로 이동
		@RequestMapping(value="/blockedMember.do")
		public String blockedMember(Model model, int reqPage, String id) {
			TotalMember tm = service.totalBlockedMemberList(reqPage,id);
			model.addAttribute("pageNavi", tm.getPageNavi());
			model.addAttribute("allblockedList", tm.getAllblockedList());
			model.addAttribute("totalCount",tm.getTotalCount());
			model.addAttribute("lastReport",tm.getLastReport());
			return "admin/blockedMember";
		}
		
		//선택회원 등급 변경
		@RequestMapping(value="/chkChangeLevel.do")
		public String chkChangeLevel(Model model, String memberId, String level) {
			boolean result = service.chkChangeLevel(memberId, level);
			if(result) {
				model.addAttribute("msg","변경성공");
			}else {
				model.addAttribute("msg","변경실패");
			}
			model.addAttribute("loc","/allMemberList.do?reqPage=1&type=0&list=1");
			return "common/msg";
		}
		
		//선택회원 신고 횟수
		@ResponseBody
		@RequestMapping(value="/memberReportCount.do")
		public int memberReportCount(String id) {
			int memberReportCount = service.memberReportCount(id);
			return memberReportCount;
		}
		
		//신고 반려 처리
		@RequestMapping(value="/cancleReport.do")
		public String canselReport(Model model, int reportNo) {
			int result = service.canselReport(reportNo);
			if(result>0) {
				model.addAttribute("msg","신고 반려되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패하였습니다.");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "common/msg";
		}

		//신고 처리
		@RequestMapping(value="/reportInsert.do")
		public String reportInsert(Model model, int reportNo, String memberId) {
			int result = service.reportInsert(reportNo, memberId);
			if(result>0) {
				model.addAttribute("msg","신고 처리되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패하였습니다.");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "common/msg";
		}
		
		//허위 신고 처리
		@RequestMapping(value="/falseReport.do")
		public String falseReport(Model model, int reportNo, String memberId) {
			int result = service.falseReport(reportNo, memberId);
			if(result>0) {
				model.addAttribute("msg","허위신고로 처리되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패하였습니다.");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "common/msg";
		}
		
		//선택회원 신고 리스트
		@ResponseBody
		@RequestMapping(value="/memberReportView.do")
		public ArrayList<Report> memberReportView(String id) {
			ArrayList<Report> memberReportView = service.memberReportView(id);
			return memberReportView;
		}
		
		//선택회원 차단 해제
		@RequestMapping(value="/cancelBlocked.do")
		public String cancelBlocked(String memberId, Model model) {
			boolean result = service.cancelBlocked(memberId);
			if(result) {
				model.addAttribute("msg","차단 해제 되었습니다.");
			}else {
				model.addAttribute("msg","차단 해제 실패");
			}
			model.addAttribute("loc","/blockedMember.do?reqPage=1");
			return "common/msg";
		}
		
		//공모전 등록 내역으로 가기
		@RequestMapping(value="/contestEnrollList.do")
		public String contestEnrollList(Model model, int reqPage) {
			ContestList cl = service.contestEnrollList(reqPage);
			model.addAttribute("list",cl.getContestList());
			model.addAttribute("totalCount",cl.getTotalCount());
			model.addAttribute("pageNavi",cl.getPageNavi());
			return "admin/contestEnrollList";
		}
		
		//공모전 등록내용 상세보기
		@RequestMapping(value="/enrollContestView.do")
		public String enrollContestView(Model model, int contestNo) {
			Contest c = service.enrollContestView(contestNo);
			model.addAttribute("c",c);
			return "admin/enrollContestView";
		}
		
		//공모전 승인
		@RequestMapping(value="/contestOK.do")
		public String contestOK(int contestNo, Model model) {
			int result = service.contestOK(contestNo);
			if(result>0) {
				model.addAttribute("msg","공모 승인 되었습니다.");
			}else {
				model.addAttribute("msg","공모 승인 실패");
			}
			model.addAttribute("loc","/contestEnrollList.do?reqPage=1");
			return "common/msg";
		}
		
		
		//공모전 반려
		@RequestMapping(value="/contestNO.do")
		public String contestNO(int contestNo, Model model) {
			int result = service.contestNO(contestNo);
			if(result>0) {
				model.addAttribute("msg","공모 반려 되었습니다.");
			}else {
				model.addAttribute("msg","공모 반려 실패");
			}
			model.addAttribute("loc","/contestEnrollList.do?reqPage=1");
			return "common/msg";
		}

		//공모전 신청 회원 보기
		@RequestMapping(value="/contestEnrollMember.do")
		public String contestEnrollMember(Model model, int reqPage, String date) {
			LocalDate today = LocalDate.now();
			model.addAttribute("today",today);
			ContestList cl = service.contestEnrollMember(reqPage,date);
			model.addAttribute("list",cl.getContestList());
			model.addAttribute("pageNavi",cl.getPageNavi());
			model.addAttribute("date",date);
			model.addAttribute("totalCount",cl.getTotalCount());
			model.addAttribute("cmc",cl.getContestMemberCount());
			return "admin/contestEnrollMember";
		}
		
		//공모전 신청 회원 리스트 출력
		@ResponseBody
		@RequestMapping(value="searchContestMember")
		public ArrayList<ContestMemberList> searchContestMember(int contestNo, Model model){
			ArrayList<ContestMemberList> mList = service.searchContestMember(contestNo);
			return mList;
		}
		
		//공모전 신청회원 승인/반려
		@RequestMapping(value="/MemberEnrollContest.do")
		public String MemberEnrollContest(String memberId, int status, int contestNo, String date, String email,  Model model) {
			boolean result = service.MemberEnrollContest(memberId,status,contestNo,email);
			if(result) {
				model.addAttribute("msg","처리 완료 되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패");
			}
			model.addAttribute("loc","/contestEnrollMember.do?reqPage=1&date="+date);
			return "common/msg";
		}
		
		//회사 인증 처리 페이지로 이동
		@RequestMapping(value="/companyEnroll.do")
		public String companyEnroll(Model model, int reqPage) {
			TotalMember tm = service.companyEnroll(reqPage);
			model.addAttribute("list",tm.getCertiList());
			model.addAttribute("count",tm.getTotalCount());
			model.addAttribute("pageNavi",tm.getPageNavi());
			model.addAttribute("memlist", tm.getMemberInfoList());
			model.addAttribute("companyList",tm.getCompanyList());
			
			return "admin/companyEnroll";
		}
		
		//회사 인증
		@RequestMapping(value="/enrollMemberCompany.do")
		public String enrollMemberCompany(Model model, int companyNo, int memberNo) {
			int result = service.enrollMemberCompany(companyNo,memberNo);
			if(result>0) {
				model.addAttribute("msg","처리 완료 되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패");
			}
			model.addAttribute("loc","/companyEnroll.do?reqPage=1");
			return "common/msg";
		}
		
		//회사 인증 반려
		@RequestMapping(value="/noEnrollMemberCompany.do")
		public String noEnrollMemberCompany(Model model, int memberNo) {
			int result = service.noEnrollMemberCompany(memberNo);
			if(result>0) {
				model.addAttribute("msg","처리 완료 되었습니다.");
			}else {
				model.addAttribute("msg","처리 실패");
			}
			model.addAttribute("loc","/companyEnroll.do?reqPage=1");
			return "common/msg";
		}
		
		//전체게시판조회 페이지로 이동
		@RequestMapping(value="/allBoardList.do")
		public String allBoardList(int reqPage, int type, Model model) {
			model.addAttribute("type",type);
			TotalBoard tb = service.totalBoard(reqPage,type);
			model.addAttribute("gosuList", tb.getGosuList());
			model.addAttribute("projectList",tb.getProjectList());
			model.addAttribute("shareList",tb.getShareList());
			model.addAttribute("announceList",tb.getAnnounceList());
			model.addAttribute("contestList",tb.getContesetList());
			model.addAttribute("start", tb.getStart());
			model.addAttribute("pageNavi",tb.getPageNavi());
			model.addAttribute("totalCount", tb.getTotalCount());
			model.addAttribute("allBoardCount", tb.getAllBoardCount());
			return "admin/allBoardList";
		}
		
		//선택한 게시물 삭제
		@RequestMapping(value="/postSeleteDelete.do")
		public String postSeleteDelete(Model model, int type, int boardNo) {
			int result = service.postSeleteDelete(type, boardNo);
			if(result>0) {
				model.addAttribute("msg","삭제 완료 되었습니다.");
			}else {
				model.addAttribute("msg","삭제 실패");
			}
			model.addAttribute("loc","/allBoardList.do?reqPage=1&type="+type);
			return "common/msg";
		}
		
		
		


}
















