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
			System.out.println("\n------ ����Ʈ ���� ���α׷�v1 -------\n");
			System.out.println("1. ȸ�� ���� ���"); // Create
			System.out.println("2. ��ü ȸ�� ��ȸ"); // Read
			System.out.println("3. ȸ�� 1�� ��ȸ"); // Read
			System.out.println("4. ȸ�� ���� ����");	// Update
			System.out.println("5. ȸ�� ���� ����");	// Delete
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
				System.out.println("�� �� �Է��ϼ̽��ϴ�, �ٽ� �Է����ּ���.");
				break;
			}
		}
	}
	 
	public void insertMember() {
		System.out.println("\n ========== ȸ�� ���� ��� ========== \n");
		System.out.print("1. ��� �Է�[silver / gold / vip] : ");
		String grade = sc.next();
		System.out.print("2. �̸� �Է� : ");
		String name = sc.next();
		System.out.print("3. ����Ʈ �Է� : ");
		int point = sc.nextInt();
		
		insertArr(grade, name, point);
		System.out.println("��� �Ϸ�!");
	}
	public void printAllMember() {
		System.out.println("\n ========== ��ϵ� ȸ�� ��ü ��� ========== \n");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		
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
		System.out.println("\n ========== Ư�� ȸ�� ��� ========== \n");
		System.out.print("��ȸ �� ȸ�� �̸� �Է� : ");
		String searchName = sc.next();
		
		int searchIndex = searchIndex(searchName);
		if(searchIndex != -1) {
			if(flag == 1) {
				System.out.println("��� : "+ s[searchIndex].getGrade());
				System.out.println("�̸� : "+ s[searchIndex].getName());
				System.out.println("����Ʈ : "+ s[searchIndex].getPoint());
				System.out.println("���ʽ� : "+ s[searchIndex].getBonus());
			}else if(flag == 2) {
				System.out.println("��� : "+ g[searchIndex].getGrade());
				System.out.println("�̸� : "+ g[searchIndex].getName());
				System.out.println("����Ʈ : "+ g[searchIndex].getPoint());
				System.out.println("���ʽ� : "+ g[searchIndex].getBonus());
			}else if(flag == 3) {
				System.out.println("��� : "+ v[searchIndex].getGrade());
				System.out.println("�̸� : "+ v[searchIndex].getName());
				System.out.println("����Ʈ : "+ v[searchIndex].getPoint());
				System.out.println("���ʽ� : "+ v[searchIndex].getBonus());
			}
		}else {
			System.out.println("ȸ�� ������ �������� �ʽ��ϴ�.");
		}
	}
	public void updateMember() {
		System.out.println("\n ========== ȸ�� ���� ���� ========== \n");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String updateName = sc.next();
		int searchIndex = searchIndex(updateName);
		
		if(searchIndex != -1) {
			deleteArr(searchIndex);
			System.out.print("���� ȸ�� ��� �Է�[silver / gold / vip] : ");
			String grade = sc.next();
			System.out.print("���� ȸ�� �̸� �Է� : ");
			String name = sc.next();
			System.out.println("���� ȸ�� ����Ʈ �Է� : ");
			int point = sc.nextInt();
			
			insertArr(grade, name, point);
			System.out.println("���� �Ϸ�!");
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}	
	}
	public void deleteMember() {
		System.out.println("\n ========== ȸ�� ���� ���� ========== \n");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String deleteName = sc.next();
		int searchIndex = searchIndex(deleteName);
		
		if(searchIndex != -1) {
			deleteArr(searchIndex);
			System.out.println("���� �Ϸ�!");
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
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
