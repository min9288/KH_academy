package kh.jdbc.member.controller;

import kh.jdbc.member.dao.MemberDao;
import kh.jdbc.member.view.MemberView;
import kh.jdbc.member.vo.Member;

public class MemberController {
	private MemberView view;
	private MemberDao dao;
	private Member login;
	
	public MemberController() {
		super();
		view = new MemberView();
		dao = new MemberDao();
		login = null;
	}
	
	public void main() {
		while(true) {
			if (login == null) {
				int sel = view.mainMenu();
				switch (sel) {
				case 1:
					login();
					break;
				case 2:
					join();
					break;
				case 3:
					exit();
					return;
				default:
					missSelect();
					break;
				}
			} else {
				int sel = view.loginMenu();
				switch(sel) {
				case 1:
					myPage();
					break;
				case 2:
					updateMyInfo();
					break;
				case 3:
					logout();
					break;
				case 4:
					deleteMyAccount();
					break;
				default:
					missSelect();
					break;
				}
			}
		}
	}
	
	public void login() {
		Member m = view.loginInfo();
		login = dao.searchMember(m);
		if(login != null) {
			view.successMsg("로그인");
		} else {
			view.failLogin();
		}
	}
	
	public void join() {
		String memberId = null;
		while(true) {
			memberId = view.getId("가입");
			/*
			// 1)  정수로 결과를 받는 방법 (사용가능하면 0 / 사용중이면 1)			
			int conut = dao.checkId(memberId);
			if (conut > 0) {
				view.existId();
			} else {
				view.enableId();
				break;
			}
			*/
			
			// 2) 논리형으로 중복체크결과를 받는 방법
			boolean result = dao.checkId1(memberId);
			if(result) {
				view.existId();
			} else {
				view.enableId();
				break;
			}
		}
		Member m = view.getMember();
		m.setMemberId(memberId);
		int result = dao.insertMember(m);
		if(result > 0) {
			view.successMsg("가입");
		} else {
			view.failMsg("가입");
		}
		
	}
	
	public void updateMyInfo() {
		
		Member updateMember = view.updateMember();
		updateMember.setMemberId(login.getMemberId());
		int result = dao.updateMyInfo(updateMember);
		if (result > 0) {
			updateMember.setMemberId(login.getMemberId());
			login = dao.searchMember(updateMember);
			view.successMsg("수정");
		} else {
			view.failMsg("수정");
		}
	}
	
	public void deleteMyAccount() {
		int result = dao.deleteMyAccount(login.getMemberCode());
		if(result > 0) {
			logout();
			view.successMsg("탈퇴");
		} else {
			view.failMsg("탈퇴");
		}
		
	}
	
	public void myPage() {
		view.searchMyInfo(login);
	}
	
	public void logout() {
		login = null;
		view.goBackMain();
	}
	
	public void exit() {
		view.exit();
	}
	
	public void missSelect() {
		view.missSelect();
	}
}
