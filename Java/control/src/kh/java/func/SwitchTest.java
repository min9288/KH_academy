package kh.java.func;

import java.util.Scanner;

public class SwitchTest {
	public void test1( ) {
		Scanner sc = new Scanner(System.in);
		System.out.print("1 ~ 3 ������ ������ �Է��ϼ��� : ");
		int num = sc.nextInt();
		switch (num) {
		case 1:
			System.out.println("1�� �Է��Ͽ����ϴ�.");
			break;
		case 2:
			System.out.println("2�� �Է��Ͽ����ϴ�.");
			break;
		case 3:
			System.out.println("3�� �Է��Ͽ����ϴ�.");
			break;
		default :
			System.out.println("�� �� �Է��Ͽ����ϴ�.");
			break;
		}
	}
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� : ");
		int month = sc.nextInt();
		switch(month) {
		case 2 :
			System.out.println("28��");
			break;
		case 1 :
		case 3 :
		case 5 :
		case 8 :
			System.out.println("�� ����");
		case 10 :
		case 12 :
			System.out.println("31��");
			break;
		case 4 :
			break;
		case 7 :
			break;
		case 9 :
			break;
		case 11 :
			System.out.println("30��");
			break;
	
		}
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է�: ");
		char ch = sc.next().charAt(0);
		switch(ch) {
		case 'a' :
			System.out.println("AAAAAAAa");
			break;
		case 'b' :
			System.out.println("Abbbbbbb");
			break;
		case 99 :
			System.out.println("cccccccc");
			break;
		}
	}
}
		
		
//		if (num == 1) {
//			System.out.println("1�� �Է��Ͽ����ϴ�.");
//		}else if (num == 2) {
//			System.out.println("2�Է�!!");
//		}else if(num == 2) {
//			System.out.println("3�̳׿�");
//		}else {
//			System.out.println("�� �� �Է��Ͽ����ϴ�.");
//		}
//	}

