package kr.or.contest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestMember;

@Repository
public class ContestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertContest(Contest c) {
		int result = sqlSession.insert("contest.insertContest",c);
		return result;
	}

	public ArrayList<Contest> contestAllList() {
		List<Contest> list = sqlSession.selectList("contest.contestAllList");
		return (ArrayList<Contest>)list;
	}

	public ArrayList<Contest> newContestList() {
		List<Contest> list = sqlSession.selectList("contest.newContestList");
		return (ArrayList<Contest>)list;
	}

	public ArrayList<Contest> hotContestList() {
		List<Contest> list = sqlSession.selectList("contest.hotContestList");
		return (ArrayList<Contest>)list;
	}

	public int contestCountUp(int contestNo) {
		return sqlSession.update("contest.contestCountUp", contestNo);
	}

	public Contest contestView(int contestNo) {
		return sqlSession.selectOne("contest.contestView",contestNo);
	}
	
	public int insertContestComment(Comment cm) {
		return sqlSession.insert("contest.insertContestComment",cm);
	}

	public ArrayList<Comment> commentList(int contestNo) {
		List<Comment> list = sqlSession.selectList("contest.commentList", contestNo);
		return (ArrayList<Comment>)list;
	}

	public int updateContestComment(Comment cm) {
		return sqlSession.update("contest.updateContestComment",cm);
	}

	public int deleteContestComment(Comment cm) {
		return sqlSession.delete("contest.deleteContestComment",cm);
	}

	public int reportContestComment(Report rp) {
		return sqlSession.insert("contest.reportContestComment",rp);
	}

	public int insertContestMember(ContestMember conmem) {
		return sqlSession.insert("contest.insertContestMember", conmem);
	}

	public ArrayList<Contest> contestCateList(Map<String, Object> map) {
		List<Contest> list = sqlSession.selectList("contest.contestCateList", map);
		return (ArrayList<Contest>)list;
	}

	public int totalCount(int type) {
		return sqlSession.selectOne("contest.totalCount",type);
	}

	public ArrayList<Contest> searchContest(String contestDeadline) {
		List<Contest> list = sqlSession.selectList("contest.searchContest", contestDeadline);
		return (ArrayList<Contest>)list;
	}

	public int enrollCount(int contestNo) {
		return sqlSession.selectOne("contest.enrollCount",contestNo);
	}

	public int deleteContest(int contestNo) {
		return sqlSession.delete("contest.deleteContest",contestNo);
	}

	public int duplicationCheckCon(Map<String, Object> map) {
		return sqlSession.selectOne("contest.duplicationCheckCon",map);
	}
	
}
