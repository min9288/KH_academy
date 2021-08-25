package view;

import java.util.Scanner;

import vo.Member;

public class MainView {
	private Scanner sc;
	
	public MainView() {
		super();
		sc = new Scanner(System.in);
	}

	public void printMsg(String msg) {
		System.out.println(msg);
	}
	
	public int showMainMenu() {
		System.out.println("----- KH 호텔 -----");
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		return sc.nextInt();
	}

	public Member loginInfo() {
		System.out.println("-----KH 호텔 로그인 -----");
		Member m = new Member();
		System.out.print("아이디 입력 : ");
		m.setMemberId(sc.next());
		System.out.print("비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		return m;
	}

	public String getId() {
		System.out.println("----- KH 호텔 회원가입 -----");
		System.out.print("아이디 입력 : ");
		return sc.next();
	}

	public Member getMember() {
		Member m = new Member();
		System.out.print("비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		System.out.print("이름 입력 : ");
		m.setMemberName(sc.next());
		System.out.print("전화번호 입력 : ");
		m.setMemberPhone(sc.next());
		System.out.print("주소 입력 : ");
		sc.nextLine();
		m.setMemberAddr(sc.nextLine());
		System.out.print("회원 등급 입력[1.고객 / 2.직원] : ");
		m.setMemberLevel(sc.nextInt());
		return m;
	}
	
	public void missSelect() {
		System.out.println("잘 못 입력하셨습니다, 메뉴에 맞는 숫자를 입력해주세요.");
	}
}
