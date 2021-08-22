package kh.jdbc.member.view;

import java.util.ArrayList;
import java.util.Scanner;

import kh.jdbc.member.vo.Member;

public class MemberView {
	private Scanner sc;

	public MemberView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int mainMenu() {
		
		System.out.println("\n----- KH 커뮤니티 -----\n");
		System.out.println("1. 로그인");		
		System.out.println("2. 회원가입");		
		System.out.println("3. 프로그램 종료");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public Member loginInfo() {
		
		System.out.println("--------- 로그인 ---------");
		Member m = new Member();
		System.out.print("아이디 입력 : ");
		m.setMemberId(sc.next());
		System.out.print("비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		
		return m;
	}
	
	public int loginMenu() {
		
		System.out.println("--------- 마이페이지 ---------");
		System.out.println("1. 내 정보보기");
		System.out.println("2. 내 정보 수정");
		System.out.println("3. 로그아웃");
		System.out.println("4. 회원 탈퇴");
		System.out.println("5. 게시판가기");
		int loginSel = sc.nextInt();
		
		return loginSel;
	}
	
	public void searchMyInfo(Member loginMember) {
		
		System.out.println("회원번호 : " + loginMember.getMemberCode());
		System.out.println("아이디 : " + loginMember.getMemberId());
		System.out.println("비밀번호 : " + loginMember.getMemberPw() );
		System.out.println("이름 : " + loginMember.getMemberName() );
		System.out.println("나이 : " + loginMember.getMemberAge() );
		System.out.println("전화번호 : " + loginMember.getMemberPhone() );
	}
	
	public Member updateMember() {
		
		Member m = new Member();
		System.out.print("수정할 비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		System.out.print("수정할 이름 입력 : ");
		m.setMemberName(sc.next());
		System.out.print("수정할 전화번호 입력 : ");
		m.setMemberPhone(sc.next());
		
		return m;
	}
	
	public Member getMember() {

		System.out.println("비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.println("이름 입력 : ");
		String memberName = sc.next();
		System.out.println("나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.println("전화번호 입력 : ");
		String memberPhone = sc.next();
		Member m = new Member(memberPw, memberName, memberAge, memberPhone);
		
		return m;
		
// 번호, 아이디, 비밀번호, 이름, 나이, 전화번호
//		Member m = new Member();
//		System.out.println("비밀번호 입력 : ");
//		m.setMemberPw(sc.next());
//		System.out.println("이름 입력 : ");
//		m.setMemberName(sc.next());
//		System.out.println("나이 입력 : ");
//		m.setMemberAge(sc.nextInt());
//		System.out.println("전화번호 입력 : ");
//		m.setMemberPhone(sc.next());

//		return m;
	}
	
	
	
	public String getId(String str) {
		
		System.out.println(str + "할 아이디 입력 : ");
		String memberId = sc.next();
		
		return memberId;
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
	
	public void failLogin() {
		System.out.println("아이디 또는 비밀번호를 확인하세요.");
	}
	
	public void existId() {
		System.out.println("이미 사용 중인 아이디 입니다.");
	}
	
	public void failMsg(String str) {
		System.out.println(str + "실패");
	}
	
	public void logoutMsg() {
		System.out.println("로그아웃 하셨습니다, 메인메뉴로 돌아갑니다.");
	}
	
	public void goBackPage(String str) {
		System.out.println(str+"로 돌아갑니다.");
	}
	
	public void enableId() {
		System.out.println("사용 가능한 아이디 입니다.");
	}
	
	
	
}
