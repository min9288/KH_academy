package kr.or.company.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.comment.vo.Comment;
import kr.or.company.service.CompanyService;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;
import kr.or.company.vo.CompanyInfoComment;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	@RequestMapping(value="/companyInfo.do")
	public String companyInfo(int companyNo, Model model) {
		/* int companyNo = service.selectCompanyNo(companyName); */
		//회사명으로 company정보 가져오기
		/* CompanyInfoComment */CompanyInfo company = service.selectCompany(companyNo);
		ArrayList<Comment> commentList = service.selectCompanyCommentList(companyNo);
		model.addAttribute("com", company);
		model.addAttribute("cl", commentList);
		System.out.println("company : "+ company);
		System.out.println("cl : "+ commentList);
		return "jobSearch/companyInfo";
	}
	
	//댓글등록
	@RequestMapping(value="/insertCompanyComment.do")
	public String insertCompanyComment(Comment cm, int boardNo, Model model) {
		String companyName = service.selectCompanyName(boardNo);
		int result = service.insertCompanyComment(cm);
		if(result>0) {
			model.addAttribute("msg","댓글등록 완료");	
		}else {
			model.addAttribute("msg","댓글등록 실패");
		}
		model.addAttribute("loc","/companyInfo.do?companyNo="+boardNo);
		return "common/msg";
	}
	
	//댓글수정
	@RequestMapping(value="/updateCompanyComment.do")
	public String updateCompanyComment(Comment cm, int boardNo, Model model) {
		String companyName = service.selectCompanyName(boardNo);
		int result = service.updateCompanyComment(cm);
		if(result>0) {
			model.addAttribute("msg","댓글수정 완료");	
		}else {
			model.addAttribute("msg","댓글수정 실패");
		}
		model.addAttribute("loc","/companyInfo.do?companyNo="+boardNo);
		return "common/msg";
	}
		
	//댓글삭제
	@RequestMapping(value="/deleteCompanyComment.do")	
	public String deleteCompanyComment(Comment cm, int boardNo, Model model) {
		String companyName = service.selectCompanyName(boardNo);
		int result = service.deleteCompanyComment(cm);
		if(result>0) {
			model.addAttribute("msg","댓글삭제 완료");	
		}else {
			model.addAttribute("msg","댓글삭제 실패");
		}
		model.addAttribute("loc","/companyInfo.do?companyNo="+boardNo);
		return "common/msg";
	}
}
