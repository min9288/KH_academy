package kr.or.jobSearch.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnouncePageData;
import kr.or.announce.vo.SearchAnnouncePageData;
import kr.or.jobSearch.service.JobSearchService;
import kr.or.resume.vo.Resume;

@Controller
public class JobSearchController {
	
	@Autowired
	private JobSearchService service;

	@RequestMapping(value="/jobSearchList.do")
	public String jobSearchList(Model model, int reqPage) {
		AnnouncePageData apd = service.selectAllAnnounce(reqPage);
		int count = service.selectAllAnnounceCount();	//전체 구인글 리스트 수
		model.addAttribute("count",count);
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
	public String announceFrm(int comNo, Model model) {
		String comName = service.selectComName(comNo);
		if(comName != null) {
			model.addAttribute("comName", comName);
		} else {
			
		}
		return "jobSearch/announceFrm";
	}
	
	@RequestMapping(value="/searchAnnounce.do")
	public String searchAnnounce(int reqPage, String keyword, int placeType, int workType, Model model) {
		SearchAnnouncePageData sapd = service.selectSearchAnnouncePageData(reqPage, keyword, placeType, workType);
		model.addAttribute("count",sapd.getCount());
		model.addAttribute("list",sapd.getList());
		model.addAttribute("pageNavi",sapd.getPageNavi());
		model.addAttribute("start",sapd.getStart());
		return "jobSearch/searchAnnounce";
	}
	
}
		
