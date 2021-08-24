package kr.or.iei.user.controller;

import kr.or.iei.user.model.service.UserService;
import kr.or.iei.user.view.UserView;
import kr.or.iei.user.vo.User;

public class UserController {
	private UserView userView;
	private UserService service;
	private User login;
	
	public UserController() {
		super();
		userView = new UserView();
		service = new UserService();
		login = null;
	}
	
	public void main() {
		while(true) {
			if(login == null) {
				int sel = userView.showMainMenu();
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
				while(login != null) {
					int sel = userView.loginMenu();
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
					case 5:
						break;
					default:
						missSelect();
						break;
					}
				}
			}
		}
	}
	

	public void login() {
		User u = userView.loginInfo();
		login = service.login(u);
		if(login != null) {
			userView.successMsg("로그인");
		} else {
			userView.failLogin();
		}
	}
	
	public void join() {
		String userId = null;
		while(true) {
			userId = userView.getId("가입");
			int count = service.checkId(userId);
			if(count > 0) {
				userView.existId();
			} else {
				userView.enableId();
				break;
			}
		}
		User u = userView.getUser();
		u.setUserId(userId);
		int result = service.join(u);
		if (result > 0) {
			userView.successMsg("가입");
		} else {
			userView.failMsg("가입");
		}
	}
	
	public void myPage() {
		userView.searchMyInfo(login);
	}
	
	public void updateMyInfo() {
		User u = userView.updateUser();
		u.setUserId(login.getUserId());
		int result = service.updateMyInfo(u);
		if (result > 0) {
			userView.successMsg("수정");
		} else {
			userView.failMsg("수정");
		}
	}
	
	private void deleteMyAccount() {
		int result = service.deleteMyAccount(login.getUserId());
		if (result > 0) {
			logout();
			userView.successMsg("탈퇴");
		} else {
			userView.failMsg("탈퇴");
		}
	}
	
	public void logout() {
		login = null;
		userView.logoutMsg();
	}
	
	public void exit() {
		userView.exit();
	}
	
	public void missSelect() {
		userView.missSelect();
	}
	
}























