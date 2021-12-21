package kr.or.jobSearch.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnouncePageData;
import kr.or.jobSearch.service.JobSearchService;
import kr.or.resume.vo.Resume;

@Controller
public class JobSearchController {
	
	@Autowired
	private JobSearchService service;

	@RequestMapping(value="/jobSearchList.do")
	public String jobSearchList(Model model, int reqPage) {
		AnnouncePageData apd = service.selectAllAnnounce(reqPage);
		System.out.println(apd.getList());
		model.addAttribute("list",apd.getList());
		model.addAttribute("pageNavi",apd.getPageNavi());
		model.addAttribute("start",apd.getStart());
		return "jobSearch/jobSearchList";
	}
	
	
	
	/*	CompanyController에서 사용
	 * @RequestMapping(value="/companyInfo.do") public String companyInfo() { return
	 * "jobSearch/companyInfo"; }
	 */
	
	
	
	@RequestMapping(value="/announceFrm.do")
	public String announceFrm() {
		return "jobSearch/announceFrm";
	}
	
}
		
