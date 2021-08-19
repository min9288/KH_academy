package kh.jdbc.member.controller;

import kh.jdbc.member.dao.MemberDao;
import kh.jdbc.member.view.MemberView;
import kh.jdbc.member.vo.Member;

public class MemberController {
	private MemberView view;
	private MemberDao dao;
	private Member loginMember;
	
	public MemberController() {
		super();
		view = new MemberView();
		dao = new MemberDao();
		loginMember = null;
	}
	
	public void main() {
		while(true) {
			int sel = view.mainMenu();
			switch(sel) {
			case 1:
				login();
				while(loginMember != null) {
					int loginSel = view.loginMenu();
					switch (loginSel) {
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
				break;
			case 2:
				insertMember();
				break;
			case 3:
				exit();
				return;
			default:
				missSelect();
				break;
			}
		}
	}
	
	public void login() {
		Member m = view.loginInfo();
		loginMember = dao.login(m);
		if(loginMember != null) {
			view.successMsg("로그인");
		} else {
			view.failLogin();
		}
	}
	
	public void insertMember() {
		String memberId = null;
		while(true) {
			memberId = view.getId("가입");
			Member m = dao.searchMember(memberId);
			if (m != null) {
				view.existId();
			} else {
				break;
			}
		}
		Member m = view.insertMember();
		m.setMemberId(memberId);	
		int result = dao.insertMember(m);
		if (result > 0) {
			view.successMsg("가입");
		} else {
			view.failMsg("가입");
		}
	}
	
	public void updateMyInfo() {
		
		Member updateMember = view.updateMember();
		int result = dao.updateMyInfo(updateMember);
		if (result > 0) {
			view.successMsg("수정");
		} else {
			view.failMsg("수정");
		}
	}
	
	public void deleteMyAccount() {
		int result = dao.deleteMyAccount();
		if(result > 0) {
			view.successMsg("탈퇴");
		} else {
			view.failMsg("탈퇴");
		}
		loginMember = null;
	}
	
	public void myPage() {
		view.searchMyInfo(loginMember);
	}
	
	public void logout() {
		loginMember = null;
		view.goBackMain();
	}
	
	public void exit() {
		view.exit();
	}
	
	public void missSelect() {
		view.missSelect();
	}
}
