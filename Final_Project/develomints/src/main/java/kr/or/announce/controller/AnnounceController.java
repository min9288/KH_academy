package kr.or.announce.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.announce.service.AnnounceService;
import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnounceList;
import kr.or.announce.vo.AnnounceListPageData;
import kr.or.announce.vo.AnnounceView;
import kr.or.announce.vo.Application;
import kr.or.comment.vo.Report;
import kr.or.resume.vo.Resume;

@Controller
public class AnnounceController {
	@Autowired
	private AnnounceService service;

	@RequestMapping(value="/announceManage.do")
	public String announceManage(Model model, int memberNo) {
		/* ArrayList<Announce> list = service.selectAllannounce(memberNo); */
		Announce announce = service.selectAllannounce(memberNo);
		int comNo = service.selectComNo(memberNo);
		if(comNo != 0) {
			model.addAttribute("comNo", comNo);
		} else {
			model.addAttribute("comNo", 0);
		}
		int announceCount = service.selectAllAnnounceCount(memberNo);
		if(announce != null) {
			int count = service.selectAnnounceCount(announce.getAnnounceNo());
			model.addAttribute("count", count);
		}
		model.addAttribute("announceCount", announceCount);
		model.addAttribute("a", announce);
		return "jobSearch/announceManage";
	}
	
	@RequestMapping(value="/insertAnnounce.do")
	public String insertAnnounce(Announce a, int memberNo, Model model) {
		int result = service.insertAnnounce(a);
		if(result > 0) {
			model.addAttribute("title","구인공고 등록성공");
			model.addAttribute("icon","success");
		} else {
			model.addAttribute("title","구인공고 등록실패");			
			model.addAttribute("icon","fail");
		}
			model.addAttribute("loc","jobSearchList.do?reqPage=1");
		return "member/swalMsg";
		
	}
	
	@RequestMapping(value="/applicationStatus.do")
	public String applicationStatus(Model model, int announceNo, int reqPage) {
		AnnounceListPageData apd = service.selectApplyAnnounce(announceNo, reqPage);
		model.addAttribute("list", apd.getList());
		model.addAttribute("pageNavi", apd.getPageNavi());
		model.addAttribute("start", apd.getStart());
		model.addAttribute("count", apd.getCount());
		return "jobSearch/applicationStatus";
	}
	
	@RequestMapping(value="/updateAnnounceFrm.do")
	public String updateAnnounceFrm(int announceNo, Model model) {
		Announce announce = service.selectOneAnnounce(announceNo);
		model.addAttribute("a", announce);
		return "jobSearch/updateAnnounceFrm";
	}
	
	@RequestMapping(value="/updateAnnounce.do")
	public String updateAnnounce(Model model, Announce a) {
		int result = service.updateAnnounce(a);
		if(result > 0) {
			model.addAttribute("title","구인공고 수정성공");
			model.addAttribute("icon","success");
		} else {
			model.addAttribute("title","구인공고 수정실패");			
			model.addAttribute("icon","fail");
		}
		model.addAttribute("loc", "/announceManage.do?memberNo="+a.getMemberNo());
		return "member/swalMsg";
		
	}
	
	@RequestMapping(value="/deleteAnnounce.do")
	public String deleteAnnounce(int announceNo, Model model) {
		int result = service.deleteAnnounce(announceNo);
		if(result > 0) {
			model.addAttribute("title","구인공고가 삭제되었습니다.");
			model.addAttribute("icon","success");
		} else {
			model.addAttribute("title","구인공고 삭제 에러");	
			model.addAttribute("icon","fail");
		}
		model.addAttribute("loc","/announceManage.do?memberNo="+announceNo);
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/announceView.do")
	public String announceView(int announceNo, int memberNo, Model model) {
		AnnounceView announce = service.selectAnnounceView(announceNo);
		int ap = service.selectApplication(announceNo,memberNo);
		if(ap > 0) {
			//지원한 내역이 있을때
			model.addAttribute("ap",1);
		}else {
			//지원한 내역이 없을때
			model.addAttribute("ap",0);
		}
		/* int resumeNo = service.selectResumeNo(announceNo); */
		if(memberNo != 0) {
			Resume r = service.selectCeoResume(memberNo);
			model.addAttribute("r", r);
		}
		model.addAttribute("a", announce);
		return "jobSearch/announceView";
	}
	
	@RequestMapping(value="/insertApplication.do")
	public String insertApplication(Application app, Model model) {
		int result = service.insertApplication(app);
		if(result > 0) {
			model.addAttribute("title","지원완료되었습니다.");
			model.addAttribute("loc","jobSearchList.do?reqPage=1");
			model.addAttribute("icon","success");
		} else {
			model.addAttribute("title","지원신청 에러발생 삐융삐융");
			model.addAttribute("loc","jobSearchList.do?reqPage=1");
			model.addAttribute("icon","fail");
		}
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/okAnnounce.do")
	public String okAnnounce(AnnounceList al, Model model) {
		int result = service.okAnnounce(al);
		if(result>0) {
			model.addAttribute("title","합격처리 완료 되었습니다.");
			model.addAttribute("icon","success");
		}else {
			model.addAttribute("title","합격처리 실패");
			model.addAttribute("icon","fail");
		}
		model.addAttribute("loc","/applicationStatus.do?announceNo="+al.getAnnounceNo()+"&reqPage=1");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/noAnnounce.do")
	public String okAnnounce(int memberNo, int appNo, int announceNo, Model model) {
		int result = service.noAnnounce(memberNo, appNo);
		if(result>0) {
			model.addAttribute("title","탈락처리 완료 되었습니다.");
			model.addAttribute("icon","success");
		}else {
			model.addAttribute("title","탈락처리 실패");
			model.addAttribute("icon","fail");
		}
		model.addAttribute("loc","/applicationStatus.do?announceNo="+announceNo+"&reqPage=1");
		return "member/swalMsg";
	}
	
	
	 //댓글신고
	 
	 @RequestMapping(value="/reportCompanyComment.do") 
	 public String reportComment(Report rp, Model model, int contestNo) { 
		 int result = service.reportCompanyComment(rp); 
		 if(result>0) {
			 model.addAttribute("title","댓글 신고 성공");
			 model.addAttribute("msg","해당 댓글을 신고하였습니다.");
			 model.addAttribute("icon","success");
		 } else {
			 model.addAttribute("title","댓글 신고 실패");
			 model.addAttribute("msg","해당 댓글 신고에 실패하였습니다. 관리자에게 문의해주세요.");
			 model.addAttribute("icon","error"); 
		}
		model.addAttribute("loc","/companyInfo.do?companyNo="+contestNo); 
		return "member/swalMsg";
	 
	 }
	 
	
}
