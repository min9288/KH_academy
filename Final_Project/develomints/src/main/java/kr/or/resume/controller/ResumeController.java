package kr.or.resume.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.ApplicationCompany;
import kr.or.announce.vo.ApplicationCompanyPageData;
import kr.or.member.model.vo.Member;
import kr.or.resume.service.ResumeService;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumePageData;

@Controller
public class ResumeController {

	@Autowired
	private ResumeService service;

	
	 @RequestMapping(value="/resumeFrm.do") 
	 public String resumeFrm() { 
		 return "resume/resumeFrm"; 
	 }
	 
	@RequestMapping(value="/resumeManage.do")
	public String resumeManage(Model model, int memberNo, int reqPage) {
		ResumePageData rpd = service.selectAllResume(memberNo, reqPage);
		int appCount = service.applicationCount(memberNo);
		if(!rpd.getList().isEmpty()) {
			int count = service.selectResumeCount(memberNo);			
			model.addAttribute("count", count);
		}
		model.addAttribute("appCount", appCount);
		model.addAttribute("list", rpd.getList());
		model.addAttribute("pageNavi", rpd.getPageNavi());
		model.addAttribute("start", rpd.getStart());
		return "resume/resumeManage";
	}
	
	@RequestMapping(value="/updateResumeFrm.do")
	public String updateResume(Resume resume, int memberNo, Model model) {
		Resume r = service.selectCeoResume(resume.getCeoResume(), memberNo);
		model.addAttribute("r", r);
		return "resume/updateResumeFrm";
	}
	
	@RequestMapping(value="/updateResume.do")
	public String updateCeoResume(Resume r, int memberNo, Model model) {
		int resumeNo = r.getResumeNo();
		int result = service.updateResume(r);
		if(result > 0) {
			model.addAttribute("title","이력서 수정완료");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title","이력서 수정실패");
			model.addAttribute("icon", "fail");
		}
		model.addAttribute("loc", "/resumeManage.do?memberNo="+memberNo+"&reqPage=1");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/insertResume.do")
	public String insertResume(Resume r, int memberNo, Model model) {
		int result = service.insertResume(r);
		if(result != 0) {
			model.addAttribute("title", "이력서 등록성공");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "이력서 등록실패");
			model.addAttribute("msg", "입력 정보를 확인해주세요.");
			model.addAttribute("icon", "error");
		}
		model.addAttribute("loc","/resumeManage.do?memberNo="+memberNo+"&reqPage=1");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/ceoResume.do")
	@ResponseBody
	public Resume ceoResume(int resumeNo, int memberNo) {
		Resume resume = service.resetCeoResume(resumeNo, memberNo);
		return resume;
	}
	
	@RequestMapping(value="/ceoResumeView.do")
	public String ceoResumeView(Resume r, Model model) {
		int ceoResume = r.getCeoResume();
		Resume resume = service.selectCeoResume(ceoResume, r.getMemberNo());
		Member m = service.selectOneMember(resume.getMemberNo());
		model.addAttribute("r", resume);
		model.addAttribute("m", m);		
		return "resume/ceoResumeView";
	}
	
	@RequestMapping(value="/applicationCompany.do")
	public String applicationCompany(int memberNo, int reqPage, Model model) {
		ApplicationCompanyPageData acpd = service.selectAllAnnounce(memberNo, reqPage);
		/* ArrayList<ApplicationCompany> list = service.selectAllAnnounce(memberNo); */
		int count = service.applicationCount(memberNo);
		/* 이력서 내용 가져와야 할ㄹ 것 같은데 */
		/* ArrayList<Resume> resumeList = service.select */
		model.addAttribute("count", count);
		model.addAttribute("list", acpd.getList());
		model.addAttribute("pageNavi", acpd.getPageNavi());
		model.addAttribute("start", acpd.getStart());
		return "resume/applicationCompany";
	}
	
	@RequestMapping(value="/resumeView.do")
	public String resumeView(int resumeNo, Model model) {
		Resume resume = service.selectResume(resumeNo);
		Member m = service.selectOneMember(resume.getMemberNo());
		model.addAttribute("r", resume);
		model.addAttribute("m", m);
		return "resume/resumeView";
	}
	
	@RequestMapping(value="/rView.do")
	public String rView(int resumeNo, Model model) {
		Resume resume = service.selectResume(resumeNo);
		Member m = service.selectOneMember(resume.getMemberNo());
		model.addAttribute("r", resume);
		model.addAttribute("m", m);
		return "resume/rView";
	}
	
	@RequestMapping(value="/deleteResume.do")
	public String deleteResume(int resumeNo, Model model, int memberNo) {
		int result = service.deleteResume(resumeNo);
		if(result > 0) {
			model.addAttribute("title","이력서가 삭제되었습니다.");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title","이력서 삭제 에러");			
			model.addAttribute("icon", "fail");
		}
		model.addAttribute("loc","/resumeManage.do?memberNo="+memberNo+"&reqPage=1");
		return "member/swalMsg";
	}
	
	/*
	 * @RequestMapping(value="/noData.do") public String noData(String icon, String
	 * title, Model model) { model.addAttribute("title", title);
	 * model.addAttribute("icon", icon); return "resume/swalMsg"; }
	 */
	
}
