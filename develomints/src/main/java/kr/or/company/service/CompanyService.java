package kr.or.company.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Comment;
import kr.or.company.dao.CompanyDao;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;
import kr.or.company.vo.CompanyInfoComment;
import kr.or.contest.vo.ContestList;

@Service
public class CompanyService {

	@Autowired
	private CompanyDao dao;

	public CompanyInfo selectCompany(int companyNo) {
		CompanyInfo companyInfo = dao.selectCompany(companyNo);
		return companyInfo;
	}
	
	public ArrayList<Comment> selectCompanyCommentList(int companyNo) {
		return dao.commentList(companyNo);
	}
	
	@Transactional
	public int insertCompanyComment(Comment cm) {
		return dao.insertCompanyComment(cm);
	}
	
	@Transactional
	public int updateCompanyComment(Comment cm) {
		return dao.updateCompanyComment(cm);
	}
	
	@Transactional
	public int deleteCompanyComment(Comment cm) {
		return dao.deleteCompanyComment(cm);
	}

	public int selectCompanyNo(String companyName) {
		return dao.selectCompanyNo(companyName);
	}

	public String selectCompanyName(int companyNo) {
		return dao.selectCompanyName(companyNo);
	}

	
}
