package kr.or.iei.view;

import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.model.vo.Book;
import kr.or.iei.model.vo.Member;
import kr.or.iei.model.vo.Rent;

public class View {
	private Scanner sc;
	
	public View() {
		super();
		sc = new Scanner(System.in);
	}
	public void printMsg(String msg) {
		System.out.println(msg);
	}
	public int mainMenu() {
		System.out.println("\n------ KH 도서관 ------\n");
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		System.out.println("0. 종료");
		System.out.print("선택 > ");
		return sc.nextInt();
	}
	public String getId() {
		System.out.print("아이디 입력 : ");
		return sc.next();
	}
	public Member getMember() {
		Member m = new Member();
		System.out.print("비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		System.out.print("이름 입력 : ");
		m.setMemberName(sc.next());
		System.out.print("전화번호 입력[ex.010-0000-0000] : ");
		m.setMemberPhone(sc.next());
		System.out.print("회원 등급 입력[1.고객 / 2.직원] : ");
		m.setMemberLevel(sc.nextInt());
		return m;
	}
	public Member getLoginInfo() {
		Member m = new Member();
		System.out.print("아이디 입력 : ");
		m.setMemberId(sc.next());
		System.out.print("비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		return m;
	}
	public int memberMenu() {
		System.out.println("\n------ KH 도서관 ------\n");
		System.out.println("1. 책 빌리기");
		System.out.println("2. 내 대여정보 확인");
		System.out.println("3. 책 반납하기");
		System.out.println("4. 내 정보 보기");
		System.out.println("0. 로그아웃");
		System.out.print("선택 > ");
		return sc.nextInt();
	}
	public int managerMenu() {
		System.out.println("\n------ KH 도서관 관리 메뉴 ------\n");
		System.out.println("1. 책 현황 보기");
		System.out.println("2. 신규 책 등록");
		System.out.println("3. 전체 대여 현황");
		System.out.println("4. 전체 회원 정보 조회");
		System.out.println("0. 로그아웃");
		System.out.print("선택 > ");
		return sc.nextInt();
	}
	public Book getNewBookInfo() {
		System.out.println("\n------ KH 신규 책 등록 ------\n");
		Book b = new Book();
		System.out.print("장르 : ");
		sc.nextLine();
		b.setBookGenre(sc.nextLine());
		System.out.print("제목 : ");
		b.setBookName(sc.nextLine());
		System.out.print("소개 : ");
		b.setBookIntro(sc.nextLine());
		System.out.print("작성자 : ");
		b.setBookWriter(sc.nextLine());
		System.out.print("수량 : ");
		b.setBookStock(sc.nextInt());
		return b;
	}
	public void printBookList(ArrayList<Book> list) {
		System.out.println("\n------ KH 도서 현황 ------\n");
		System.out.println("책번호\t장르\t제목\t작가\t수량\t소개");
		for(Book b : list) {
			System.out.println(b.getBookNo()+"\t"+b.getBookGenre()+"\t"+b.getBookName()+"\t"+b.getBookWriter()+"\t"+b.getBookStock()+"\t"+b.getBookIntro());
		}
		
	}
	public int getNo(String str1, String str2) {
		System.out.print(str1+"할 "+str2+" 번호 입력 : ");
		return sc.nextInt();
	}
	public void myRentList(ArrayList<Rent> list) {
		System.out.println("\n------ 내 대여 현황 ------\n");
		System.out.println("대여번호\t제목\t대여일\t반납일\t상태");
		for(Rent r : list) {
			System.out.println(r.getRentNo()+"\t"+r.getBookName()+"\t"+r.getStartDate()+"\t"+r.getEndDate()+"\t"+r.getRentStatusStr());
		}
	}
	public void mypage(Member m) {
		System.out.println("회원번호 : "+m.getMemberNo());
		System.out.println("아이디 : "+m.getMemberId());
		System.out.println("비밀번호 : "+m.getMemberPw());
		System.out.println("이름 : "+m.getMemberName());
		System.out.println("전화번호 : "+m.getMemberPhone());
		System.out.println("회원등급 : "+m.getMemberLevelStr());
		System.out.println("미반납 책 수 : "+m.getRentCount());
		
	}
	public void printRentList(ArrayList<Rent> list) {
		System.out.println("\n------ 전체 대여 현황 ------\n");
		System.out.println("대여번호\t회원명\t제목\t대여일\t반납일\t상태");
		for(Rent r : list) {
			System.out.println(r.getRentNo()+"\t"+r.getMemberName()+"\t"+r.getBookName()+"\t"+r.getStartDate()+"\t"+r.getEndDate()+"\t"+r.getRentStatusStr());
		}
		
	}
	public void printMemberList(ArrayList<Member> list) {
		System.out.println("\n------ 전체 회원 정보 ------\n");
		System.out.println("회원번호\t아이디\t비밀번호\t이름\t전화번호\t미반납");
		for(Member m : list) {
			System.out.println(m.getMemberNo()+"\t"+m.getMemberId()+"\t"+m.getMemberPw()+"\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getRentCount());
		}
	}
	

}
