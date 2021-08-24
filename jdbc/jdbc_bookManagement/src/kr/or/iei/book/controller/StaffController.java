package kr.or.iei.book.controller;

import java.util.ArrayList;

import kr.or.iei.book.model.dao.StaffDao;
import kr.or.iei.book.model.service.MemberService;
import kr.or.iei.book.model.service.StaffService;
import kr.or.iei.book.view.MemberView;
import kr.or.iei.book.view.StaffView;
import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class StaffController {
	private int memberNo;
	private static StaffView staffView;
	private static StaffService staffService;
	
	
	
	public StaffController() {
		super();
		staffView = new StaffView();
		staffService = new StaffService();
	}

	public void main (int memberNo) {
		this.memberNo = memberNo;
		while(true) {
			int sel = staffView.staffMenu();
			switch(sel) {
			case 1:
				showBookList();
				break;
			case 2:
				regLatestBook();
				break;
			case 3:
				rentalStatus();
				break;
			case 4:
				showAllMemberInfo();
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
	
	public static void showBookList() {
		ArrayList<Book> list = staffService.showBookList();
		staffView.showBookList(list);
	}
	
	public void regLatestBook() {
		Book b = staffView.regLatestBook();
		int result = staffService.regLatestBook(b);
		if(result > 0) {
			staffView.successMsg("등록");
		} else {
			staffView.failMsg("등록");
		}
	}
	
	public void rentalStatus() {
		ArrayList<Rental> list = staffService.rentalStatus();
		staffView.rentalStatus(list);
	}
	
	public void showAllMemberInfo() {
		ArrayList<Member> list = staffService.showAllMemberInfo();
		staffView.showAllMemberInfo(list);
	}
	
	public void logout() {
		staffView.logoutMsg();
	}
	
	public void missSelect() {
		staffView.missSelect();
	}
	
}
