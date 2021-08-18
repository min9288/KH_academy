package kr.or.iei.member.controller;

import java.util.ArrayList;

import kr.or.iei.member.dao.MemberDao;
import kr.or.iei.member.view.MemberView;
import kr.or.iei.member.vo.Member;


public class MemberController {
	private MemberView view;
	private MemberDao dao;
	
	
	public MemberController() {
		super();
		view = new MemberView();
		dao = new MemberDao();	
	}
	
	public void main() {
		while(true) {
			int sel = view.showMenu();
			switch(sel) {
			case 1:
				selectAllMember();
				break;
			case 2:
				selectOneMember();
				break;
			case 3:
				selectMemberName();
				break;
			case 4:
				insertMember();
				break;
			case 5:
				updateMember();
				break;
			case 6:
				deleteMember();
				break;
			case 7:
//				login();
				break;
			case 0:
				exit();
				return;
			default:
				missWord();
				break;
			}
		}
	}
	
	public void selectAllMember() {
		ArrayList<Member> list = dao.selectAllMember();
		
		if(list.isEmpty()) {
			view.emptyMember();
		} else {
			view.selectAllMember(list);
		}
	}
	
	public void selectOneMember() {
		String memberId = view.getId("조회");
		Member m = dao.selectOneMember(memberId);
		
		if(m == null) {
			view.emptyMember();
		} else {
			view.selectOneMember(m);
		}
	}
	
	public void selectMemberName() {
		String memberName = view.getName();
		ArrayList<Member> list = dao.selectMemberName(memberName);
		if(list.isEmpty()) {
			view.emptyMember();
		} else {
			view.selectMemberName(list);
		}
	}
	
	public void insertMember() {
		String memberId = null;
		while(true) {
			memberId = view.getId("가입");
			Member m = dao.selectOneMember(memberId);
			if(m != null) {
				// 입력받은 아이디로 회원정보가 조회된 경우 -> 사용 중인 아이디
				view.existId();
			}else {
				// 입력받은 아이디로 회원정보가 조회가 안된경우 -> 사용 가능한 아이디
				break;
			}
		}
		// 비밀번호 ~ 나이 입력받아서 Member
		Member m = view.insertMember();
		m.setMemberId(memberId);
		int result = dao.insertMember(m);
		if (result > 0) {
			view.successMsg("가입");
		} else {
			view.failMsg("가입");
		}
		
//		String memberId_check = view.getId("가입"); 
//		
//		if(dao.selectOneMember(memberId_check) == null) {
//			Member m = view.insertMember(memberId_check);
//			int result = dao.insertMember(m);
//			if (result > 0) {
//				view.successMsg("가입");
//			} else {
//				view.failMsg("가입");
//			}
//			
//		} else {
//			view.existId();
//		}
	}
	
	public void updateMember() {
		String memberId = view.getId("수정");
		Member m = dao.selectOneMember(memberId);
		if(m != null) {
			Member updateMember = view.updateMember();
			updateMember.setMemberId(memberId);  // id, pw, addr, phone 4가지 정보 들어있음
			int result = dao.updateMember(updateMember);
			if (result > 0) {
				view.successMsg("수정");
			} else {
				view.failMsg("수정");
			}
		} else {
			view.emptyMember();
		}
	}
	
	public void deleteMember() {
		String memberId = view.getId("탈퇴");
		int result = dao.deleteMember(memberId);
		if (result > 0) {
			view.successMsg("탈퇴");
		} else {
			view.failMsg("탈퇴");
		}
	}
	
	public void exit(){
		view.exit();
	}
	
	public void missWord() {
		view.missWord();
	}
	
}


















