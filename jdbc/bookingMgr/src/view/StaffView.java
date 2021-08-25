package view;

import java.util.ArrayList;
import java.util.Scanner;

import vo.Accommodation;
import vo.Member;
import vo.Reservation;

public class StaffView {
	private Scanner sc ;
	
	public StaffView() {
		super();
		sc = new Scanner(System.in);
	}
	public void printMsg(String msg) {
		System.out.println(msg);
	}

	public int staffMenu() {
		System.out.println("----- 관리자 메뉴-----");
		System.out.println("1. 전체 객실 조회");
		System.out.println("2. 객실 등록");
		System.out.println("3. 객실 삭제");
		System.out.println("4. 전체 예약 내역");
		System.out.println("5. 전체 회원 조회");
		System.out.println("0. 로그아웃");
		System.out.print("선택 >");
		return sc.nextInt();
	}

	public void selectAllAcc(ArrayList<Accommodation> accList) {
		System.out.println("----- 전체 객실 조회 -----");
		System.out.println("객실호수\t객실타입\t가격\t수용가능인원 "); 
		for(Accommodation a : accList) {
			System.out.println(a.getRoomNo()+"\t"+a.getRoomTypeStr()+"\t"+a.getRoomPrice()+"\t"+a.getAcceptPerson());
		}
		
	}

	public Accommodation insertAcc() {
		Accommodation acc = new Accommodation();
		System.out.println("----- 객실 등록 ----- ");
		System.out.print("객실 타입[1.디럭스 /2.스위트름] : ");
		acc.setRoomType(sc.nextInt());
		System.out.print("객실 가격: ");
		acc.setRoomPrice(sc.nextInt());
		System.out.print("수용 가능 인원: ");
		acc.setAcceptPerson(sc.nextInt());
		return acc;
	}
	public int deleteAcc() {
		System.out.println("----- 객실 삭제 -----");
		System.out.print("삭제할 객실 호수: ");
		return sc.nextInt();
	}
	public void selectAllRes(ArrayList<Reservation> resList) {
		System.out.println("----- 전체 예약내역 조회-----");
		System.out.println("예약번호 \t 회원번호 \t 객실호수 \t 예약일자 \t 체크인 \t 체크아웃 \t 예약인원");
		for(Reservation r : resList) {
			System.out.println(r.getResNo()+"\t"+r.getMemberNo()+"\t"+r.getRoomNo()+"\t"+r.getResDate()+"\t"+r.getCheckIn()+"\t"+r.getCheckOut()+"\t"+r.getResPerson());
		}
	}
	public void selectAllMem(ArrayList<Member> memList) {
		System.out.println("----- 전체 회원 조회 -----");
		System.out.println("회원번호 \t 아이디 \t 비밀번호 \t 이름\t 전화번호 \t 주소 \t 회원등급");
		for( Member m : memList) {
			System.out.println(m.getMemberNo()+"\t"+m.getMemberId()+"\t"+m.getMemberPw()+"\t"+m.getMemberPhone()+"\t"+m.getMemberAddr()+"\t"+m.getMemberLevelStr());
		}
	}

}
