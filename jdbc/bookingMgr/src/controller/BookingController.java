package controller;

import java.util.ArrayList;

import service.MainService;
import service.MemberService;
import service.StaffService;
import view.MainView;
import view.MemberView;
import view.StaffView;
import vo.Accommodation;
import vo.Member;
import vo.Reservation;

public class BookingController {
	private Member login;
	private MainView mainView;
	private MemberView mView;
	private StaffView sView;
	private MemberService mService;
	private StaffService sService;
	private MainService mainService;
	
	public BookingController() {
		super();
		mainView = new MainView();
		mView = new MemberView();
		sView = new StaffView();
		mService = new MemberService();
		sService = new StaffService();
		mainService = new MainService();
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
				case 0:
					mainView.printMsg("프로그램이 종료되었습니다.");
					return;
				default:
					missSelect();
					break;
				}
			} else if (login.getMemberLevel() == 1){  // 고객
				while(login != null) {
					int sel = mView.memberMenu();
					switch(sel) {
					case 1:
						reservation();
						break;
					case 2:
						myReservationInfo();
						break;
					case 3:
						cancelReservation();
						break;
					case 4:
						mypage();
						break;
					case 5:
						logout();
						break;
					default:
						missSelect();
						break;
					}
				}
			} else if (login.getMemberLevel() == 2) {  // 직원
				while(login != null) {
					int sel = sView.staffMenu();
					switch(sel) {
					case 1:
						selectAllAcc();
						break;
					case 2:
						insertAcc();
						break;
					case 3:
						deleteAcc();
						break;
					case 4:
						selectAllRes();
						break;
					case 5:
						selectAllUser();
						break;
					case 0:
						logout();
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
		Member m = mainView.loginInfo();
		login = mainService.selectOneMember(m);
		if(login != null) {
			mainView.printMsg("로그인 성공~!");
		} else {
			mainView.printMsg("아이디 또는 비밀번호를 다시 입력하세요.");
		}
	}
	
	public void join() {
		String memberId = null;
		while(true) {
			memberId = mainView.getId();
			boolean result = mainService.idCheck(memberId);
			if(!result) {
				break;
			} else {
				mainView.printMsg("이미 사용중인 아이디 입니다");
			}
		}
		
		Member m = mainView.getMember();
		m.setMemberId(memberId);
		int result = mainService.insertMember(m);
		if(result>0) {
			mainView.printMsg("회원 가입 성공~!");
		} else {
			mainView.printMsg("회원 가입 실패ㅠㅠ");
		}
	}
	
	private void selectAllUser() {
		ArrayList<Member>memList = sService.selectAllMember();
		sView.selectAllMem(memList);
	}


	private void selectAllRes() {
		ArrayList<Reservation>resList = sService.selectAllRes();
		sView.selectAllRes(resList);
	}


	private void deleteAcc() {
		int acc = sView.deleteAcc();
		int result = sService.deleteAcc(acc);
		if(result>0) {
			sView.printMsg("삭제 성공");
		}else {
			sView.printMsg("삭제 실패");
		}
		
	}


	private void insertAcc() {
		Accommodation acc = sView.insertAcc();
		int result = sService.insertAcc(acc);
		if(result>0) {
			sView.printMsg("등록 성공");
		}else {
			sView.printMsg("등록 실패");
		}
		
	}


	private void selectAllAcc() {
		ArrayList<Accommodation>accList = sService.selectAccList();
		sView.selectAllAcc(accList);
		
	}
	
	public void reservation() {
		selectAllAcc();
		Reservation r = mView.getResInfo();
		int result = mService.reservation(r, login.getMemberNo());
		if(result>0) {
			mView.successMsg("예약");
		}else {
			mView.failMsg("예약");
		}
	}
	
	public void cancelReservation() {
		myReservationInfo();
		int resNo = mView.getNo();
		int result = mService.cancelReservation(resNo);
		if(result > 0) {
			mView.successMsg("취소");
		}else {
			mView.failMsg("취소");
		}
	}
	
	public void mypage() {
		Member m = mService.mypage(login.getMemberNo());
		mView.mypage(m);
	}
	
	public void myReservationInfo() {
		ArrayList<Reservation> list = mService.myReservationInfo(login.getMemberNo());
		mView.myReservationInfo(list);
	}
	
	public void logout() {
		login = null;
		mView.logoutMsg();
	}
	
	public void missSelect() {
		mainView.missSelect();
	}
	

	
}
