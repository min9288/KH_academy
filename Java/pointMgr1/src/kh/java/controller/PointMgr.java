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
		while(true) {	// �迭 �ݺ� ���
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
				System.out.println("Bye ~");
				return;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�.");
			}
		}
	}
	public void insertMember() {	// ȸ�� ��� ���
		System.out.println("\n------ ȸ�� ���� ��� -------\n");
		System.out.print("1. ��� �Է�[silver / gold / vip] : ");
		String grade = sc.next();
		System.out.print("2. �̸� �Է� : ");
		String name = sc.next();
		System.out.print("3. ����Ʈ �Է� : ");
		int point = sc.nextInt();
		insertArr(grade, name, point);
		System.out.println("��� �Ϸ�!");
	}
	public void printAllMember() {	// ��ü ȸ���� ��ȸ�ϴ� ���
		System.out.println("\n------ ��ü ȸ�� ��� -------\n");
		System.out.println("���\t�̸�\t����Ʈ\t���ʽ�");
		
		// sMembers�迭 ��ü���
		for(int i = 0; i < sIndex; i++) {
			System.out.println(sMembers[i].getGrade()+"\t"+sMembers[i].getName()+"\t"+sMembers[i].getPoint()+"\t"+sMembers[i].getBonus());
		}
		// gMembers�迭 ��ü���
		for(int i = 0; i < gIndex; i++) {
			System.out.println(gMembers[i].getGrade()+"\t"+gMembers[i].getName()+"\t"+gMembers[i].getPoint()+"\t"+gMembers[i].getBonus());
		}
		// vMembers�迭 ��ü���
		for(int i = 0; i < vIndex; i++) {
			System.out.println(vMembers[i].getGrade()+"\t"+vMembers[i].getName()+"\t"+vMembers[i].getPoint()+"\t"+vMembers[i].getBonus());
		}
	}
	public void printOneMember() {	// Ư�� 1���� ȸ���� ��ȸ�ϴ� ���
		System.out.println("\n------ ȸ�� ���� ��� -------\n");
		System.out.print("��ȸ �� ȸ�� �̸� �Է� : ");
		String searchName = sc.next();

		int searchMember = searchMember(searchName);
		
		if(searchMember != -1) {
			
//			if(searchMember / 100 == 1) {
//				searchMember -= 100;
//				System.out.println("��� : "+sMembers[searchMember].getGrade());
//				System.out.println("�̸� : "+sMembers[searchMember].getName());
//				System.out.println("����Ʈ : "+sMembers[searchMember].getPoint());
//				System.out.println("���ʽ� : "+sMembers[searchMember].getBonus());
//			}else if(searchMember / 10 == 1) {
//				searchMember -= 10;
//				System.out.println("��� : "+gMembers[searchMember].getGrade());
//				System.out.println("�̸� : "+gMembers[searchMember].getName());
//				System.out.println("����Ʈ : "+gMembers[searchMember].getPoint());
//				System.out.println("���ʽ� : "+gMembers[searchMember].getBonus());
//			}else {
//				System.out.println("��� : "+vMembers[searchMember].getGrade());
//				System.out.println("�̸� : "+vMembers[searchMember].getName());
//				System.out.println("����Ʈ : "+vMembers[searchMember].getPoint());
//				System.out.println("���ʽ� : "+vMembers[searchMember].getBonus());
//			}
			
			
			if(flag == 1) {
				System.out.println("��� : "+ sMembers[searchMember].getGrade());
				System.out.println("�̸� : "+ sMembers[searchMember].getName());
				System.out.println("����Ʈ : "+ sMembers[searchMember].getPoint());
				System.out.println("���ʽ� : "+ sMembers[searchMember].getBonus());
			}else if (flag == 2) {
				System.out.println("��� : "+ gMembers[searchMember].getGrade());
				System.out.println("�̸� : "+ gMembers[searchMember].getName());
				System.out.println("����Ʈ : "+ gMembers[searchMember].getPoint());
				System.out.println("���ʽ� : "+ gMembers[searchMember].getBonus());
			}else if (flag == 3) {
				System.out.println("��� : "+ vMembers[searchMember].getGrade());
				System.out.println("�̸� : "+ vMembers[searchMember].getName());
				System.out.println("����Ʈ : "+ vMembers[searchMember].getPoint());
				System.out.println("���ʽ� : "+ vMembers[searchMember].getBonus());
			}
		}else {
			System.out.println("ȸ�������� �������� �ʽ��ϴ�.");
		}
	}
	
	public void updateMember() {	// �̸����� �˻��ؼ� �����ϴ� ���
		System.out.println("\n------ ȸ�� ���� ���� -------\n");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String updateName = sc.next();
		int searchMember = searchMember(updateName);
		if(searchMember != -1) {
			deleteArr(searchMember);
			System.out.print("���� ȸ�� ��� �Է�[silver / gold/ vip] : ");
			String grade = sc.next();
			System.out.print("���� ȸ�� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("���� ȸ�� ����Ʈ �Է� : ");
			int point = sc.nextInt();
			insertArr(grade, name, point);
			System.out.println("�����Ϸ�");
		}else {
			System.out.println("ȸ�� ������ ã�� �� �����ϴ�.");
		}
	}
	public void deleteMember() {	// �̸����� �˻��ؼ� �����ϴ� ���
		System.out.println("\n------ ȸ�� ���� ���� -------\n");
		System.out.print("������ ȸ�� �̸� �Է� : ");
		String deleteName = sc.next();
		int searchMember = searchMember(deleteName);
		
		if(searchMember != -1) {
			deleteArr(searchMember);
			System.out.println("�����Ϸ�!");
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int searchMember(String name) {	// �̸����� �˻��ϴ� ���
		
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
	public void insertArr(String grade, String name, int point) {	// �迭�� �ִ� ���
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
	public void deleteArr(int searchMember) {	// �迭���� �����ϴ� ���
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
