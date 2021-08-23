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
				break;
			case 3 :
				break;
			case 4 :
				insertMember();
				break;
			case 5 :
//				deleteMember1();
				deleteMember();
				break;
			case 0 :
				return;
			default :
				break;
			}
		}
	}
	
	public void selectAllMember() {
		ArrayList<Member> list = service.selectOneMember();
		view.selectAllMember(list);
	}
	
	public void insertMember() {
		
	}
	
	public void deleteMember1() {
		String memberId = view.getId("삭제");
		MemberDao dao = new MemberDao();
		// Member 테이블에서 삭제
		int result = dao.deleteMember1(memberId);
		if (result > 0) {
			result = dao.insertDelMember1(memberId);
		} 
		if(result > 0) {
			view.successMsg("삭제");
		} else {
			view.failMsg("삭제");;
		}
		
		// Del_Member 테이블에 데이터 추가
	}
	
	public void deleteMember() {
		String memberId = view.getId("삭제");
		int result = service.deleteMember(memberId);
		if (result > 0) {
			view.successMsg("삭제");
		} else {
			view.failMsg("삭제");
		}
	}
}




























