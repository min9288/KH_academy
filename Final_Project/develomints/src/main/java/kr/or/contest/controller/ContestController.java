package kr.or.contest.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.contest.service.ContestService;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;

@Controller
public class ContestController {

	@Autowired
	private ContestService service;
	
	//공모전 메인페이지 이동
	@RequestMapping(value="/contestMain.do")
	public String contestMain(Model model) {
		//공모전 최신리스트, 인기리스트 불러오기
		ContestList list = service.selectContestList();
		model.addAttribute("list",list);
		return "contest/contestMain";
	}
	
	
	//공모전 등록 페이지 이동
	@RequestMapping(value="/insertContestFrm.do")
	public String insertContestFrm() {
		return "contest/insertContestFrm";
	}
	
	
	//공모전 등록
	@RequestMapping(value="/insertContest.do")
	public String insertContest(Contest c, HttpServletRequest request, MultipartFile files, Model model) {

		//포스터 파일 저장 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/img/contest/");
		//사용자가 올린 파일명
		String filename = files.getOriginalFilename();
		//올린 파일명에서 확장자 앞까지 자르기 
		String onlyFilename = filename.substring(0,filename.indexOf("."));
		//올린 파일명에서 확장자 부분 자르기
		String extention = filename.substring(filename.indexOf("."));
		
		//실제 업로드할 파일명
		String filepath = null;
		//중복 파일 뒤에 붙여줄 숫자
		int count = 0;
		//중복된 파일이 없을 때까지 반복(파일명 중복시 숫자 붙이는 코드)
		while(true) {
			if(count == 0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			//파일 경로안에 중복된 파일이 있는지 체크
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		
		//중복처리가 끝나면 파일 업로드
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = files.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//중복처리된 파일 이름 넣어주기
		c.setContestImg(filepath);
		
		int result = service.insertContest(c);
		
		if(result>0) {
			model.addAttribute("title","공모전 등록 성공.");
			model.addAttribute("msg","관리자 승인 후 등록됩니다.");
			model.addAttribute("icon","success");
		
		}else {
			model.addAttribute("title","공모전 등록 실패");
			model.addAttribute("msg","공모전 등록에 실패하였습니다. 관리자에게 문의해주세요.");
			model.addAttribute("icon","error");
		}

		model.addAttribute("loc","/contestMain.do");
		return "member/swalMsg";
	}
	
	//공모전 상세페이지로 이동
	@RequestMapping(value="/contestView.do")
	public String contestView(int contestNo, Model model) {
		//공모전 정보 불러오면서 조회수 올려주기
		ContestList list = service.contestView(contestNo);
		model.addAttribute("list",list);
		model.addAttribute("enrollCount",list.getEnrollCount());
		LocalDate today = LocalDate.now();
		model.addAttribute("today",today);
		return "contest/contestView";
	}
	
	//댓글등록
	@RequestMapping(value="/insertContestComment.do")
	public String insertContestComment(Comment cm, Model model) {
		int result = service.insertContestComment(cm);
		if(result>0) {
			return "redirect:/contestView.do?contestNo="+cm.getBoardNo();
		}else {
			model.addAttribute("msg","댓글등록 실패");
			model.addAttribute("loc","/contestView.do?contestNo="+cm.getBoardNo());
			return "common/msg";
		}
		
	}
	
	//댓글수정
	@ResponseBody
	@RequestMapping(value="/updateContestComment.do")
	public int updateContestComment(Comment cm, Model model) {
		int result = service.updateContestComment(cm);
		return result;
	}
	
	//댓글삭제
	@ResponseBody
	@RequestMapping(value="/deleteContestComment.do")	
	public int deleteContestComment(Comment cm, Model model) {
		int result = service.deleteContestComment(cm);
		return result;
	}

	//댓글신고
	@RequestMapping(value="/reportComment.do")
	public String reportComment(Report rp, Model model, int contestNo) {
		int result = service.reportContestComment(rp);
		if(result>0) {
			model.addAttribute("title","댓글 신고 성공");
			model.addAttribute("msg","해당 댓글을 신고하였습니다.");
			model.addAttribute("icon","success");
		
		}else {
			model.addAttribute("title","댓글 신고 실패");
			model.addAttribute("msg","해당 댓글 신고에 실패하였습니다. 관리자에게 문의해주세요.");
			model.addAttribute("icon","error");
		}
		model.addAttribute("loc","/contestView.do?contestNo="+contestNo);
		return "member/swalMsg";
		
	}
	
	//공모신청
	@RequestMapping(value="/insertContestMember.do")
	public String insertContestMember(ContestMember conmem, Model model) {
		int result = service.insertContestMember(conmem);
		if(result>0) {
			model.addAttribute("title","공모 신청");
			model.addAttribute("msg","공모신청이 완료되었습니다.");
			model.addAttribute("icon","success");
		
		}else {
			model.addAttribute("title","처리 실패");
			model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
			model.addAttribute("icon","error");
		}
		model.addAttribute("loc","/contestView.do?contestNo="+conmem.getContestNo());
		return "member/swalMsg";
	}
	
	//공모전 전체보기
	@RequestMapping(value = "/allContestList.do")
	public String allContestList(Model model, int reqPage, int type) {
		
		ContestList cList = service.contestCateList(reqPage, type);
		
		model.addAttribute("list", cList.getContestList());
		model.addAttribute("start", cList.getStart());
		model.addAttribute("pageNavi",cList.getPageNavi());
		model.addAttribute("type", type);
		return "contest/allContestList";
	}
	
	//공모전 캘린더
	@RequestMapping(value="/contestCalendar.do")
	public String contestCalendar(Model model) {
		LocalDate today = LocalDate.now();
		model.addAttribute("today",today);
		return "contest/contestCalendar";
	}
	
	//공모전 날짜 검색
	@ResponseBody
	@RequestMapping(value="/searchContest.do", produces = "application/json;charset=utf-8")
	public String searchContest(String contestDeadline) {
		ArrayList<Contest> list = service.searchContest(contestDeadline);
		return new Gson().toJson(list);
	}
	
	//공모삭제
		@RequestMapping(value="/deleteContest.do")
		public String deleteContest(int contestNo, Model model) {
			int result = service.deleteContest(contestNo);
			if(result>0) {
				model.addAttribute("title","공모 삭제");
				model.addAttribute("msg","공모전이 삭제되었습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","처리 실패");
				model.addAttribute("msg","처리 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			model.addAttribute("loc","/contestMain.do");
			return "member/swalMsg";
		}
	
	//공모전 중복 체크
		@ResponseBody
		@RequestMapping(value="/duplicationCheckCon.do")
		public int duplicationCheckCon(String memberId, int contestNo) {
			int result = service.duplicationCheckCon(memberId, contestNo);
			System.out.println(result);
			return result;
		}
}


















