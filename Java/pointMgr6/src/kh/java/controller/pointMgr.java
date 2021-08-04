package kh.java.controller;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kh.java.vo.Gold;
import kh.java.vo.Grade;
import kh.java.vo.Silver;
import kh.java.vo.Vip;
import kh.java.vo.Vvip;

public class pointMgr {
	private Scanner sc;
	private HashMap<String, Grade> members;
	
	public pointMgr() {
		super();
		sc = new Scanner(System.in);
		members = new HashMap<String, Grade>();
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
			Grade s = new Silver(grade, name, point);
			members.put(name, s);
			break;
		case "gold" :
			Grade g = new Gold(grade, name, point);
			members.put(name, g);
			break;
		case "vip" :
			Grade v = new Vip(grade, name, point);
			members.put(name, v);
			break;
		case "vvip" :
			Grade vv = new Vvip(grade, name, point);
			members.put(name, vv);
			break;
		}
	}
	public void printAllMember() {
		System.out.println("===== 전체 회원 정보 출력 =====");
		System.out.println("등급\t이름\t포인트\t보너스");
		System.out.println("-----------------------------------------");
		
		Set<String> keys = members.keySet();
		for(String key : keys) {
			System.out.println(members.get(key));
		}
	}
	public void printOneMember() {
		System.out.println("===== 회원 정보 출력 =====");
		System.out.print("조회할 회원 이름 입력 : ");
		String searchName = sc.next();
		
		Grade m = members.get(searchName);
		if(!members.containsKey(searchName)) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("등급 : "+ m.getGrade());
			System.out.println("이름 : "+ m.getName());
			System.out.println("포인트 : "+ m.getPoint());
			System.out.println("보너스 : "+ m.getBonus());
		}
	}
	public void updateMember() {
		System.out.println("===== 회원 정보 수정 =====");
		System.out.print("수정할 회원 이름 입력 : ");
		String updateName = sc.next();
		
		
		if(members.containsKey(updateName)) {
			System.out.print("수정 등급 입력[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("수정 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정 포인트 입력 : ");
			int point = sc.nextInt();
			
			switch(grade) {
			case "silver" :
				members.remove(updateName);
				Grade s = new Silver(grade, name, point);
				members.put(name, s);
				break;
			case "gold" :
				members.remove(updateName);
				Grade g = new Gold(grade, name, point);
				members.put(name, g);
				break;
			case "vip" :
				members.remove(updateName);
				Grade v = new Vip(grade, name, point);
				members.put(name, v);
				break;
			case "vvip" :
				members.remove(updateName);
				Grade vv = new Vvip(grade, name, point);
				members.put(name, vv);
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
		
		if(members.containsKey(deleteName)) {
			members.remove(deleteName);
			System.out.println("삭제 완료하였습니다.");
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
	
}
