package kh.java.controller;

import java.util.Scanner;

import kh.java.vo.Gold;
import kh.java.vo.Silver;
import kh.java.vo.Vip;

public class PointMgr {
	private Scanner sc;
	private Silver sMembers[];
	private int sIndex;
	private Gold gMembers[];
	private int gIndex;
	private Vip vMembers[];
	private int vIndex;
	private int flag;
	
	public PointMgr() {
		sc = new Scanner(System.in);
		sMembers = new Silver[10];
		gMembers = new Gold[10];
		vMembers = new Vip[10];
		sIndex = 0;
		gIndex = 0;
		vIndex = 0;
	}
	public void main() {
		while(true) {	// 배열 반복 출력
			System.out.println("\n------ 포인트 관리 프로그램v1 -------\n");
			System.out.println("1. 회원 정보 등록"); // Create
			System.out.println("2. 전체 회원 조회"); // Read
			System.out.println("3. 회원 1명 조회"); // Read
			System.out.println("4. 회원 정보 수정");	// Update
			System.out.println("5. 회원 정보 삭제");	// Delete
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int sel = sc.nextInt();
			
			switch(sel) {
			case 1 :
				insertMember();
				break;
			case 2 :
				printAllMember();
				break;
			case 3 :
				printOneMember();
				break;
			case 4 :
				updateMember();
				break;
			case 5 :
				deleteMember();
				break;
			case 0 :
				System.out.println("Bye ~");
				return;
			default :
				System.out.println("잘 못 입력하셨습니다.");
			}
		}
	}
	public void insertMember() {	// 회원 등록 기능
		System.out.println("\n------ 회원 정보 등록 -------\n");
		System.out.print("1. 등급 입력[silver / gold / vip] : ");
		String grade = sc.next();
		System.out.print("2. 이름 입력 : ");
		String name = sc.next();
		System.out.print("3. 포인트 입력 : ");
		int point = sc.nextInt();
		insertArr(grade, name, point);
		System.out.println("등록 완료!");
	}
	public void printAllMember() {	// 전체 회원을 조회하는 기능
		System.out.println("\n------ 전체 회원 출력 -------\n");
		System.out.println("등급\t이름\t포인트\t보너스");
		
		// sMembers배열 전체출력
		for(int i = 0; i < sIndex; i++) {
			System.out.println(sMembers[i].getGrade()+"\t"+sMembers[i].getName()+"\t"+sMembers[i].getPoint()+"\t"+sMembers[i].getBonus());
		}
		// gMembers배열 전체출력
		for(int i = 0; i < gIndex; i++) {
			System.out.println(gMembers[i].getGrade()+"\t"+gMembers[i].getName()+"\t"+gMembers[i].getPoint()+"\t"+gMembers[i].getBonus());
		}
		// vMembers배열 전체출력
		for(int i = 0; i < vIndex; i++) {
			System.out.println(vMembers[i].getGrade()+"\t"+vMembers[i].getName()+"\t"+vMembers[i].getPoint()+"\t"+vMembers[i].getBonus());
		}
	}
	public void printOneMember() {	// 특정 1명의 회원을 조회하는 기능
		System.out.println("\n------ 회원 정보 출력 -------\n");
		System.out.print("조회 할 회원 이름 입력 : ");
		String searchName = sc.next();

		int searchMember = searchMember(searchName);
		
		if(searchMember != -1) {
			
//			if(searchMember / 100 == 1) {
//				searchMember -= 100;
//				System.out.println("등급 : "+sMembers[searchMember].getGrade());
//				System.out.println("이름 : "+sMembers[searchMember].getName());
//				System.out.println("포인트 : "+sMembers[searchMember].getPoint());
//				System.out.println("보너스 : "+sMembers[searchMember].getBonus());
//			}else if(searchMember / 10 == 1) {
//				searchMember -= 10;
//				System.out.println("등급 : "+gMembers[searchMember].getGrade());
//				System.out.println("이름 : "+gMembers[searchMember].getName());
//				System.out.println("포인트 : "+gMembers[searchMember].getPoint());
//				System.out.println("보너스 : "+gMembers[searchMember].getBonus());
//			}else {
//				System.out.println("등급 : "+vMembers[searchMember].getGrade());
//				System.out.println("이름 : "+vMembers[searchMember].getName());
//				System.out.println("포인트 : "+vMembers[searchMember].getPoint());
//				System.out.println("보너스 : "+vMembers[searchMember].getBonus());
//			}
			
			
			if(flag == 1) {
				System.out.println("등급 : "+ sMembers[searchMember].getGrade());
				System.out.println("이름 : "+ sMembers[searchMember].getName());
				System.out.println("포인트 : "+ sMembers[searchMember].getPoint());
				System.out.println("보너스 : "+ sMembers[searchMember].getBonus());
			}else if (flag == 2) {
				System.out.println("등급 : "+ gMembers[searchMember].getGrade());
				System.out.println("이름 : "+ gMembers[searchMember].getName());
				System.out.println("포인트 : "+ gMembers[searchMember].getPoint());
				System.out.println("보너스 : "+ gMembers[searchMember].getBonus());
			}else if (flag == 3) {
				System.out.println("등급 : "+ vMembers[searchMember].getGrade());
				System.out.println("이름 : "+ vMembers[searchMember].getName());
				System.out.println("포인트 : "+ vMembers[searchMember].getPoint());
				System.out.println("보너스 : "+ vMembers[searchMember].getBonus());
			}
		}else {
			System.out.println("회원정보가 존재하지 않습니다.");
		}
	}
	
	public void updateMember() {	// 이름으로 검색해서 수정하는 기능
		System.out.println("\n------ 회원 정보 수정 -------\n");
		System.out.print("수정할 회원 이름 입력 : ");
		String updateName = sc.next();
		int searchMember = searchMember(updateName);
		if(searchMember != -1) {
			deleteArr(searchMember);
			System.out.print("수정 회원 등급 입력[silver / gold/ vip] : ");
			String grade = sc.next();
			System.out.print("수정 회원 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정 회원 포인트 입력 : ");
			int point = sc.nextInt();
			insertArr(grade, name, point);
			System.out.println("수정완료");
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
	public void deleteMember() {	// 이름으로 검색해서 삭제하는 기능
		System.out.println("\n------ 회원 정보 삭제 -------\n");
		System.out.print("삭제할 회원 이름 입력 : ");
		String deleteName = sc.next();
		int searchMember = searchMember(deleteName);
		
		if(searchMember != -1) {
			deleteArr(searchMember);
			System.out.println("삭제완료!");
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int searchMember(String name) {	// 이름으로 검색하는 기능
		
//		for(int i = 0; i < sIndex; i++) {
//			if(sMembers[i].getName().equals(name)) {
//				flag = 1;
//				return 100 + i;  // 100 ~ 109
//			}
//		}
//	
//		for(int i = 0; i < gIndex; i++) {
//			if(gMembers[i].getName().equals(name)) {
//				flag = 2;
//				return 10 + i;  // 10 ~ 19
//			}
//		}
//	
//		for(int i = 0; i < vIndex; i++) {
//			if(vMembers[i].getName().equals(name)) {
//				flag = 3;
//				return i; // 0 ~ 9
//			}
//		}	
			for(int i = 0; i < sIndex; i++) {
				if(sMembers[i].getName().equals(name)) {
					flag = 1;
					return i;
				}
			}
		
			for(int i = 0; i < gIndex; i++) {
				if(gMembers[i].getName().equals(name)) {
					flag = 2;
					return i;
				}
			}
		
			for(int i = 0; i < vIndex; i++) {
				if(vMembers[i].getName().equals(name)) {
					flag = 3;
					return i;
				}
			}
		return -1;
	}
	public void insertArr(String grade, String name, int point) {	// 배열에 넣는 기능
		switch(grade) {
		case "silver":
			sMembers[sIndex++] = new Silver(grade, name, point);
			break;
		case "gold":
			gMembers[gIndex++] = new Gold(grade, name, point);
			break;
		case "vip":
			vMembers[vIndex++] = new Vip(grade, name, point);
			break;
		}
	}
	public void deleteArr(int searchMember) {	// 배열에서 삭제하는 기능
		if(flag == 1) {
			for(int i = searchMember; i < sIndex - 1; i++) {
				sMembers[i] = sMembers[i + 1];
			}
			sMembers[--sIndex] = null;
		}else if(flag == 2){
			for(int i = searchMember; i < gIndex - 1; i++) {
				gMembers[i] = gMembers[i + 1];
			}
			gMembers[--gIndex] = null;
		}else if(flag == 3) {
			for(int i = searchMember; i < vIndex - 1; i++) {
				vMembers[i] = vMembers[i + 1];
			}
			vMembers[--vIndex] = null;
		}
	}
}
