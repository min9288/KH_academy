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

		System.out.print("비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("이름 입력 : ");
		String memberName = sc.next();
		System.out.print("나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.print("전화번호 입력 : ");
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
	
	public int boardMenu() {
		
		System.out.println("--------- KH 게시판 ---------");
		System.out.println("1. 게시물 목록 보기");
		System.out.println("2. 게시물 상세보기");
		System.out.println("3. 게시물 작성");
		System.out.println("4. 게시글 수정");
		System.out.println("5. 게시글 삭제");
		System.out.println("6. 이전 메뉴로 돌아가기");
		System.out.println("0. 메인메뉴로 돌아가기");
		int sel_b = sc.nextInt();
		
		return sel_b;
	}
	
	public void postingList(ArrayList<Member> list) {
		
		System.out.println("--------- KH 게시글 목록 ---------");
		System.out.println("글번호\t제목\t작성자\t조회수\t작성일");
		
		for(Member posting : list) {
			System.out.println(posting.getBoardNo()+"\t"+posting.getBoardTitle()+"\t"
					+posting.getBoardWriterString()+"\t"+posting.getReadCount()+"\t"+posting.getEnrollDate());
		}
	}
	
	public void viewPostingDetails(Member b) {
		System.out.println("글 번호 : "+b.getBoardNo());
		System.out.println("제목 : "+b.getBoardTitle());
		System.out.println("내용 : "+b.getBoardContent());
		System.out.println("작성자 : "+b.getMemberName());
		System.out.println("조회수 : "+b.getReadCount());
		System.out.println("작성일 : "+b.getEnrollDate());
	}

	public Member createPosting() {
		Member m = new Member();
		System.out.println("--------- KH 게시글 작성 ---------");
		System.out.print("제목 입력: ");
		sc.nextLine();
		m.setBoardTitle(sc.nextLine());
		System.out.print("내용 입력: ");
		m.setBoardContent(sc.nextLine());
		
		return m;
	}
	
	public Member updatePosting() {
		
		Member up = new Member();
		System.out.print("수정할 제목 입력 : ");
		sc.nextLine();
		up.setBoardTitle(sc.nextLine());
		System.out.print("수정할 내용 입력 : ");
		up.setBoardContent(sc.nextLine());
		
		return up;
	}
	
	public String getId(String str) {
		
		System.out.println(str + "할 아이디 입력 : ");
		String memberId = sc.next();
		
		return memberId;
	}
	
	public int getNo(String str) {
		
		System.out.println(str + "글 번호 입력 : ");
		int postingNo = sc.nextInt();
		
		return postingNo;
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
	
	public void emptyPosting() {
		System.out.println("등록된 게시글이 없습니다.");
	}
	
}
