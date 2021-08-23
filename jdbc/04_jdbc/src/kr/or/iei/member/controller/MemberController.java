package kr.or.iei.member.controller;

import java.util.ArrayList;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.view.MemberView;


public class MemberController {
	private MemberView view;
	private MemberService service;
	public MemberController() {
		super();
		view = new MemberView();
		service = new MemberService();
	}
	
	public void main() {
		while(true) {
			int sel = view.showMenu();
			switch (sel) {
			case 1 :
				selectAllMember();
				break;
			case 2 :
				selectOneMember();
				break;
			case 3 :
				selectOneMemberName();
				break;
			case 4 :
				insertMember();
				break;
			case 5 :
				updateMember();
				break;
			case 6 :
				deleteMember();
				break;
			case 0 :
				exit();
				return;
			default :
				missWord();
				break;
			}
		}
	}
	
	public void selectAllMember() {
		ArrayList<Member> list = service.selectAllMember();
		view.selectAllMember(list);
	}
	
	public void selectOneMember() {
		String memberId = view.getId("조회");
		Member m = service.selectOneMember(memberId);
		if(m != null) {
			view.successMsg("조회");
			view.selectOneMember(m);
		} else {
			view.failMsg("조회");
		}
	}
	
	public void selectOneMemberName() {
		String memberName = view.getName();
		Member m = service.selectOneMemberName(memberName);
		if(m != null) {
			view.successMsg("조회");
			view.selectOneMember(m);
		} else {
			view.failMsg("조회");
		}
	}
	
	public void insertMember() {
		String memberId = null;
		while(true) {
			memberId = view.getId("가입");
			Member m = service.selectOneMember(memberId);
			if(m == null) {
				break;
			} else {
				view.existId();
			}
		}
		Member m = view.insertMember();
		m.setMemberId(memberId);
		int result = service.insertMember(m);
		if(result > 0) {
			view.successMsg("가입");
		} else {
			view.failMsg("가입");
		}
	}
	
	public void updateMember() {
		String memberId = view.getId("수정");
		Member m = service.selectOneMember(memberId);
		if (m != null) {
			Member member = view.updateMember();
			member.setMemberId(memberId);
			int result = service.updateMember(member);
			if(result > 0) {
				view.successMsg("수정");
			} else {
				view.failMsg("수정");
			}
		} else {
			view.emptyMember();
		}
		
	}
	
	public void deleteMember() {
		String memberId = view.getId("삭제");
		Member m = service.selectOneMember(memberId);
		if (m != null) {
			int result = service.deleteMember(memberId);
			if(result > 0) {
				view.successMsg("삭제");
			} else {
				view.failMsg("삭제");
			}
		} else {
			view.emptyMember();
		}
	}
	
	public void exit() {
		view.exit();
	}
	
	public void missWord() {
		view.missWord();
	}
	
}




























