package kr.or.iei.book.controller;

import kr.or.iei.book.model.service.MainMenuService;
import kr.or.iei.book.model.service.MemberService;
import kr.or.iei.book.view.MainView;
import kr.or.iei.book.view.MemberView;
import kr.or.iei.book.view.StaffView;
import kr.or.iei.book.vo.Member;

public class BookController {
	private MainView mainView;
	private MainMenuService mainService;
	private Member login;
	private MemberController mc;
	private StaffController sc;
	
	public BookController() {
		super();
		mainView = new MainView();
		mainService = new MainMenuService();
		mc = new MemberController();
		login = null;
		sc = new StaffController();
	}
	
	public void main() {
		while(true) {
			if (login == null) {
				int sel = mainView.showMainMenu();
				switch(sel) {
				case 1:
					login();
					break;
				case 2:
					join();
					break;
				case 3:
					exit();
					break;
				default:
					missSelect();
					break;
				}
			} else if (login.getMemberGrade() == 1){  // 고객
				mc.main(login.getMemberNo());
			} else if (login.getMemberGrade() == 2) {  // 직원
				sc.main(login.getMemberNo());
			}
		}
	}
	
	public void login() {
		Member m = mainView.loginInfo();
		login = mainService.login(m);
		if(login != null) {
			mainView.successMsg("로그인");
		} else {
			mainView.failLogin();
		}
	}
	
	public void join() {
		String memberId = null;
		while(true) {
			memberId = mainView.getId("가입");
			int count = mainService.checkId(memberId);
			if(count > 0) {
				mainView.existId();
			} else {
				mainView.enableId();
				break;
			}
			Member m = mainView.getUser();
			m.setMemberId(memberId);
			int result = mainService.join(m);
			if (result > 0) {
				mainView.successMsg("가입");
			} else {
				mainView.failMsg("가입");
			}
		}
	}
	
	public void exit() {
		mainView.exit();
	}
	
	public void missSelect() {
		mainView.missSelect();
	}
		
}
