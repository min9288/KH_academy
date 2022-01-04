package kr.or.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public int insertMember(Member m) {
		return dao.insertMember(m);
	}

	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}
}
