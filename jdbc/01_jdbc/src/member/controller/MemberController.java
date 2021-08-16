package member.controller;

import java.util.ArrayList;

import member.dao.MemberDao;
import member.view.MemberView;
import member.vo.Member;

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
				break;
			case 3:
				break;
			case 4:
				break;
			case 5:
				break;
			case 6:
				break;
			case 0:
				
				return;
			default:
				break;
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
}
