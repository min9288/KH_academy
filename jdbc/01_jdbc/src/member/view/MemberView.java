package member.view;

import java.util.ArrayList;
import java.util.Scanner;

import member.vo.Member;

public class MemberView {
	private Scanner sc;

	public MemberView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public String getId(String str) {
		System.out.print(str + "할 아이디 입력 : ");
		String memberId = sc.next();
		return memberId;
	}
	
	public String getName() {
		System.out.print("조회할 이름 입력 : ");
		String memberName = sc.next();
		return memberName;
	}
	
	public int showMenu() {
		System.out.println("\n----------- 회원 관리 프로그램 -----------\n");
		System.out.println("1. 전체 회원 조회");		// SELECT
		System.out.println("2. 아이디로 회원 조회");		// SELECT
		System.out.println("3. 이름으로 회원 조회");		// SELECT
		System.out.println("4. 회원 가입");			// INSERT
		System.out.println("5. 회원 정보 변경");		// UPDATE
		System.out.println("6. 회원 탈퇴");			// DELETE
		System.out.println("7. 로그인");
		System.out.println("0. 프로그램 종료");			// 프로그램 종료
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		return sel;
	}
	
	public void selectAllMember(ArrayList<Member> list) {
		System.out.println("\n----------- 회원 정보 출력 -----------\n");
		System.out.println("아이디\t비밀번호\t이름\t주소\t\t\t전화번호\t\t나이\t가입일");
		for(Member m : list) {
			System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t"+m.getMemberName()+"\t"+m.getMemberAddr()+"\t"+m.getMemberPhone()
								+"\t"+ m.getMemberAge()+"\t"+m.getEnrollDate());	
		}
	}
	
	public void selectOneMember(Member m) {
		System.out.println("아이디 : " + m.getMemberId());
		System.out.println("비밀번호 : " + m.getMemberPw());
		System.out.println("이름 : " + m.getMemberName());
		System.out.println("나이 : " + m.getMemberAge());
		System.out.println("주소 : " + m.getMemberAddr());
		System.out.println("전화번호 : " + m.getMemberPhone());
		System.out.println("가입일 : " + m.getEnrollDate());
	}
	
	public void selectNameMember(ArrayList<Member> list) {
		System.out.println("\n----------- 회원 정보 출력 -----------\n");
		System.out.println("아이디\t비밀번호\t이름\t주소\t전화번호\t나이\t가입일");
		for(Member m : list) {
			System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t"+m.getMemberName()+"\t"+m.getMemberAddr()+"\t"+m.getMemberPhone()
								+"\t"+ m.getMemberAge()+"\t"+m.getEnrollDate());	
		}
	}
	
	public Member getMember() {
		System.out.print("아이디 입력 : ");
		String memberId = sc.next();
		System.out.print("비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("이름 입력 : ");
		String memberName = sc.next();
		System.out.print("주소 입력 : ");
		sc.nextLine();
		String memberAddr = sc.nextLine();
		System.out.print("전화번호 입력 : ");
		String memberPhone = sc.next();
		System.out.print("나이 입력 : ");
		int memberAge = sc.nextInt();
		// 가입일은 insert 쿼리문 수행 시 SYSDATE로 입력할 예정으로, 입력받지 않음
		Member m = new Member(memberId, memberPw, memberName, memberAddr, memberPhone, memberAge, null);
		return m;
	}
	
	public Member updateMember() {
		Member m = new Member();
		System.out.print("수정할 비밀번호 입력 : ");
		m.setMemberPw(sc.next());
		System.out.print("수정할 주소 입력 : ");
		sc.nextLine();
		m.setMemberAddr(sc.nextLine());
		System.out.print("수정할 전화번호 입력 : ");
		m.setMemberPhone(sc.next());
		
		return m;
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
	
	public int loginMenu(String memberName) {
		System.out.println("------ ["+memberName+"] ------");
		System.out.println("1. 내 정보보기");
		System.out.println("2. 로그아웃");
		System.out.println("3. 회원 탈퇴");
		System.out.println("선택 > ");
		int sel = sc.nextInt();
		return sel;
	}
	
	public void emptyMember() {
		System.out.println("회원이 존재하지 않습니다.");
	}
	
	public void successMsg() {
		System.out.println("등록에 성공하셨습니다.");
	}
	
	public void failMsg() {
		System.out.println("등록에 실패했습니다.");
	}
	public void exit() {
		System.out.println("프로그램을 종료합니다.");
	}
	public void missWord() {
		System.out.println("잘 못 입력하셨습니다, 다시 입력해주세요.");
	}
}
