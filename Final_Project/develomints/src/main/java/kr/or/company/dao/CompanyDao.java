package kr.or.company.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;
import kr.or.company.vo.Company;
import kr.or.company.vo.CompanyInfo;

@Repository
public class CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public CompanyInfo selectCompany(int companyNo) {
		return sqlSession.selectOne("company.selectCompany", companyNo);
	}
	
	public int insertCompanyComment(Comment cm) {
		return sqlSession.insert("company.insertCompanyComment",cm);
	}

	public ArrayList<Comment> commentList(int companyNo) {
		List<Comment> list = sqlSession.selectList("company.commentList", companyNo);
		return (ArrayList<Comment>)list;
	}

	public int updateCompanyComment(Comment cm) {
		return sqlSession.update("company.updateCompanyComment",cm);
	}

	public int deleteCompanyComment(Comment cm) {
		return sqlSession.delete("company.deleteCompanyComment",cm);
	}

	public int selectCompanyNo(String companyName) {
		return sqlSession.selectOne("company.selectCompanyNo", companyName);
	}

	public String selectCompanyName(int companyNo) {
		return sqlSession.selectOne("company.selectCompanyName", companyNo);
	}
}
