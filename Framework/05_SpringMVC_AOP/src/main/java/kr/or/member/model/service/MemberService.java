package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.common.LogTest1;
import kr.or.common.LogTest2;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.PwChangeVO;

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
	
	@Transactional
	public int insertMember(Member m) {
		dao.insertMember(m);
		int result = dao.insertMember(m);
		return result;
	}

	public Member mypage(String memberId) {
		Member m = dao.mypage(memberId);
		return m;
	}
	
	@Transactional
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

	public int changePw(PwChangeVO pc) {
		// 1. 기존 비밀번호가 맞는지 확인
		Member m = new Member();
		m.setMemberId(pc.getMemberId());
		m.setMemberPw(pc.getOldPassword());
		Member member = dao.selectOneMember(m);
		if(member == null) {
			return -1;
		} else {
			m.setMemberPw(pc.getNewPassword());
			return dao.pwChangeMember(m);
		}
	}

	
	
}
