package kr.or.iei.book.controller;

import java.util.ArrayList;

import kr.or.iei.book.model.dao.MemberDao;
import kr.or.iei.book.model.service.MemberService;
import kr.or.iei.book.view.MemberView;
import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class MemberController {
	private int memberNo;
	private MemberView memberView;
	private MemberService memberService;
	private MemberDao memberDao;
	
	
	public MemberController() {
		super();
		memberView = new MemberView();
		memberService = new MemberService();
		memberDao = new MemberDao();
	}

	public void main(int memberNo) {
		this.memberNo = memberNo;
		while(true) {
			int sel = memberView.memberMenu();
			switch(sel) {
			case 1:
				rentalBook();
				break;
			case 2:
				myRentalInfo();
				break;
			case 3:
				returnBook();
				break;
			case 4:
				myPage();
				break;
			case 0:
				logout();
				return;
			default:
				missSelect();
				break;
			}
		}
	}
	
	public void rentalBook() {
		StaffController.showBookList();
		 int bookNo = memberView.getBookNo();
		 int count = memberService.checkBookVolume(bookNo);
		 if(count > 0) {
			 int result = memberService.rentalBook(bookNo, memberNo);
			 if(result > 0) {
				 memberView.successMsg("대여");
			 } else {
				 memberView.failMsg("대여");
			 }
		 } else {
			 memberView.lackVolume();
		 }
	}
	
	public void myRentalInfo() {
		Rental r = memberService.myRentalInfo(memberNo);
		memberView.myRentalInfo(r);
	}
	
	public void returnBook() {
		int returnNo = memberView.getReturnNo();
		int count = memberService.checkReturnNo(returnNo);
		if(count > 0) {
			int result = memberService.returnBook(returnNo);
			if(result > 0) {
				 memberView.successMsg("반납");
			 } else {
				 memberView.failMsg("반납");;
			 }
		} else {
			memberView.returnFailMsg();
		}
		
	}
	
	public void myPage() {
		Member m = memberService.myPage(memberNo);
		memberView.myPage(m);
	}
	
	public void logout() {
		memberView.logoutMsg();
	}
	
	public void missSelect() {
		memberView.missSelect();
	}
}
