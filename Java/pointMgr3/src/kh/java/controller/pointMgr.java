package kh.java.controller;

import java.util.Scanner;

import kh.java.vo.Gold;
import kh.java.vo.Silver;
import kh.java.vo.Vip;
import kh.java.vo.Vvip;

public class pointMgr {
	private Scanner sc;
	private Silver[] members;
	private int index;
	
	public pointMgr() {
		super();
		sc = new Scanner(System.in);
		members = new Silver[40];
		index = 0;
	}
	public void main() {
		while(true) {
			System.out.println("===== 회원 관리 프로그램 =====");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 전체 출력");
			System.out.println("3. 회원 정보 출력(1명)");
			System.out.println("4. 회원 정보 수정");
			System.out.println("5. 회원 정보 삭제");
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
				System.out.println("프로그램을 종료합니다.");
				return;
			default :
				System.out.println("잘 못 입력 하셨습니다.");
				break;
			}
		}
	}
	public void insertMember() {
		System.out.println("===== 회원 정보 등록 =====");
		System.out.print("등급입력 [silver / gold / vip / vvip] : ");
		String grade = sc.next();
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("포인트 입력 : ");
		int point = sc.nextInt();
		
		switch(grade) {
		case "silver" :
			members[index++] = new Silver(grade, name, point);
			break;
		case "gold" :
			members[index++] = new Gold(grade, name, point);
			break;
		case "vip" :
			members[index++] = new Vip(grade, name, point);
			break;
		case "vvip" :
			members[index++] = new Vvip(grade, name, point);
			break;
		}
	}
	public void printAllMember() {
		System.out.println("===== 전체 회원 정보 출력 =====");
		System.out.println("등급\t이름\t포인트\t보너스");
		System.out.println("-----------------------------------------");
		for( int i = 0; i < index; i++) {
			System.out.println(members[i].getGrade()+"\t"+members[i].getName()+"\t"+members[i].getPoint()+"\t"+members[i].getBonus());
		}
	}
	public void printOneMember() {
		System.out.println("===== 회원 정보 출력 =====");
		System.out.print("조회할 회원 이름 입력 : ");
		String searchName = sc.next();
		int searchIndex = searchMember(searchName);
		
		if(searchIndex == -1) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("등급 : "+ members[searchIndex].getGrade());
			System.out.println("이름 : "+ members[searchIndex].getName());
			System.out.println("포인트 : "+ members[searchIndex].getPoint());
			System.out.println("보너스 : "+ members[searchIndex].getBonus());
		}
	}
	public void updateMember() {
		System.out.println("===== 회원 정보 수정 =====");
		System.out.print("수정할 회원 이름 입력 : ");
		String updateName = sc.next();
		int searchIndex = searchMember(updateName);
		
		if(searchIndex != -1) {
			System.out.print("수정 등급 입력[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("수정 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정 포인트 입력 : ");
			int point = sc.nextInt();
			
			switch(grade) {
			case "silver" :
				members[searchIndex] = new Silver(grade, name, point);
				break;
			case "gold" :
				members[searchIndex] = new Gold(grade, name, point);
				break;
			case "vip" :
				members[searchIndex] = new Vip(grade, name, point);
				break;
			case "vvip" :
				members[searchIndex] = new Vvip(grade, name, point);
				break;
			default :
				break;
			}
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
	public void deleteMember() {
		System.out.println("===== 회원 정보 삭제 =====");
		System.out.print("삭제할 회원 이름 입력 : ");
		String deleteName = sc.next();
		int searchIndex = searchMember(deleteName);
		
		if(searchIndex != -1) {
			for(int i = searchIndex; i < index-1; i++) {
				members[i] = members[i + 1];
			}
			members[--index] = null;
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
	public int searchMember(String name) {
		for (int i = 0; i < index; i++) {
			if(members[i].getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
