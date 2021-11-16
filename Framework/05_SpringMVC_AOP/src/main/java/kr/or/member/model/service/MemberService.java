package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.LogTest1;
import kr.or.common.LogTest2;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	
	public Member login2(String memberId, String memberPw) {
		Member m = dao.login2(memberId, memberPw);
		return m;
	}

	public Member selectOneMember(Member member) {
		System.out.println("로그인 서비스 시작");
		Member m = dao.selectOneMember(member);
		System.out.println("로그인 서비스 끝");
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

	public Member selectOneMember(String memberId) {
		return dao.mypage(memberId);
	}

	public int updatePw(String exPw, String changePw, String memberId) {
		int result = dao.updatePw(exPw, changePw, memberId);
		return result;
	}

	
	
}
