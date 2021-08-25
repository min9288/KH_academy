package controller;

import view.MainView;
import view.MemberView;
import view.StaffView;
import vo.Member;

public class BookingController {
	private Member login;
	private MainView mainView;
	private MemberView mView;
	private StaffView sView;
	
	public BookingController() {
		super();
		mainView = new MainView();
		mView = new MemberView();
		sView = new StaffView();
		login = null;
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
					return;
				default:
					
					break;
				}
			} else if (login.getMemberLevel() == 1){  // 고객
				while(true) {
					int sel = memberView.memberMenu();
					switch(sel) {
					case 1:
						break;
					case 2:
						break;
					case 3:
						break;
					case 4:
						break;
					case 0:
						return;
					default:
						break;
					}
				}
			} else if (login.getMemberLevel() == 2) {  // 직원
				while(true) {
					int sel = staffView.staffMenu();
					switch(sel) {
					case 1:
						break;
					case 2:
						break;
					case 3:
						break;
					case 4:
						break;
					case 0:
						return;
					default:
						break;
					}
				}
			}
		}
	}


	private void login() {
		
	}
	
	private void join() {
		
	}
}
