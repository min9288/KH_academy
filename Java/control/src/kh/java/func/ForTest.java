package kh.java.func;

import java.lang.reflect.Method;
import java.util.Scanner;

public class ForTest {
	public void test1() {
		for(int i = 0; i < 5; i++) {
			System.out.println(i + "��° ���");
		}
	}
	public void test2() {
		int i = 0;
		
		while (i <= 5) {
			System.out.println(i + "��° ���");
			i++;
		}
	}
	public void exam1() {
		for(int i = 0; i < 5; i++) {
			System.out.println("�ȳ��ϼ���");
		}
	}
	public void exam2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("��� ����Ͻðڽ��ϱ�? ");
		int num = sc.nextInt();
		
		for(int i = 0; i < num ; i++) {
			System.out.println("�ȳ��ϼ���");
		}
	}
	public void exam3() {
		System.out.println("2�� �Դϴ�.");
		
		for (int i = 1; i <= 9; i++) {
			System.out.println("2 * "+i+" = "+2*i);
		}
	}
	public void exam4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("����� ����Ͻðڽ��ϱ�? ");
		int num = sc.nextInt();
		System.out.println(num+"�� �Դϴ�.");
		
		for (int i = 1; i <= 9; i++) {
			System.out.println(num+" * "+i+" = "+5*i);
		}
	}
//	public void exam5() {
//		Scanner sc = new Scanner(System.in);
//		
//		int num = 0;
//		int total = 0;
//		for (int i = 0; i < 5; i++) {
//			System.out.print("���� ���� �Է��Ͻÿ� : ");
//			num = sc.nextInt();
//			total += num;
//		}
//		System.out.print("�Է��� 5���� ������ �� : "+total);
//	}
	public void exam5() {
		Scanner sc = new Scanner(System.in);
		
		int num = 0;
		for (int i = 0; i < 5; i++) {
			System.out.print("���� ���� �Է��Ͻÿ� : ");
			num += sc.nextInt();		
		}
		System.out.print("�Է��� 5���� ������ �� : "+num);
	}
//	public void exam6() {
//		Scanner sc = new Scanner(System.in);
//		System.out.print("ù��° �� �Է� : ");
//		int num1 = sc.nextInt();
//		System.out.print("�ι�° �� �Է� : ");
//		int num2 = sc.nextInt();
//		
//		int sum = 0;
//		if(num1 < num2) {
//			for (int i = num1; i <= num2; i++) {
//				sum += i;
//			}
//		}else {
//			for (int i = num2; i <= num1; i++) {
//				sum += i;
//			}
//		}
//		System.out.print("10 ~ 20�� ������ �� : " + sum);
//	}
	public void exam6() {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° �� �Է� : ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° �� �Է� : ");
		int num2 = sc.nextInt();
		
		int sum = 0;
		int start = num1 > num2 ? num2 : num1;
		int end = num1 < num2 ? num2 : num1;
		for(int i = start; i <= end; i++ ) {
			sum += i;
		}
		System.out.print("10 ~ 20�� ������ �� : " + sum);
	}
//	public void exam7() {
//		Scanner sc = new Scanner(System.in);
//		
//		int total = 0;
//		System.out.print("���� �Է� : ");
//		int num = sc.nextInt();
//		
//		for (int i = 1; i <= num; i++) {
//			if(i % 2 == 0) {
//				total += i;
//			}
//		}
//		System.out.print("¦������ ���� : "+total);
//	}
	public void exam7() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է� : ");
		int num = sc.nextInt();
		
		int total = 0;
		for (int i = 0; i <= num; i += 2) {
				total += i;
		}
		System.out.print("¦������ ���� : "+total);
	}
}
