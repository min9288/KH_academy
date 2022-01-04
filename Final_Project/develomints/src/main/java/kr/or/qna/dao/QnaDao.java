package kr.or.qna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.vo.Faq;
import kr.or.qna.vo.Qna;
import kr.or.qna.vo.NonQna;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	//--------------------비회원전용
	public int insertCountNonQna(NonQna nq) {
		return sqlsession.insert("qna.insertCounselNonQna",nq);
	}


	public int insertCounselQna(Qna q) {
		return sqlsession.insert("qna.insertCountQna",q);
	}


	public int insertFile(ProjectTeamFileVO ptfv) {
		return sqlsession.insert("qna.insertFile",ptfv);
	}


	public ArrayList<Qna> counselList() {
		List<Qna> list = sqlsession.selectList("qna.counselList");
		return (ArrayList<Qna>)list;
	}


	public ArrayList<NonQna> counselList2() {
		List<NonQna> list = sqlsession.selectList("qna.counselList2");
		return (ArrayList<NonQna>)list;
	}


	public int updateCounsel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.update("qna.updateCounsel",map);
	}


	public ArrayList<Qna> myCounselOne(String memberId) {
		List<Qna> list = sqlsession.selectList("qna.myCounselOne",memberId);
		return (ArrayList<Qna>)list;
	}


	public ArrayList<Qna> searchBox1(HashMap<String, Object> map) {
		List<Qna> list = sqlsession.selectList("qna.searchBox1",map);
		return (ArrayList<Qna>)list;
	}


	public ArrayList<NonQna> searchBox2(HashMap<String, Object> map) {
		List<NonQna> list = sqlsession.selectList("qna.searchBox2",map);
		return (ArrayList<NonQna>)list;
	}


	public ArrayList<Faq> selectFaqlist(int category) {
		List<Faq> list = sqlsession.selectList("qna.selectFaqList",category);
		return (ArrayList<Faq>)list;
	}


	public ArrayList<ProjectTeamFileVO> selectOnefileList(int qnaNo) {
		List<ProjectTeamFileVO> list = sqlsession.selectList("qna.selectOnefileList",qnaNo);
		return (ArrayList<ProjectTeamFileVO>) list;
	}


	public ArrayList<Qna> userSearchBox(HashMap<String, Object> map) {
		List<Qna> list = sqlsession.selectList("qna.userSearchBox",map);
		return (ArrayList<Qna>) list;
	}


	public int deleteMyQna(int qnaNo) {
		// TODO Auto-generated method stub
		return sqlsession.delete("qna.deleteMyQna",qnaNo);
	}


	public NonQna enterThePw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("qna.enterThePw",map);
	}


	public ArrayList<NonQna> nonSearchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<NonQna> list = sqlsession.selectList("qna.nonSearchList",map);
		return (ArrayList<NonQna>) list;
	}


	public ProjectTeamFileVO boardFileList(int fileNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("qna.selectBoardFileDown",fileNo);
	}




	
	
}
