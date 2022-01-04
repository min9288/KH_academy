package kr.or.resume.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.ApplicationCompany;
import kr.or.member.model.vo.Member;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumePageData;

@Repository
public class ResumeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Resume> selectAllResumeList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("resume.selectAllResume", map);
		return (ArrayList<Resume>)list;
	}

	public int selectResumeTotalCount(int memberNo) {
		return sqlSession.selectOne("resume.selectResumeTotalCount", memberNo);
	}
	
	public Resume selectOneResume(int resumeNo) {
		return sqlSession.selectOne("resume.selectOneresume", resumeNo);
	}

	public int insertResume(Resume r) {
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("r", r);
		 * map.put("memberNo", memberNo);
		 */
		return sqlSession.insert("resume.insertResume", r);
	}

	public int selectCountResume(int memberNo) {
		return sqlSession.selectOne("resume.selectCountResume", memberNo);
	}

	public int resetCeoResume(int memberNo) { 
		return sqlSession.update("resume.resetCeoResume", memberNo); 
	}
	
	public int updateCeoResume(int resumeNo) {
		return sqlSession.update("resume.updateCeoResume", resumeNo); 
	}

	public Resume selectCeoResume(int ceoResume, int memberNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("memberNo", memberNo); 
		 map.put("ceoResume", ceoResume);
		return sqlSession.selectOne("resume.selectCeoResume", map);
	}

	public int updateResume(Resume r) {
		return sqlSession.update("resume.updateResume", r);
	}

	public Member selectOneMember(int memberNo) {
		return sqlSession.selectOne("resume.selectOneMember", memberNo);
	}

	public Resume selectResume(int resumeNo) {
		return sqlSession.selectOne("resume.selectResume", resumeNo);
	}

	public ArrayList<Announce> selectAnnounceNo(int memberNo) {
		List list = sqlSession.selectList("resume.selectAnnounceNo", memberNo);
		return (ArrayList<Announce>)list;
	}
	
	public ArrayList<ApplicationCompany> selectAllAnnounce(HashMap<String, Object> map) {
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("memberNo", memberNo); map.put("announceNo", announceNo);
		 */
		 
		List list = sqlSession.selectList("resume.selectAllAnnounce", map);
		return (ArrayList<ApplicationCompany>)list;
	}

	public int deleteResume(int resumeNo) {
		return sqlSession.delete("resume.deleteResume", resumeNo);
	}

	public int deleteApplycation(int resumeNo) {
		return sqlSession.delete("resume.deleteApplycation", resumeNo);
	}

	public int applicationCount(int memberNo) {
		return sqlSession.selectOne("resume.applicationCount", memberNo);
	}

	

	
	
	 
}
