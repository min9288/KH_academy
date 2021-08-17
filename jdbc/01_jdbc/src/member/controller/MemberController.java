package member.controller;

import java.util.ArrayList;

import member.dao.MemberDao;
import member.view.MemberView;
import member.vo.Member;

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
			if(loginMember == null) {
				int sel = view.showMenu();
				switch(sel) {
				case 1:
					selectAllMember();
					break;
				case 2:
					selectOneMember();
					break;
				case 3:
					selectNameMember();
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
					login();
					break;
				case 0:
					exit();
					return;
				default:
					missWord();
					break;
				}
			} else {
				int sel = view.loginMenu(loginMember.getMemberName());
				switch(sel) {
				case 1:
//					myPage();
					break;
				case 2:
					logout();
					break;
				case 3:
//					memberWithdrawal
					break;
					
				}
			}
		}
	}
	public void selectAllMember() {
		// 1. dao를 통해서 전체회원 목록을 가지고옴 (회원 인원수를 모르니, ArrayList를 리턴)
		ArrayList<Member> list = dao.selectAllMember();
		// 2. 조회된 list를 view를 통해서 출력
		// if(list.size() == 0) {
		if(list.isEmpty()) {
			view.emptyMember();
		}else {
			view.selectAllMember(list);
		}
	}
	public void selectOneMember() {
		// 1. view를 통해서 아이디 입력받기
		String memberId = view.getId("조회");
		// 2. dao를 통해서 DB에서 해당 회원 정보를 조회
		Member m = dao.selectOneMember(memberId);
		// 3. 회원정보가 있는 경우 view를 통해 회원정보 출력
		if (m == null) {
			view.emptyMember();
		}else {
			view.selectOneMember(m);
		}
	}
	public void selectNameMember() {
		String memberName = view.getName();
		ArrayList<Member> list = dao.selectNameMember(memberName);
		if(list.isEmpty()) {
			view.emptyMember();
		}else {
			view.selectNameMember(list);
		}
	}
	public void insertMember() {
		Member m = view.getMember();
		int result = dao.insertMember(m);
		if(result > 0) {
			view.successMsg();
		} else {
			view.failMsg();
		}
	}
	
	public void updateMember() {
		String memberId = view.getId("수정");
		Member m = dao.selectOneMember(memberId);
		if(m == null) {
			view.emptyMember();
		} else {
			Member updateMember = view.updateMember();
		//	int result = dao.updateMember(updateMember, memberId);
			updateMember.setMemberId(memberId);
			int result = dao.updateMember(updateMember);
			// 비밀번호, 주소, 전화번호
			// update member set member_pw = 수정값, member_addr = 수정값, member_phone = 수정값 where member_id = 아이디값;
			if(result > 0) {
				view.successMsg();
			} else {
				view.failMsg();
			}
		}
	}
	
	public void deleteMember() {
		String memberId = view.getId("탈퇴");
		int result = dao.deleteMember(memberId);
		if(result > 0) {
			view.successMsg();
		} else {
			view.failMsg();
		}
	}
	
	public void login() {
		// 1. 아이디, 비밀번호 입력받기
		Member m = view.loginInfo();
		loginMember = dao.login(m);
		if(loginMember != null) {
			view.successMsg();
		} else {
			view.failMsg();
		}
	}
	
	public void logout() {
		loginMember = null;
	}
	
	public void exit() {
		view.exit();
	}
	
	public void missWord() {
		view.missWord();
	}
}
