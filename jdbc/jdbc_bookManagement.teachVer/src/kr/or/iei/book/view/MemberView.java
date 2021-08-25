package kr.or.iei.book.view;

import java.util.Scanner;

import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class MemberView {
	private Scanner sc;

	public MemberView() {
		super();
		sc = new Scanner(System.in);
	}
	
	
	
	public int memberMenu() {
		
		System.out.println("\n----- KH 도서관 회원 메뉴 -----\n");
		System.out.println("1. 책 빌리기");		
		System.out.println("2. 내 대여정보 확인");		
		System.out.println("3. 책 반납하기");
		System.out.println("4. 내 정보 보기");
		System.out.println("0. 로그아웃");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public void myRentalInfo(Rental r) {
		System.out.println("\n---------------------- 내 대여 현황 ------------------------\n");
		System.out.println("대여번호\t제목\t\t대여일\t\t반납일\t\t상태");
		System.out.println(r.getRentalNo()+"\t"+r.getBookTitle()+"\t\t"+r.getRentalDate()+
					"\t\t"+r.getReturnDate()+"\t\t"+r.getStrRentalStatus());
	}
	
	public void myPage(Member m) {
		
		System.out.println("회원번호 : " + m.getMemberNo());
		System.out.println("아이디 : " + m.getMemberId());
		System.out.println("비밀번호 : " + m.getMemberPw() );
		System.out.println("이름 : " + m.getMemberName() );
		System.out.println("전화번호 : " + m.getMemberPhone() );
		System.out.println("회원등급 : " + m.getMemberGrade() );
		System.out.println("미반납 책 수 : " + m.getUnpaidBook() );
	}
	
	
	
	public int getBookNo() {
		System.out.println("대여할 책 번호 입력 : ");
		int bookNo = sc.nextInt();
		return bookNo;
	}
	
	public int getReturnNo() {
		System.out.println("반납할 책 번호 입력 : ");
		int returnNo = sc.nextInt();
		return returnNo;
	}
	
	public void exit() {
		System.out.println("프로그램을 종료합니다.");
	}
	
	public void missSelect() {
		System.out.println("잘 못 입력하셨습니다, 메뉴에 맞는 숫자를 입력해주세요.");
	}
	
	public void successMsg(String str) {
		System.out.println(str + "성공");
	}
	
	public void failMsg(String str) {
		System.out.println(str + "실패");
	}

	public void logoutMsg() {
		System.out.println("로그아웃 하셨습니다, 메인메뉴로 돌아갑니다.");
	}
	
	public void lackVolume() {
		System.out.println("대여 가능 수량이 없습니다.");
	}

	public void returnFailMsg() {
		System.out.println("대여 번호를 확인해주세요.");
	}
	
	
}
