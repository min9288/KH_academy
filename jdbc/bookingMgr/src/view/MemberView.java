package view;

import java.util.ArrayList;
import java.util.Scanner;

import vo.Member;
import vo.Reservation;

public class MemberView {
	private Scanner sc;

	public MemberView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int memberMenu() {
		
		System.out.println("--------- 회원 메뉴 ---------");
		System.out.println("1. 숙박예약");
		System.out.println("2. 예약내역");
		System.out.println("3. 예약취소");
		System.out.println("4. 마이페이지");
		System.out.println("5. 로그아웃");
		System.out.println("선택 > ");
		int sel = sc.nextInt();
		return sel;
	}
	
	public Reservation getResInfo() {
		Reservation r = new Reservation();
		System.out.print("예약할 객실 호수 입력 : ");
		r.setRoomNo(sc.nextInt());
		System.out.print("체크인 일자 입력 [yyyymmdd] : ");
		r.setIntCheckIn(sc.nextInt());
		System.out.print("숙박일 수 입력 : ");
		r.setIntCheckOut(sc.nextInt());
		System.out.print("예약 인원 입력 : ");
		r.setResPerson(sc.nextInt());
		return r;
	}
	
	public void mypage(Member m) {
		System.out.println("------마이페이지-------");
		System.out.println("회원번호 : "+m.getMemberNo());
		System.out.println("아이디 : "+m.getMemberId());
		System.out.println("비밀번호 : "+m.getMemberPw());
		System.out.println("전화번호 : "+m.getMemberPhone());
		System.out.println("주소 : "+m.getMemberAddr());
		
	}
	public void myReservationInfo(ArrayList<Reservation> list) {
		System.out.println("-----예약내역-------");
		System.out.println("예약번호\t방호수\t예약일자\t\t체크인일자\t\t체크아웃일자\t예약인원");
		for(Reservation r : list ) {
			System.out.println(r.getResNo()+"\t"+r.getRoomNo()+"\t"+r.getResDate()+"\t"+r.getCheckIn()+"\t"+r.getCheckOut()+"\t"+r.getResPerson());
		}
	}
	
	public int getNo() {
		System.out.print("취소할 예약번호를 입력 : ");
		int resNo = sc.nextInt();
		return resNo;
	}
	
	public void successMsg(String str) {
		System.out.println(str+"에 성공 하셨습니다");
	}
	
	public void failMsg(String str) {
		System.out.println(str+"에 실패 하셨습니다");
	}

	public void logoutMsg() {
		System.out.println("로그아웃 하셨습니다, 메인메뉴로 돌아갑니다.");
	}
	
	
}
