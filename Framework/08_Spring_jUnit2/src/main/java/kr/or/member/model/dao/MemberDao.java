package kr.or.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertMember(Member m) {
		return session.insert("member.insertMember",m);
	}

	public Member selectOneMember(Member m) {
		return session.selectOne("member.selectOneMember",m);
	}
	
}
