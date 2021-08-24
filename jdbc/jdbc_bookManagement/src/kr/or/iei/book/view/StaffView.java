package kr.or.iei.book.view;

import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;


public class StaffView {
	private Scanner sc;

	public StaffView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int staffMenu() {
		
		System.out.println("\n----- KH 도서관 관리 메뉴 -----\n");
		System.out.println("1. 책 현황 보기");		
		System.out.println("2. 신규 책 등록");		
		System.out.println("3. 전체 대여 현황");
		System.out.println("4. 전체 회원 정보 조회");
		System.out.println("0. 로그아웃");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public void showBookList(ArrayList<Book> list) {
		System.out.println("\n---------------------- KH 도서 현황 ------------------------\n");
		System.out.println("책번호\t장르\t제목\t\t작가\t\t수량\t소개");
		for(Book b : list) {
			System.out.println(b.getBookNo()+"\t"+b.getBookGenre()+"\t"+b.getBookTitle()+
					"\t\t"+b.getBookAuthor()+"\t\t"+b.getBookVolume()+"\t"+ b.getBookIntro());
		}
	}
	
	public Book regLatestBook() {
		Book b = new Book();
		System.out.println("\n----- KH 신규 책 등록 -----\n");
		System.out.print("장르 : ");
		b.setBookGenre(sc.next());
		System.out.print("제목 : ");
		sc.nextLine();
		b.setBookTitle(sc.nextLine());
		System.out.print("소개 : ");
		b.setBookIntro(sc.nextLine());
		System.out.print("작가 : ");
		b.setBookAuthor(sc.next());
		System.out.print("수량 : ");
		b.setBookVolume(sc.nextInt());
		return null;
	}
	
	public void rentalStatus(ArrayList<Rental> list) {
		System.out.println("\n---------------------- 전체 대여 현황 ------------------------\n");
		System.out.println("대여번호\t회원명\t\t제목\t\t대여일\t\t반납일\t\t상태");
		for(Rental r : list) {
			System.out.println(r.getRentalNo()+"\t"+r.getMemberName()+"\t\t"+r.getBookTitle()+
					"\t"+r.getRentalDate()+"\t\t"+r.getReturnDate()+"\t\t"+ r.getStrRentalStatus());
		}
	}
	
	public void showAllMemberInfo(ArrayList<Member> list) {
		System.out.println("\n---------------------- 전체 회원 정보 ------------------------\n");
		System.out.println("회원번호\t아이디\t\t비밀번호\t이름\t\t전화번호\t\t미반납");
		for(Member m : list) {
			System.out.println(m.getMemberNo()+"\t"+m.getMemberId()+"\t\t"+m.getMemberPw()+
					"\t"+m.getMemberName()+"\t\t"+m.getMemberPhone()+"\t\t"+ m.getUnpaidBook());
		}
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

}
