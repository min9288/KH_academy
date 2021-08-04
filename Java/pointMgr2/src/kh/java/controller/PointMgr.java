package kh.java.controller;

import java.util.Scanner;

import kh.java.vo.Gold;
import kh.java.vo.Silver;
import kh.java.vo.Vip;

public class PointMgr {
	private Scanner sc;
	private Silver s[];
	private int sIndex;
	private Gold g[];
	private int gIndex;
	private Vip v[];
	private int vIndex;
	private int flag;
	
	public PointMgr() {
		super();
		sc = new Scanner(System.in);
		s = new Silver[10];
		g = new Gold[10];
		v = new Vip[10];
		sIndex = 0;
		gIndex = 0;
		vIndex = 0;		
	}
	public void main() {
		while(true) {
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
				System.out.println("프로그램을 종료합니다.");
				return;
			default :
				System.out.println("잘 못 입력하셨습니다, 다시 입력해주세요.");
				break;
			}
		}
	}
	 
	public void insertMember() {
		System.out.println("\n ========== 회원 정보 등록 ========== \n");
		System.out.print("1. 등급 입력[silver / gold / vip] : ");
		String grade = sc.next();
		System.out.print("2. 이름 입력 : ");
		String name = sc.next();
		System.out.print("3. 포인트 입력 : ");
		int point = sc.nextInt();
		
		insertArr(grade, name, point);
		System.out.println("등록 완료!");
	}
	public void printAllMember() {
		System.out.println("\n ========== 등록된 회원 전체 출력 ========== \n");
		System.out.println("등급\t이름\t포인트\t보너스");
		
		for(int i = 0; i < sIndex; i++) {
			System.out.println(s[i].getGrade()+"\t"+s[i].getName()+"\t"+s[i].getPoint()+"\t"+s[i].getBonus());
		}
		for(int i = 0; i < gIndex; i++) {
			System.out.println(g[i].getGrade()+"\t"+g[i].getName()+"\t"+g[i].getPoint()+"\t"+g[i].getBonus());
		}
		for(int i = 0; i < vIndex; i++) {
			System.out.println(v[i].getGrade()+"\t"+v[i].getName()+"\t"+v[i].getPoint()+"\t"+v[i].getBonus());
		}
	}
	public void printOneMember() {
		System.out.println("\n ========== 특정 회원 출력 ========== \n");
		System.out.print("조회 할 회원 이름 입력 : ");
		String searchName = sc.next();
		
		int searchIndex = searchIndex(searchName);
		if(searchIndex != -1) {
			if(flag == 1) {
				System.out.println("등급 : "+ s[searchIndex].getGrade());
				System.out.println("이름 : "+ s[searchIndex].getName());
				System.out.println("포인트 : "+ s[searchIndex].getPoint());
				System.out.println("보너스 : "+ s[searchIndex].getBonus());
			}else if(flag == 2) {
				System.out.println("등급 : "+ g[searchIndex].getGrade());
				System.out.println("이름 : "+ g[searchIndex].getName());
				System.out.println("포인트 : "+ g[searchIndex].getPoint());
				System.out.println("보너스 : "+ g[searchIndex].getBonus());
			}else if(flag == 3) {
				System.out.println("등급 : "+ v[searchIndex].getGrade());
				System.out.println("이름 : "+ v[searchIndex].getName());
				System.out.println("포인트 : "+ v[searchIndex].getPoint());
				System.out.println("보너스 : "+ v[searchIndex].getBonus());
			}
		}else {
			System.out.println("회원 정보가 존재하지 않습니다.");
		}
	}
	public void updateMember() {
		System.out.println("\n ========== 회원 정보 수정 ========== \n");
		System.out.print("수정할 회원 이름 입력 : ");
		String updateName = sc.next();
		int searchIndex = searchIndex(updateName);
		
		if(searchIndex != -1) {
			deleteArr(searchIndex);
			System.out.print("수정 회원 등급 입력[silver / gold / vip] : ");
			String grade = sc.next();
			System.out.print("수정 회원 이름 입력 : ");
			String name = sc.next();
			System.out.println("수정 회원 포인트 입력 : ");
			int point = sc.nextInt();
			
			insertArr(grade, name, point);
			System.out.println("수정 완료!");
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}	
	}
	public void deleteMember() {
		System.out.println("\n ========== 회원 정보 삭제 ========== \n");
		System.out.print("삭제할 회원 이름 입력 : ");
		String deleteName = sc.next();
		int searchIndex = searchIndex(deleteName);
		
		if(searchIndex != -1) {
			deleteArr(searchIndex);
			System.out.println("삭제 완료!");
		}else {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
	public int searchIndex(String name) {
		for(int i = 0; i < sIndex; i++) {
			if(s[i].getName().equals(name)) {
				flag = 1;
				return i;
			}
		}
		for(int i = 0; i < gIndex; i++) {
			if(g[i].getName().equals(name)) {
				flag = 2;
				return i;
			}
		}
		for(int i = 0; i < vIndex; i++) {
			if(v[i].getName().equals(name)) {
				flag = 3;
				return i;
			}
		}
		return -1;
	}
	public void insertArr(String grade, String name, int point) {
		switch(grade) {
		case "silver" :
			s[sIndex++] = new Silver(grade, name, point);
			break;
		case "gold" :
			g[gIndex++] = new Gold(grade, name, point);
			break;
		case "vip" :
			v[vIndex++] = new Vip(grade, name, point);
			break;
		}
	}
	public void deleteArr(int searchIndex) {
		if (flag == 1) {
			for(int i = searchIndex; i < sIndex - 1; i++) {
				s[i] = s[i + 1];
			}
			s[--sIndex] = null;
		}else if (flag == 2) {
			for(int i = searchIndex; i < gIndex - 1; i++) {
				g[i] = g[i + 1];
			}
			g[--gIndex] = null;
		}else if (flag == 3) {
			for(int i = searchIndex; i < vIndex - 1; i++) {
				v[i] = v[i + 1];
			}
			v[--vIndex] = null;
		}
	}
}
