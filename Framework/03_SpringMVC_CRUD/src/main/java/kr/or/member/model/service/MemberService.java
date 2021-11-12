package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}

	public int insertMember(Member m) {
		int result = dao.insertMember(m);
		return result;
	}

	public Member mypage(String memberId) {
		Member m = dao.mypage(memberId);
		return m;
	}

	public int updateMember(Member m) {
		int result = dao.updateMember(m);
		return result;
	}

	public ArrayList<Member> selectAllMember() {
		ArrayList<Member> list = dao.allMember();
		return list;
	}
	
}
