package kh.java.function;

import java.util.Scanner;

public class Example {
	public void exam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° ���� �Է�: ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° �Է� : ");
		int num2 = sc.nextInt();
		int sum = num1 + num2;
		int subtra = num1 - num2;
		int multiply = num1 * num2;
		double division = (double) num1 / (double) num2;
		double rest = (double)num1 / (double)num2;
		System.out.println("============ ��� ============");
		System.out.println("���ϱ� ��� : "+sum);
		System.out.println("���� ��� : "+subtra);
		System.out.println("���ϱ� ��� : "+multiply);
		System.out.printf("������ �� : %.2f\n", division);
		System.out.printf("������ ������ : %.2f", rest);
		
	}
	public void exam2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("���� ���� �Է�: ");
		double width = sc.nextDouble();
		System.out.print("���� ���� �Է� : ");
		double height = sc.nextDouble();
		
		double area = width * height;
		double circumference = 2 * (width + height);
		
		System.out.println("============ ��� ============");
		System.out.printf("���� : %.2f\n", area);
		System.out.printf("�ѷ� : %.1f", circumference);
	}
	public void exam3()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("����ܾ� �Է�: ");
		String str = sc.next();
		char first = str.charAt(0);
		System.out.println("ù��° ����: "+first);
		char second = str.charAt(1);
		System.out.println("�ι�° ����: "+second);
		char third = str.charAt(2);
		System.out.println("����° ����: "+third);
	}
}
