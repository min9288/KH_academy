package kh.java.func;

import java.util.Scanner;

public class ifTest 
{
	public void test1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� 10�� �Է��ϼ��� : ");
		int num = sc.nextInt();
		if(num == 10) {
			System.out.println("���߾��!");
		}
		System.out.println("�����մϴ�..!");
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ ���� ���� ���α׷� ============");
		System.out.print("������ ������ �Է� �ϼ��� : ");
		int num = sc.nextInt();
		if(num > 0) {
			System.out.printf("����� �Է��� �� %d��(��) ����Դϴ�.", num);
		}else if (num < 0){
			System.out.printf("����� �Է��� �� %d��(��) �����Դϴ�.", num);
		}else {
			System.out.printf("����� �Է��� �� %d��(��) %d�Դϴ�.", num, num);
		}
		
	}
	public void test3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ �μ� �� ���α׷� ============");
		System.out.print("ù��° ������ �Է� �ϼ��� : ");
		int num1 = sc.nextInt();
		System.out.print("ù��° ������ �Է� �ϼ��� : ");
		int num2 = sc.nextInt();
		if(num1 > num2) {
			System.out.println(num1+ ">" +num2);
			System.out.println("ù��° ���� �� Ů�ϴ�.");
		}else if(num1 == num2) {
			System.out.println(num1+ "=" +num2);
			System.out.println("�� ���� �����ϴ�.");
		}else if(num1 < num2) {
			System.out.println(num1+ "<" +num2);
			System.out.println("�ι�° ���� �� Ů�ϴ�.");
		}
	
	}
	public void test4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ ���� ���α׷� ============");
		System.out.print("�����ڸ� �Է��ϼ���(+, -, *, /) : ");
		char oper = sc.next().charAt(0);
		System.out.print("ù��° ������ �Է� �ϼ��� : ");
		int num1 = sc.nextInt();
		System.out.print("ù��° ������ �Է� �ϼ��� : ");
		int num2 = sc.nextInt();
		if(oper == '+') {
			System.out.println(num1+"+"+num2+"="+ (num1 + num2));
		}else if(oper == '-') {
			System.out.println(num1+"-"+num2+"="+ (num1 - num2));
		}else if(oper == '*') {
			System.out.println(num1+"*"+num2+"="+ (num1 * num2));
	}else if(oper == '/') {
		System.out.printf("%d // %d = %.2f", num1, num2, ((double)num1 / num2));
	
		}
	}
	public void test5() {
		Scanner sc = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int num = sc.nextInt();
		if(num % 2 == 0 ) {
			System.out.print(num+"��(��) ¦�� �Դϴ�.");
		}else {
			System.out.print(num+"��(��) Ȧ�� �Դϴ�.");
		}
	}
	public void test6() {
		Scanner sc = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int num = sc.nextInt();
		
		if(num > 1000) {
			System.out.print("1000���� ū �����Դϴ�.");
		}else if(num > 100) {
			System.out.print("100���� ū �����Դϴ�.");
		}else if(num > 10) {
			System.out.print("10���� ū �����Դϴ�.");
		}
	}
}
		
