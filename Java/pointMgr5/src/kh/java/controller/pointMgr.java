package kh.java.controller;

import java.util.ArrayList;
import java.util.Scanner;

import kh.java.vo.Gold;
import kh.java.vo.Grade;
import kh.java.vo.Silver;
import kh.java.vo.Vip;
import kh.java.vo.Vvip;

public class pointMgr {
	private Scanner sc;
	private ArrayList<Grade> members;
	
	public pointMgr() {
		super();
		sc = new Scanner(System.in);
		members = new ArrayList<Grade>();
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
			members.add(s);
			break;
		case "gold" :
			Grade g = new Gold(grade, name, point);
			members.add(g);
			break;
		case "vip" :
			Grade v = new Vip(grade, name, point);
			members.add(v);
			break;
		case "vvip" :
			Grade vv = new Vvip(grade, name, point);
			members.add(vv);
			break;
		}
	}
	public void printAllMember() {
		System.out.println("===== ��ü ȸ�� ���� ��� =====");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		System.out.println("-----------------------------------------");
		for(Grade g : members) {
			System.out.println(g);
		}
	}
	public void printOneMember() {
		System.out.println("===== ȸ�� ���� ��� =====");
		System.out.print("��ȸ�� ȸ�� �̸� �Է� : ");
		String searchName = sc.next();
		int searchIndex = searchMember(searchName);
		
		if(searchIndex == -1) {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}else {
			System.out.println("��� : "+ members.get(searchIndex).getGrade());
			System.out.println("�̸� : "+ members.get(searchIndex).getName());
			System.out.println("����Ʈ : "+ members.get(searchIndex).getPoint());
			System.out.println("���ʽ� : "+ members.get(searchIndex).getBonus());
		}
	}
	public void updateMember() {
		System.out.println("===== ȸ�� ���� ���� =====");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String updateName = sc.next();
		int searchIndex = searchMember(updateName);
		
		if(searchIndex != -1) {
			System.out.print("���� ��� �Է�[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("���� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("���� ����Ʈ �Է� : ");
			int point = sc.nextInt();
			
			switch(grade) {
			case "silver" :
				members.set(searchIndex, new Silver(grade, name, point));
				break;
			case "gold" :
				members.set(searchIndex, new Gold(grade, name, point));
				break;
			case "vip" :
				members.set(searchIndex, new Vip(grade, name, point));
				break;
			case "vvip" :
				members.set(searchIndex, new Vvip(grade, name, point));
				break;
			default :
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
		int searchIndex = searchMember(deleteName);
		
		if(searchIndex != -1) {
			members.remove(searchIndex);
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}
	}
	public int searchMember(String name) {
		for (int i = 0; i < members.size(); i++) {
			if(members.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
