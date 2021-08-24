package kr.or.iei.book.view;

import java.util.Scanner;

import kr.or.iei.book.vo.Member;

public class MainView {
	private Scanner sc;

	public MainView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int showMainMenu() {
		
		System.out.println("\n----- KH 도서관 -----\n");
		System.out.println("1. 로그인");		
		System.out.println("2. 회원가입");		
		System.out.println("3. 프로그램 종료");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public Member loginInfo() {
		System.out.println("--------- 로그인 ---------");
		Member u = new Member();
		System.out.print("아이디 입력 : ");
		u.setMemberId(sc.next());
		System.out.print("비밀번호 입력 : ");
		u.setMemberPw(sc.next());
		
		return u;
	}
	
	public String getId(String str) {
		System.out.print(str + "할 아이디 입력 : ");
		String memberId = sc.next();
		
		return memberId;
	}
	
	public Member getUser() {
		int memberGrade = 0; 
		
		System.out.println("--------- 회원가입 ---------");
		System.out.print("비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("이름 입력 : ");
		String memberName = sc.next();
		System.out.print("전화번호 입력 (010-0000-0000) : ");
		String memberPhone = sc.next();
		while(true) {
			System.out.print("등급 입력 [ 1.고객 / 2.직원 ] : ");
			int temp = sc.nextInt();
			if(temp != 1 || temp != 2) {
				System.out.println("잘 못 입력하셨습니다, 다시 입력하세요.");
				continue;
			} else {
				memberGrade = temp;
				break;
			}
			
		}
		Member m = new Member(memberPw, memberName, memberPhone, memberGrade);
		return m;
	}
	
	public void successMsg(String str) {
		System.out.println(str + "성공");
	}
	
	public void failMsg(String str) {
		System.out.println(str + "실패");
	}
	
	public void missSelect() {
		System.out.println("잘 못 입력하셨습니다, 메뉴에 맞는 숫자를 입력해주세요.");
	}
	
	public void failLogin() {
		System.out.println("아이디 또는 비밀번호를 확인하세요.");
	}
	
	public void enableId() {
		System.out.println("사용 가능한 아이디 입니다.");
	}
	
	public void existId() {
		System.out.println("이미 사용 중인 아이디 입니다.");
	}
	
	public void exit() {
		System.out.println("프로그램을 종료합니다.");
	}
}
