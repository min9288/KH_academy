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
		System.out.println("===== ��ü ȸ�� ���� ��� =====");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		System.out.println("-----------------------------------------");
		for( int i = 0; i < index; i++) {
			System.out.println(members[i].getGrade()+"\t"+members[i].getName()+"\t"+members[i].getPoint()+"\t"+members[i].getBonus());
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
			System.out.println("��� : "+ members[searchIndex].getGrade());
			System.out.println("�̸� : "+ members[searchIndex].getName());
			System.out.println("����Ʈ : "+ members[searchIndex].getPoint());
			System.out.println("���ʽ� : "+ members[searchIndex].getBonus());
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
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}
	}
	public void deleteMember() {
		System.out.println("===== ȸ�� ���� ���� =====");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String deleteName = sc.next();
		int searchIndex = searchMember(deleteName);
		
		if(searchIndex != -1) {
			for(int i = searchIndex; i < index-1; i++) {
				members[i] = members[i + 1];
			}
			members[--index] = null;
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
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
