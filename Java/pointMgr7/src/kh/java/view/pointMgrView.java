package kh.java.view;

import java.util.ArrayList;
import java.util.Scanner;

import kh.java.vo.Gold;
import kh.java.vo.Grade;
import kh.java.vo.Silver;
import kh.java.vo.Vip;
import kh.java.vo.Vvip;

public class pointMgrView {
	private Scanner sc;
	
	public pointMgrView() {
		super();
		sc = new Scanner(System.in);
	}
	
	public int showMainMenu() {
		System.out.println("===== 회원 관리 프로그램 v7 =====");
		System.out.println("1. 회원 정보 등록");
		System.out.println("2. 회원 전체 출력");
		System.out.println("3. 회원 정보 출력(1명)");
		System.out.println("4. 회원 정보 수정");
		System.out.println("5. 회원 정보 삭제");
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		return sel;
	}
	public Grade insertMember() {
		System.out.println("===== 회원 정보 등록 =====");
		System.out.print("등급입력 [silver / gold / vip / vvip] : ");
		String grade = sc.next();
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("포인트 입력 : ");
		int point = sc.nextInt();
		Grade g = null;
		
		switch(grade) {
		case "silver" :
			g = new Silver(grade, name, point);
			break;
		case "gold" :
			g = new Gold(grade, name, point);
			break;
		case "vip" :
			g = new Vip(grade, name, point);
			break;
		case "vvip" :
			g = new Vvip(grade, name, point);
			break;
		}
		System.out.println("정보 등록 완료!");
		return g;
	}
	public void printAllMember(ArrayList<Grade> members) {
		System.out.println("===== 전체 회원 정보 출력 =====");
		System.out.println("등급\t이름\t포인트\t보너스");
		System.out.println("-----------------------------------------");
		for(Grade g : members) {
			System.out.println(g.getGrade()+"\t"+g.getName()+"\t"+g.getPoint()+"\t"+g.getBonus());
		}
	}
	public String getName() {
		System.out.print("이름 입력 : ");
		String name = sc.next();
		return name;
	}
	public void printOneMember(Grade g) {
		System.out.println("===== 회원 정보 출력 =====");
		System.out.println("등급 : " + g.getGrade());
		System.out.println("이름 : " + g.getName());
		System.out.println("포인트 : " + g.getPoint());
		System.out.println("보너스 : " + g.getBonus());
	}
	public void updateMember(Grade g) {
		
		System.out.println("===== 회원 정보 수정 =====");
			System.out.print("수정 등급 입력[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("수정 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정 포인트 입력 : ");
			int point = sc.nextInt();
			
			g.setGrade(grade);
			g.setName(name);
			g.setPoint(point);
	}
	
	public void exit() {
		System.out.println("프로그램을 종료합니다.");
	}
	public void incorrectInput() {
		System.out.println("잘 못 입력하셨습니다.");
	}
	public void noSearchMember() {
		System.out.println("회원 정보가 없습니다.");
	}

}
