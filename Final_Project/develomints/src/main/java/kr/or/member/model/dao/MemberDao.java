package kr.or.member.model.dao;

import java.util.ArrayList; 
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.or.company.vo.Company;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;
import kr.or.gosu.vo.GosuNotice;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.CrewVO;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MyContest;
import kr.or.member.model.vo.ProjectLikes;
import kr.or.member.model.vo.ProjectPageVO;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.share.model.vo.Share;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member.selectOneMember",member);
	}

	public Member checkPhone(String phone) {
		return sqlSession.selectOne("member.checkPhone",phone);
	}

	public Member checkId(String memberId) {
		return sqlSession.selectOne("member.checkId",memberId);
	}

	public Member checkEmail(String email) {
		return sqlSession.selectOne("member.checkEmail",email);
	}

	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember",member);
	}

	public String findId(String email) {
		return sqlSession.selectOne("member.findId",email);
	}

	public Member pwCheck(Member member) {
		return sqlSession.selectOne("member.pwCheck",member);
	}

	public int resetPwMember(Member member) {
		return sqlSession.update("member.resetPwMember",member);
	}

	public int resignMember(String memberId) {
		return sqlSession.delete("member.resignMember",memberId);
	}

	public int insertDelete(Member m) {
		return sqlSession.insert("member.insertDelete",m);
	}
	
	public int insertCertification(CertiVO file) {
		return sqlSession.insert("member.insertCertification",file);
	}

	public int updateMyInfo(Member m) {
		return sqlSession.insert("member.updateMyInfo",m);
	}

	public int updateProfile(Member m) {
		return sqlSession.update("member.updateProfile",m);
	}

	public int changePwMember(Member m) {
		return sqlSession.update("member.changePwMember",m);
	}

	public int addCompany(Member m) {
		return sqlSession.update("member.addCompnay",m);
	}

	public Company checkCompany(Member m) {
		return sqlSession.selectOne("member.checkCompany",m);
	}

	public int delProfile(Member m) {
		return sqlSession.update("member.delProfile",m);
	}

	public ArrayList<GosuNotice> gosuNoticeLists(HashMap<String, Object> map) {
		List<GosuNotice> list = sqlSession.selectList("member.gosuNoticeList",map);
		return (ArrayList<GosuNotice>)list;
	}

	public int gosuTotalCount(String memberId) {
		return sqlSession.selectOne("member.gosuTotalCount",memberId);
	}

	public ArrayList<MyContest> contestMemberList(HashMap<String, Object> map) {
		List<MyContest> list = sqlSession.selectList("member.contestMemberList",map);
		return (ArrayList<MyContest>)list;
	}

	public int contestCount(String memberId) {
		return sqlSession.selectOne("member.contestCounts",memberId);
	}
	
	public ArrayList<CrewVO> crewList(HashMap<String, Object> map) {
		List<CrewVO> list = sqlSession.selectList("member.crewList",map);
		return (ArrayList<CrewVO>)list;
	}
	public int crewListCount(int memberNo) {
		return sqlSession.selectOne("member.crewListCount",memberNo);
	}

	public ArrayList<ProjectPageVO> myproject(HashMap<String, Object> map) {
		List<ProjectPageVO> list = sqlSession.selectList("member.myproject",map);
		return (ArrayList<ProjectPageVO>)list;
	}

	public int myproejtCount(int memberNo) {
		return sqlSession.selectOne("member.myprojectCount",memberNo);
	}

	public ArrayList<ProjectLikes> projectLikes(HashMap<String, Object> map) {
		List<ProjectLikes> list = sqlSession.selectList("member.projectLikes",map);
		return (ArrayList<ProjectLikes>)list;
	}

	public int projectLikeCount(int memberNo) {
		return sqlSession.selectOne("member.projectLikesCnt",memberNo);
	}

	public ArrayList<Share> myboardPageList(HashMap<String, Object> map) {
		List<Share> list = sqlSession.selectList("member.myBoard",map);
		return (ArrayList<Share>)list;
	}

	public int boardCount(int memberNo) {
		return sqlSession.selectOne("member.boardCount",memberNo);
	}

	public int announceNo(int comNo) {
		return sqlSession.selectOne("member.announceNo",comNo);
	}

	public Member existCompany(Member m) {
		return sqlSession.selectOne("member.existCompany",m);
	}

	public int insertCompnay(Company com) {
		return sqlSession.insert("member.addCompany",com);
	}

	public Company selectOneMember(String comNo) {
		return sqlSession.selectOne("member.selectCompany",comNo);
	}

	public int updateCompany(Company com) {
		return sqlSession.update("member.updateCompany",com);
	}

	public int rollbackCompany(String memberId) {
		return sqlSession.update("member.rollbackCom",memberId);
	}

	public int kakaoInsertMember(Member member) {
		return sqlSession.insert("member.kakaoinsertMember",member);
	}

}