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
			System.out.println("===== ȸ�� ���� ���α׷� =====");
			System.out.println("1. ȸ�� ���� ���");
			System.out.println("2. ȸ�� ��ü ���");
			System.out.println("3. ȸ�� ���� ���(1��)");
			System.out.println("4. ȸ�� ���� ����");
			System.out.println("5. ȸ�� ���� ����");
			System.out.println("0. ���α׷� ����");
			System.out.print("���� > ");
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
				System.out.println("���α׷��� �����մϴ�.");
				return;
			default :
				System.out.println("�� �� �Է� �ϼ̽��ϴ�.");
				break;
			}
		}
	}
	public void insertMember() {
		System.out.println("===== ȸ�� ���� ��� =====");
		System.out.print("����Է� [silver / gold / vip / vvip] : ");
		String grade = sc.next();
		System.out.print("�̸� �Է� : ");
		String name = sc.next();
		System.out.print("����Ʈ �Է� : ");
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
		System.out.println("===== ��ü ȸ�� ���� ��� =====");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		System.out.println("-----------------------------------------");
		
		Set<String> keys = members.keySet();
		for(String key : keys) {
			System.out.println(members.get(key));
		}
	}
	public void printOneMember() {
		System.out.println("===== ȸ�� ���� ��� =====");
		System.out.print("��ȸ�� ȸ�� �̸� �Է� : ");
		String searchName = sc.next();
		
		Grade m = members.get(searchName);
		if(!members.containsKey(searchName)) {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}else {
			System.out.println("��� : "+ m.getGrade());
			System.out.println("�̸� : "+ m.getName());
			System.out.println("����Ʈ : "+ m.getPoint());
			System.out.println("���ʽ� : "+ m.getBonus());
		}
	}
	public void updateMember() {
		System.out.println("===== ȸ�� ���� ���� =====");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String updateName = sc.next();
		
		
		if(members.containsKey(updateName)) {
			System.out.print("���� ��� �Է�[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("���� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("���� ����Ʈ �Է� : ");
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
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}
	}
	public void deleteMember() {
		System.out.println("===== ȸ�� ���� ���� =====");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String deleteName = sc.next();
		
		if(members.containsKey(deleteName)) {
			members.remove(deleteName);
			System.out.println("���� �Ϸ��Ͽ����ϴ�.");
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}
	}
	
}
