package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
//	@Autowired
//	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member login2(String memberId, String memberPw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("memberPw", memberPw);
		List list = sqlSession.selectOne("member.login2", map);
		if(list.isEmpty()) {
			return null;
		} else {
			Member m = (Member)list.get(0);
			return m;
		}
	}
	
//	public Member login2(String memberId, String memberPw) {
//		String query = "select * from member where member_id=? and member_pw=?";
//		Object[] params = {memberId, memberPw};
//		List list = jdbcTemplate.query(query, params, new MemberRowMapper());
//		if(list.isEmpty()) {
//			return null;
//		} else {
//			Member m = (Member)list.get(0);
//			return m;
//		}
//	}

	public Member selectOneMember(Member m) {
		Member member = sqlSession.selectOne("member.selectOneMember", m);
		return member;
	}
//
//	public int insertMember(Member m) {
//		String query = "insert into member values(?,?,?,?,to_char(sysdate, 'yyyy-mm-dd'))";
//		Object[] params = {m.getMemberId(), m.getMemberPw(), m.getMemberName(), m.getAddress()};
//		// insert, update, delete -> jdbcTemplate.update();
//		int result = jdbcTemplate.update(query, params);
//		return result;
//	}
//
//	public Member mypage(String memberId) {
//		String query = "select * from member where member_id=?";
//		Object[] params = {memberId};
//		List list = jdbcTemplate.query(query, params, new MemberRowMapper());
//		if(list.isEmpty()) {
//			return null;
//		} else {
//			Member m = (Member)list.get(0);
//			return m;
//		}
//	}
//
//	public int updateMember(Member m) {
//		String query = "update member set address=? where member_id=?";
//		Object[] params = {m.getAddress(), m.getMemberId()};
//		int result = jdbcTemplate.update(query, params);
//		return result;
//	}
//
//	public ArrayList<Member> allMember() {
//		String query = "select * from member";
//		List list = jdbcTemplate.query(query, new MemberRowMapper());
//		return (ArrayList<Member>) list;
//	}
//
//
//	public int pwChangeMember(Member m) {
//		String query = "update member set member_pw=? where member_id=?";
//		Object[] params = {m.getMemberPw(), m.getMemberId()};
//		int result = jdbcTemplate.update(query, params);
//		return result;
//	}

	
	
}
