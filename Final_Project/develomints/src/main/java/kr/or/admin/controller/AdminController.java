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
import kr.or.admin.vo.CompanyListData;
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
				model.addAttribute("title","변경 성공");
				model.addAttribute("msg","회원 등급이 변경되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","변경 실패");
				model.addAttribute("msg","회원 등급 변경에 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/allMemberList.do?reqPage=1&type=0&list=1");
			return "member/swalMsg";
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
				model.addAttribute("title","신고 반려");
				model.addAttribute("msg","신고 반려처리 되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","반려 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "member/swalMsg";
		}

		//신고 처리
		@RequestMapping(value="/reportInsert.do")
		public String reportInsert(Model model, int reportNo, String memberId) {
			int result = service.reportInsert(reportNo, memberId);
			if(result>0) {
				model.addAttribute("title","신고 처리");
				model.addAttribute("msg","신고 처리 되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","신고 처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "member/swalMsg";
		}
		
		//허위 신고 처리
		@RequestMapping(value="/falseReport.do")
		public String falseReport(Model model, int reportNo, String memberId) {
			int result = service.falseReport(reportNo, memberId);
			if(result>0) {
				model.addAttribute("title","허위 신고 처리");
				model.addAttribute("msg","허위 신고로 처리 되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/reportMember.do?reqPage=1");
			return "member/swalMsg";
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
				model.addAttribute("title","차단 해제");
				model.addAttribute("msg","선택한 회원의 차단이 해제되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","차단 해제 실패");
				model.addAttribute("msg","차단 해제에 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/blockedMember.do?reqPage=1");
			return "member/swalMsg";
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
				model.addAttribute("title","공모 승인");
				model.addAttribute("msg","해당 공모전이 승인되었습니다. 공모전 게시판에 등록됩니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/contestEnrollList.do?reqPage=1");
			return "member/swalMsg";
		}
		
		
		//공모전 반려
		@RequestMapping(value="/contestNO.do")
		public String contestNO(int contestNo, Model model) {
			int result = service.contestNO(contestNo);
			if(result>0) {
				model.addAttribute("title","공모 반려");
				model.addAttribute("msg","해당 공모전이 반려되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/contestEnrollList.do?reqPage=1");
			return "member/swalMsg";
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
				model.addAttribute("title","처리 완료");
				model.addAttribute("msg","처리가 완료되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/contestEnrollMember.do?reqPage=1&date="+date);
			return "member/swalMsg";
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
				model.addAttribute("title","회사 인증");
				model.addAttribute("msg","선택 회사로 인증되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/companyEnroll.do?reqPage=1");
			return "member/swalMsg";
		}
		
		//회사 인증 반려
		@RequestMapping(value="/noEnrollMemberCompany.do")
		public String noEnrollMemberCompany(Model model, int memberNo) {
			int result = service.noEnrollMemberCompany(memberNo);
			if(result>0) {
				model.addAttribute("title","회사 인증 반려");
				model.addAttribute("msg","회사 인증이 반려처리 되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/companyEnroll.do?reqPage=1");
			return "member/swalMsg";
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
			model.addAttribute("countList5", tb.getCountList5());
			model.addAttribute("weekList", tb.getWeekList());
			return "admin/allBoardList";
		}
		
		//선택한 게시물 삭제
		@RequestMapping(value="/postSeleteDelete.do")
		public String postSeleteDelete(Model model, int type, int boardNo) {
			int result = service.postSeleteDelete(type, boardNo);
			if(result>0) {
				model.addAttribute("title","게시물 삭제");
				model.addAttribute("msg","선택한 게시물이 삭제되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/allBoardList.do?reqPage=1&type="+type);
			return "member/swalMsg";
		}
		
		//제휴회사 등록 페이지로 이동
		@RequestMapping(value="/addCompany2.do")
		public String addCompany() {
			return "member/addCompany";
		}
		
		//제휴회사 목록 페이지로 이동
		@RequestMapping(value="/affiliatesList.do")
		public String affiliatesList(Model model, int reqPage){
			CompanyListData cld = service.affiliatesList(reqPage);
			model.addAttribute("companyList", cld.getCompanyList());
			model.addAttribute("start", cld.getStart());
			model.addAttribute("pageNavi", cld.getPageNavi());
			return "admin/affiliatesList";
		}
		
		//제휴회사 삭제
		@RequestMapping(value="chkCompanyDel.do")
		public String chkCompanyDel(Model model, String companyNo) {
			boolean result = service.chkCompanyDel(companyNo);
			if(result) {
				model.addAttribute("title","회사 삭제 성공");
				model.addAttribute("msg","선택한 회사를 삭제하였습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","회사 삭제 실패");
				model.addAttribute("msg","회사 삭제에 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/affiliatesList.do?reqPage=1");
			return "member/swalMsg";
		}

}
















