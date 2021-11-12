package kr.or.member.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberRowMapper;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Member selectOneMember(Member member) {
		// 1. PreparedStatement 방식으로 쿼리문작성
		String query = "select * from member where member_id=? and member_pw=?";
		// 2. 위치홀더에 대체되어야 할 값을 순서대로 Object배열로 생성
		Object[] params = {member.getMemberId(), member.getMemberPw()};
		// 3. 조회인경우
		// -> 매개변수 : 1) 쿼리문, 2) 위치홀더에 들어갈 값(Object[]), 3) 결과를 처리할 객체
		// 조회결과 갯수에 관계없이 무조건 List(java.util.List) 타입으로 리턴
		List list = jdbcTemplate.query(query, params, new MemberRowMapper());
		if(list.isEmpty()) {
			return null;
		} else {
			Member m = (Member)list.get(0);
			return m;
		}
		
	}

	public int insertMember(Member m) {
		String query = "insert into member values(?,?,?,?,to_char(sysdate, 'yyyy-mm-dd'))";
		Object[] params = {m.getMemberId(), m.getMemberPw(), m.getMemberName(), m.getAddress()};
		// insert, update, delete -> jdbcTemplate.update();
		int result = jdbcTemplate.update(query, params);
		return result;
	}

	public Member mypage(String memberId) {
		String query = "select * from member where member_id=?";
		Object[] params = {memberId};
		List list = jdbcTemplate.query(query, params, new MemberRowMapper());
		if(list.isEmpty()) {
			return null;
		} else {
			Member m = (Member)list.get(0);
			return m;
		}
	}

	public int updateMember(Member m) {
		String query = "update member set member_pw=?, address=? where member_id=?";
		Object[] params = {m.getMemberPw(), m.getAddress(), m.getMemberId()};
		int result = jdbcTemplate.update(query, params);
		return result;
	}
	
}
