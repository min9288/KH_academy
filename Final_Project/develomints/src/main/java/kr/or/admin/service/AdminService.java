package kr.or.admin.service;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.dao.AdminDao;
import kr.or.admin.vo.CompanyListData;
import kr.or.admin.vo.TotalBoard;
import kr.or.admin.vo.TotalData;
import kr.or.admin.vo.TotalMember;
import kr.or.announce.vo.Announce;
import kr.or.comment.vo.Report;
import kr.or.company.vo.Company;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;
import kr.or.contest.vo.ContestMemberList;
import kr.or.gosu.vo.GosuNotice;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.Member;
import kr.or.notice.vo.Notice;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.qna.vo.Qna;
import kr.or.share.model.vo.Share;
import kr.or.qna.vo.NonQna;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public TotalData totaldata(String sToday) {
		int todayTotalMember = dao.todayTotalMember();
		int todayJoinMember = dao.todayJoinMember(sToday);
		int todayOutMember = dao.todayOutMember(sToday);
		int todayTotalContent = dao.todayTotalContent(sToday);
		
		//6일전 ~ 오늘 날짜 리스트/가입수/탈퇴수 List
		List<String> dateList = new ArrayList<String>();
		List<Integer> joinList = new ArrayList<Integer>();
		List<Integer> outList = new ArrayList<Integer>();
		
		//날짜별로 List에 넣기
		for(int i=5;i>=0;i--) {
			//오늘날짜 불러오기
		  	Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    //String으로 포맷
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    //오늘날짜에서 i만큼 빼주기
		   	cal.add(Calendar.DATE, -i);
		   	String date =  df.format(cal.getTime());
		   	//해당날짜 가입 회원 구하고 리스트에 넣기
		    int join = dao.todayJoinMember(date);
		    joinList.add(join);
		    //해당날짜 탈퇴 회원 구하고 리스트에 넣기
		    int out = dao.todayOutMember(date);
		    outList.add(out);
		    //해당날짜 "yyyy-mm-dd" 형태로 포맷 후 리스트에 넣기
		    date =  "\""+df.format(cal.getTime())+"\"";
		    dateList.add(date);
		}
		
		//어제 총 회원 / 어제 총 게시물 불러오기
		//오늘날짜 불러오기
	  	Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    //String으로 포맷
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    //오늘날짜에서 i만큼 빼주기
	   	cal.add(Calendar.DATE, -1);
	   	String ydate =  df.format(cal.getTime());
	   	//해당날짜 가입 회원 구하고 리스트에 넣기
	    int yesterDayTotalMember = dao.yesterDayTotalMember(ydate);
	    int yesterDayTotalBoard = dao.yesterDayTotalBoard(ydate);
		
		//등급별 회원 수 List
		List<Integer> gradeList = new ArrayList<Integer>();
		gradeList = dao.gradeList();
		
		//카테고리별 게시글 List
		List<Integer> cateList = new ArrayList<Integer>();
		cateList = dao.cateList();
		
		HashMap<String, Object> date = new HashMap<String, Object>();
		date.put("dateList", dateList);
		
		//최신공지사항 5개 불러오기
		ArrayList<Notice> noticeList = dao.noticeList();
		ArrayList<Qna> qnaList = dao.qnaList();
		ArrayList<NonQna> nonQnaList = dao.nonQnaList();
		
		
		
		TotalData td = new TotalData(todayTotalMember, todayJoinMember, todayOutMember, todayTotalContent, dateList, joinList, outList, gradeList, cateList, yesterDayTotalMember, yesterDayTotalBoard, noticeList, qnaList, nonQnaList); 
		return td;
	}

	public TotalMember totalMember(int reqPage, int type, int list, String id) {
		//한페이지에 보여줄 회원 수
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("list", list);
		map.put("id", id);
		ArrayList<Member> allMemberList = dao.allMemberList(map);		
		
		//페이지 네비게이션 제작
		int totalCount = dao.allMemberCount(map);
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+(pageNo-1)+"&type="+type+"&list="+list+"&id="+id+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		List<Integer> totalCountList = dao.totalCountList();
		
		TotalMember tm = new TotalMember(allMemberList, start, pageNavi, totalCountList);
		
		return tm;
	}

	public boolean chkChangeLevel(String memberId, String level) {
		StringTokenizer st1 = new StringTokenizer(memberId,"/");
		StringTokenizer st2 = new StringTokenizer(level,"/");
		boolean result = true;
		while(st1.hasMoreTokens()) {
			String id = st1.nextToken();
			String grade = st2.nextToken();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("grade", grade);
			int result1 = dao.chkChangeLevel(map);
			if(result1 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	public TotalMember totalReposrtList(int reqPage) {
		//한페이지에 보여줄 신고회원
		int numPerPage = 6;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Report> allReportList = dao.allReportList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.reportCount();
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		ArrayList<Report> report5List = dao.report5List();
		TotalMember tm = new TotalMember(start, pageNavi, allReportList, totalCount, report5List);

		
		return tm;		
		
	}

	public int memberReportCount(String id) {
		return dao.memberReportCount(id);
	}
	
	@Transactional
	public int canselReport(int reportNo) {
		return dao.canselReport(reportNo);
	}
	
	@Transactional
	public int reportInsert(int reportNo, String memberId) {
		int result = dao.reportInsert(reportNo);
		int rpCount = dao.memberReportCount(memberId);
		int result1 = 0;
		if(result>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("rpCount", rpCount);
			map.put("memberId", memberId);
			result1 = dao.memberGradeChange1(map);
		}
		return result1;
	}
	
	@Transactional
	public int falseReport(int reportNo, String memberId) {
		int result = dao.falseReport(reportNo);
		int result1 = 0;
		if(result>0) {
			result1 = dao.memberGradeChange2(memberId);
		}
		return result1;
	}

	public TotalMember totalBlockedMemberList(int reqPage, String id) {
		//한페이지에 보여줄 차단회원
		int numPerPage = 6;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		ArrayList<Member> allblockedList = dao.allblockedList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalBlockedCount(map);
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+(pageNo-1)+"&id="+id+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		
		List<String> blockedMemberId = dao.blockedMemberId(map);
		List<String> lastReport = new ArrayList<String>();
		for(int i=0;i<blockedMemberId.size();i++) {
			lastReport.addAll(dao.lastReportDate(blockedMemberId.get(i)));
		}
		
		
		
		TotalMember tm = new TotalMember(pageNavi, allblockedList, start, totalCount, lastReport);
		return tm;		
	}

	public ArrayList<Report> memberReportView(String id) {
		return dao.memberReportView(id);
	}

	public boolean cancelBlocked(String memberId) {
		StringTokenizer st1 = new StringTokenizer(memberId,"/");
		boolean result = true;
		int result1 = 0;
		int result2 = 0;
		while(st1.hasMoreTokens()) {
			String id = st1.nextToken();
			List<Integer> list = dao.concelReportNo(id);
			for(int i=0;i<list.size();i++) {
				int no = list.get(i);
				result1 = dao.cancelReportMember(no);
			}
			result2 = dao.changeType(id);
			if(result2 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	public ContestList contestEnrollList(int reqPage) {
		//한페이지에 보여줄 공모전
		int numPerPage = 8;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Contest> contestList = dao.contestList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalContestCount();
		
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		ContestList cl = new ContestList(contestList, start, totalCount, pageNavi);
		return cl;
	}

	public Contest enrollContestView(int contestNo) {
		return dao.enrollContestView(contestNo);
	}

	public int contestOK(int contestNo) {
		return dao.contestOK(contestNo);
	}

	public int contestNO(int contestNo) {
		return dao.contestNO(contestNo);
	}

	public ContestList contestEnrollMember(int reqPage, String date) {
		//한페이지에 보여줄 공모
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("date", date);
		ArrayList<Contest> contestList = dao.contestDateList(map);	
		
		List<Integer> contestMemberCount = new ArrayList<Integer>();
		
		for(int i = 0;i<contestList.size();i++) {
			contestMemberCount.add(dao.contestMemberCount(contestList.get(i).getContestNo()));
		}
		
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalContestDateCount(date);
		
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollMember.do?reqPage="+(pageNo-1)+"&date="+date+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/contestEnrollMember.do?reqPage="+pageNo+"&date="+date+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollMember.do?reqPage="+pageNo+"&date="+date+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollMember.do?reqPage="+pageNo+"&date="+date+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		ContestList cl = new ContestList(contestList, start, pageNavi, totalCount, contestMemberCount);
		
		return cl;
	}

	public ArrayList<ContestMemberList> searchContestMember(int contestNo) {
		return dao.searchContestMember(contestNo);
	}
	
	@Transactional
	public boolean MemberEnrollContest(String memberId, int status, int contestNo, String email) {
		
		StringTokenizer st1 = new StringTokenizer(memberId,"/");
		boolean result = true;
		int result1 = 0;
		while(st1.hasMoreTokens()) {
			String id = st1.nextToken();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("status", status);
			map.put("contestNo", contestNo);
			result1 = dao.MemberEnrollContest(map);
			if(result1 == 0) {
				result = false;
				break;
			}
		}
		if(email != null) {
			//회원목록 불러오기
			ArrayList<ContestMemberList> cmList = dao.enrollMemberList(contestNo);
			
			String mailContent = "<p>-----------------------------------</p>";
			for(int i=0;i<cmList.size();i++) {
				mailContent += "<h4>"+(i+1)+".</h4>";
				mailContent +=  "<p> 회원 아아디 : "+cmList.get(i).getMemberId()+"</p>";
				mailContent += "<p> 회원 이메일 : "+cmList.get(i).getEmail()+"</p>";
				mailContent += "<p> 회원 전화번호 : "+cmList.get(i).getPhone()+"</p>";
				mailContent += "<p> 회원 깃주소 : "+cmList.get(i).getCmGit()+"</p>";
			}
			
			
			
			//이메일 설정
			Properties prop = System.getProperties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", 587);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", true);
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			//인증정보설정(gmail 로그인)
			Session session = Session.getDefaultInstance(prop, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					PasswordAuthentication pa = new PasswordAuthentication("develeomints@gmail.com", "ehdrn1234!");
					return pa;
				}
			});
			
			//이메일을 작성해서 전송하는 객체 생성
			MimeMessage msg = new MimeMessage(session);
			
			
			try {
				msg.setSentDate(new Date());		//메일 전송날짜 설정
				//보내는사람 정보
				msg.setFrom(new InternetAddress("develeomints@gmail.com","Develomints"));
				//받는사람정보
				InternetAddress to = new InternetAddress(email);
				msg.setRecipient(Message.RecipientType.TO, to);
				//이메일 제목설정
				msg.setSubject("공모전 신청 회원 목록","UTF-8");
				//이메일 내용설정
				msg.setContent("<h3>공모전 신청회원 목록입니다.</h3><br><br>"+mailContent+"<p>-----------------------------------</p>"
						,"text/html;charset=UTF-8");
				//이메일 전송
				Transport.send(msg);
				result = true;
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	public TotalMember companyEnroll(int reqPage) {
		
		int numPerPage = 6;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<CertiVO> certiList = dao.certiList(map);	
		
		ArrayList<Member> memberInfoList = new ArrayList<Member>();
		
		for(int i = 0;i<certiList.size();i++) {
			memberInfoList.add(dao.memberInfoList(certiList.get(i).getMemberNo()));
		}
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalcertiMemberCount();
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/companyEnroll.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/companyEnroll.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/companyEnroll.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/companyEnroll.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		ArrayList<Company> companyList = dao.companyList();
		
		TotalMember tm = new TotalMember(pageNavi, totalCount, certiList, memberInfoList, companyList);
		
		
		return tm;
	}
	
	@Transactional
	public int enrollMemberCompany(int companyNo, int memberNo) {
		int result = dao.enrollMemberCompany(memberNo);
		int result1 = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyNo", companyNo);
		map.put("memberNo", memberNo);
		if(result > 0) {
			result1 = dao.enrollMemberCompany2(map);
			
		}
		return result1;
	}

	public int noEnrollMemberCompany(int memberNo) {
		int result = dao.noEnrollMemberCompany(memberNo);
		return result;
	}

	public TotalBoard totalBoard(int reqPage, int type) {
		
		TotalBoard tb = new TotalBoard();
		
		//한페이지에 보여줄 게시물
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		if(type == 1) {
			ArrayList<ProjectTeam> projectList = dao.projectList(map);
			tb.setProjectList(projectList);
		}else if(type == 2) {
			ArrayList<Share> shareList = dao.shareList(map);
			tb.setShareList(shareList);
		}else if(type == 3) {
			ArrayList<Announce> announceList = dao.announceList(map);
			tb.setAnnounceList(announceList);
		}else if(type == 4) {
			ArrayList<GosuNotice> gosuList = dao.gosuList(map);
			tb.setGosuList(gosuList);
		}else if(type == 5) {
			ArrayList<Contest> contesetList = dao.contesetList(map);
			tb.setContesetList(contesetList);
		}
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalBoardCount(type);
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allBoardList.do?reqPage="+(pageNo-1)+"&type="+type+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/allBoardList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allBoardList.do?reqPage="+pageNo+"&type="+type+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allBoardList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		tb.setStart(start);
		tb.setTotalCount(totalCount);
		tb.setPageNavi(pageNavi);
		
		int allBoardCount = dao.allBoardCount();
		tb.setAllBoardCount(allBoardCount);
		
		List<Integer> countList5 = new ArrayList<Integer>();
		List<String> weekList = new ArrayList<String>();
		
		//날짜별로 List에 넣기
		for(int i=4;i>=0;i--) {
			//오늘날짜 불러오기
		  	Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    //String으로 포맷
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    //오늘날짜에서 i만큼 빼주기
		   	cal.add(Calendar.DATE, -i);
		   	String date =  df.format(cal.getTime());
		   	//해당날짜 게시물 수 구하기
		   	Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("date", date);
			map2.put("type", type);
		    int bCount = dao.countList5(map2);
		    countList5.add(bCount);
		    //요일 구하기
		    int week = cal.get(Calendar.DAY_OF_WEEK);
		    String day = "";
		    switch (week) { 
	        case 1:
	            day = "SUN";
	            break;
	        case 2:
	            day = "MON";
	            break;
	        case 3:
	            day = "TUE";
	            break;
	        case 4:
	            day = "WED";
	            break;
	        case 5:
	            day = "THU";
	            break;
	        case 6:
	            day = "FRI";
	            break;
	        case 7:
	            day = "SAT";
	            break;
	        }
		    String stDay =  "\""+day+"\"";
		    weekList.add(stDay);
		}
		tb.setCountList5(countList5);
		tb.setWeekList(weekList);
		
		
		
		return tb;
	}
	@Transactional
	public int postSeleteDelete(int type, int boardNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("boardNo", boardNo);
		int result = dao.postSeleteDelete(map);
		return result;
	}

	public CompanyListData affiliatesList(int reqPage) {
		
		CompanyListData cld = new CompanyListData();
		
		//한페이지에 보여줄 게시물
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Company> companyList = dao.affiliatesList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalCompanyCount();
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/affiliatesList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/affiliatesList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/affiliatesList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/affiliatesList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		cld.setCompanyList(companyList);
		cld.setPageNavi(pageNavi);
		cld.setStart(start);
		
		return cld;
	}
	@Transactional
	public boolean chkCompanyDel(String companyNo) {
		StringTokenizer st1 = new StringTokenizer(companyNo,"/");
		boolean result = true;
		while(st1.hasMoreTokens()) {
			String comNo = st1.nextToken();
			int comNo2 = Integer.parseInt(comNo);
			int result1 = dao.chkCompanyDel(comNo2);
			if(result1 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}
}














