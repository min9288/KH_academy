package kr.or.common;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.service.AdminService;
import kr.or.admin.vo.TotalData;
import kr.or.announce.vo.AnnouncePageData;
import kr.or.contest.service.ContestService;
import kr.or.contest.vo.ContestList;
import kr.or.gosu.service.GosuService;
import kr.or.gosu.vo.Gosu;
import kr.or.jobSearch.service.JobSearchService;
import kr.or.projectTeam.model.service.ProjectTeamService;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;
import kr.or.qna.service.QnaService;
import kr.or.qna.vo.NonQna;
import kr.or.share.model.service.ShareService;
import kr.or.share.model.vo.ShareBoardPage;

@Controller
public class mainController {
	
	@Autowired
	private ProjectTeamService ptsService;
	
	@Autowired
	private GosuService gosuService;
	
	@Autowired
	private ContestService conService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ShareService shService;
	
	@Autowired
	private JobSearchService jobService;
	
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		//고수에서 불러오기
		ArrayList<Gosu> g = gosuService.selectGosuList();
		//공모전에서 불러오기
		ContestList list = conService.selectContestList();
		//admin에서 불러오기
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String sToday = today.format(formatter);
		TotalData td = adminService.totaldata(sToday);
		//qna에서 불러오기
		ArrayList<NonQna> adlist = qnaService.counselList2();
		//개발지식공유에서 불러오기
		int reqPage = 1;
		int type = 1;
		ShareBoardPage sbp = shService.shareBoardList(reqPage,type);
		//구인구직 가지고오기
		AnnouncePageData apd = jobService.selectAllAnnounce(reqPage);
		//팀프로젝트에서 불러오기
		projectTeamMainPageData ptmpd = ptsService.mainProjectTeamPageData();
		
		model.addAttribute("gosuList",g);
		model.addAttribute("conlist",list);
		model.addAttribute("noticeList", td.getNoticeList());
		model.addAttribute("adlist",adlist);
		model.addAttribute("shlist",sbp.getList());
		model.addAttribute("joblist",apd.getList());
		model.addAttribute("ptlist", ptmpd.getList());
		model.addAttribute("pdLangList", ptmpd.getPdLangList());
		return "common/main";
	}
	
}
