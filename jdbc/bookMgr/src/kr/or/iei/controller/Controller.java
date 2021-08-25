package kr.or.iei.controller;

import java.util.ArrayList;

import kr.or.iei.model.service.Service;
import kr.or.iei.view.View;
import kr.or.iei.model.vo.Book;
import kr.or.iei.model.vo.Member;
import kr.or.iei.model.vo.Rent;

public class Controller {
	private View view;
	private Service service;
	private Member login;
	public Controller() {
		super();		
		view = new View();
		service = new Service();
	}
	public void main() {
		while(true) {
			if(login == null) {
				switch(view.mainMenu()) {
				case 1:
					login();
					break;
				case 2:
					insertMember();
					break;
				case 0:
					view.printMsg("Bye~");
					return;		
				default :
					view.printMsg("잘못입력하셨습니다.");
					break;
				}
			}else {
				loginMenu();
			}
		}
	}
	public void login() {
		view.printMsg("\n------ 로그인 ------\n");
		Member m = view.getLoginInfo();
		login = service.selectOneMember(m);
		if(login != null) {
			view.printMsg("로그인 성공!!");
		}else {
			view.printMsg("아이디 또는 비밀번호를 확인하세요");
		}
	}
	public void insertMember() {
		view.printMsg("\n------ 회원가입 ------\n");
		String memberId = null;
		while(true) {
			memberId = view.getId();
			boolean result = service.idCheck(memberId);
			if(!result) {
				break;
			}else {
				view.printMsg("이미 사용중인 아이디 입니다.");
			}
		}		
		Member m = view.getMember();
		m.setMemberId(memberId);
		int result = service.insertMember(m);
		if(result>0) {
			view.printMsg("회원 가입 성공!!");			
		}else {
			view.printMsg("회원 가입 실패ㅠ");
		}
		
	}
	public void loginMenu() {
		if(login.getMemberLevel() == 1) {
			switch(view.memberMenu()) {
			case 1:
				rentBook();
				break;
			case 2:
				myRentInfo();
				break;
			case 3:
				returnBook();
				break;
			case 4:
				mypage();
				break;
			case 0:
				login = null;
				break;
			default :
				view.printMsg("잘못입력하셨습니다.");
				break;
			}
		}else if(login.getMemberLevel() == 2) {
			switch(view.managerMenu()) {
			case 1:
				selectBookList();
				break;
			case 2:
				insertBook();
				break;
			case 3:
				allRentInfo();
				break;
			case 4:
				allMemberInfo();
				break;
			case 0:
				login = null;
				break;
			default :
				view.printMsg("잘못입력하셨습니다.");
				break;
			}
		}
	}
	public void allMemberInfo() {
		//ArrayList<Member> list = service.selectAllMember();
		ArrayList<Member> list = service.selectAllMember1();
		view.printMemberList(list);
		
	}
	public void allRentInfo() {
		ArrayList<Rent> list = service.allRentInfo();
		if(list.isEmpty()) {
			view.printMsg("대여 정보가 없습니다");
		}else {
			view.printRentList(list);
		}
	}
	public void mypage() {
		//로그인을하고 -> 마이페이지요청 시 DB에서 데이터를 다시조회(미반납책 숫자 조회)
		//Member m = service.selectOneMember(login.getMemberNo());
		Member m = service.selectOneMember1(login.getMemberNo());
		view.mypage(m);
	}
	public void myRentInfo() {
		ArrayList<Rent> list = service.selectRentList(login.getMemberNo());
		if(list.isEmpty()) {
			view.printMsg("대여 이력이 없습니다.");
		}else {
			view.myRentList(list);
		}
	}
	public void insertBook() {
		Book b = view.getNewBookInfo();
		int result = service.insertBook(b);
		if(result>0) {
			view.printMsg("등록완료");
		}else {
			view.printMsg("등록실패");
		}
	}
	public void rentBook() {
		selectBookList();
		int bookNo = view.getNo("대여","책");
		Rent r = new Rent();
		r.setBookNo(bookNo);
		r.setMemberNo(login.getMemberNo());
		int result = service.rentBook(r);
		if(result == -2) {
			view.printMsg("책 번호를 확인해주세요.");
		}else if(result == -1) {
			view.printMsg("대여 가능 수량이 없습니다.");
		}else if(result>0) {
			view.printMsg("대여 완료");
		}else {
			view.printMsg("대여 실패");
		}
	}
	public void selectBookList() {
		ArrayList<Book> list = service.selectBookList();
		view.printBookList(list);
	}
	public void returnBook() {
		int rentNo = view.getNo("반납","대여");
		int result = service.returnBook(rentNo,login.getMemberNo());
		if(result == -1) {
			view.printMsg("대여 번호를 확인해주세요");
		}else if(result>0) {
			view.printMsg("반납 완료");
		}else {
			view.printMsg("반납 실패");
		}
	}
}
