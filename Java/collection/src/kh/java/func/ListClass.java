package kh.java.func;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class ListClass {
	public void listTest1() {
		String[] str = new String[3];
		str[0] = "HI";
		str[1] = "Hello";
		str[2] = "�ȳ��ϼ���";
//		str[3] = "�ݰ�����";		// �迭 ���̸� �ʰ��ؼ� ���� �߻�
		System.out.println("�迭 ��ü ���");
		for(int i = 0; i < str.length; i++) {
			System.out.println(str[i]);
		}
		ArrayList<String> list = new ArrayList<String>();
		System.out.println("\n����Ʈ ���� : "+list.size());
		list.add("HI");
		System.out.println("����Ʈ ���� : "+list.size());
		list.add("Hello");
		System.out.println("����Ʈ ���� : "+list.size());
		list.add("�ȳ��ϼ���");
		System.out.println("����Ʈ ���� : "+list.size());
		list.add("�ݰ�����");
		System.out.println("����Ʈ ���� : "+list.size());
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	public void liseTest2() {
		Scanner sc = new Scanner(System.in);
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(true) {
			System.out.print("����Ʈ�� �߰��� ���� �Է� : ");
			int num = sc.nextInt();
			list.add(num);
			System.out.print("�����Ϸ��� 1�� �Է��ϼ��� : ");
			int sel = sc.nextInt();
			
			if(sel == 1) {
				break;
			}
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	public void listTest3() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(10);
		list.add(5);
		list.add(100);
		list.add(55);
		list.add(80);
		System.out.println(list.get(2));
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {
			System.out.println((i + 1)+". "+list.get(i));
		}
		list.remove(3);			// 3���� �ε����� ���� ����
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {		// �ݺ� 4ȸ
			System.out.println((i + 1)+". "+list.get(i));
		}
		int num = list.set(1, 2);			// 1�� �ε����� ���� 2�� ����, ���� �� ���� ����
		System.out.println("1�� �ε��� ���� �� �� : "+num);
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {		// �ݺ� 4ȸ
			System.out.println((i + 1)+". "+list.get(i));
		}
		Collections.sort(list);		// �������� ���� (�ٸ�, ���������� ������ reverse �� ����ϸ� ��)
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {	
			System.out.println((i + 1)+". "+list.get(i));
		}
		Collections.reverse(list);
		System.out.println("\n����Ʈ ��ü ���");
		for(int i = 0; i < list.size(); i++) {	
			System.out.println((i + 1)+". "+list.get(i));
		}
		System.out.println(list);
		list.clear();
		System.out.println(list);
		System.out.println(list.size());
	}
	public void listTest4() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("�ȳ��ϼ���");
		list.add("������");
		list.add("�ݿ��� �Դϴ�");
		list.add("���� ���� �;��");
		// foreach �� -> collection�� for��
		for(String str : list) {
			System.out.println(str);
		}
//		for(int i = 0; i < list.size(); i++) {
//			String str = list.get(i);
//			System.out.println(str);
//		}
	}
}
