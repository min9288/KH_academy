package kr.or.iei.user.view;

import java.util.Scanner;
import kr.or.iei.user.vo.User;

public class UserView {
	private Scanner sc;

	public UserView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int showMainMenu() {
		
		System.out.println("\n----- KH 커뮤니티 -----\n");
		System.out.println("1. 로그인");		
		System.out.println("2. 회원가입");		
		System.out.println("3. 프로그램 종료");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public User loginInfo() {
		System.out.println("--------- 로그인 ---------");
		User u = new User();
		System.out.print("아이디 입력 : ");
		u.setUserId(sc.next());
		System.out.print("비밀번호 입력 : ");
		u.setUserPw(sc.next());
		
		return u;
	}
	
	public String getId(String str) {
		
		System.out.print(str + "할 아이디 입력 : ");
		String memberId = sc.next();
		
		return memberId;
	}
	
	public User getUser() {
		
		System.out.print("비밀번호 입력 : ");
		String userPw = sc.next();
		System.out.print("이름 입력 : ");
		String userName = sc.next();
		System.out.print("나이 입력 : ");
		int userAge = sc.nextInt();
		System.out.print("전화번호 입력 : ");
		String userPhone = sc.next();
		User u = new User(userPw, userName, userAge, userPhone);
		
		return u;
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
	
	public void searchMyInfo(User login) {
		System.out.println("회원번호 : " + login.getUserCode());
		System.out.println("아이디 : " + login.getUserId());
		System.out.println("비밀번호 : " + login.getUserPw() );
		System.out.println("이름 : " + login.getUserName() );
		System.out.println("나이 : " + login.getUserAge() );
		System.out.println("전화번호 : " + login.getUserPhone() );
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
	
	public void failLogin() {
		System.out.println("아이디 또는 비밀번호를 확인하세요.");
	}
	
	public void enableId() {
		System.out.println("사용 가능한 아이디 입니다.");
	}
	
	public void existId() {
		System.out.println("이미 사용 중인 아이디 입니다.");
	}
	
	public void logoutMsg() {
		System.out.println("로그아웃 하셨습니다, 메인메뉴로 돌아갑니다.");
	}

	

	

	
}
