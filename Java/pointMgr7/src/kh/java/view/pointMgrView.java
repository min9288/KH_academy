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
		System.out.println("===== ȸ�� ���� ���α׷� v7 =====");
		System.out.println("1. ȸ�� ���� ���");
		System.out.println("2. ȸ�� ��ü ���");
		System.out.println("3. ȸ�� ���� ���(1��)");
		System.out.println("4. ȸ�� ���� ����");
		System.out.println("5. ȸ�� ���� ����");
		System.out.println("0. ���α׷� ����");
		System.out.print("���� > ");
		int sel = sc.nextInt();
		return sel;
	}
	public Grade insertMember() {
		System.out.println("===== ȸ�� ���� ��� =====");
		System.out.print("����Է� [silver / gold / vip / vvip] : ");
		String grade = sc.next();
		System.out.print("�̸� �Է� : ");
		String name = sc.next();
		System.out.print("����Ʈ �Է� : ");
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
		System.out.println("���� ��� �Ϸ�!");
		return g;
	}
	public void printAllMember(ArrayList<Grade> members) {
		System.out.println("===== ��ü ȸ�� ���� ��� =====");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		System.out.println("-----------------------------------------");
		for(Grade g : members) {
			System.out.println(g.getGrade()+"\t"+g.getName()+"\t"+g.getPoint()+"\t"+g.getBonus());
		}
	}
	public String getName() {
		System.out.print("�̸� �Է� : ");
		String name = sc.next();
		return name;
	}
	public void printOneMember(Grade g) {
		System.out.println("===== ȸ�� ���� ��� =====");
		System.out.println("��� : " + g.getGrade());
		System.out.println("�̸� : " + g.getName());
		System.out.println("����Ʈ : " + g.getPoint());
		System.out.println("���ʽ� : " + g.getBonus());
	}
	public void updateMember(Grade g) {
		
		System.out.println("===== ȸ�� ���� ���� =====");
			System.out.print("���� ��� �Է�[silver / gold / vip / vvip] : ");
			String grade = sc.next();
			System.out.print("���� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("���� ����Ʈ �Է� : ");
			int point = sc.nextInt();
			
			g.setGrade(grade);
			g.setName(name);
			g.setPoint(point);
	}
	
	public void exit() {
		System.out.println("���α׷��� �����մϴ�.");
	}
	public void incorrectInput() {
		System.out.println("�� �� �Է��ϼ̽��ϴ�.");
	}
	public void noSearchMember() {
		System.out.println("ȸ�� ������ �����ϴ�.");
	}

}
