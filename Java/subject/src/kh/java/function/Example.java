package kh.java.function;

import java.util.Scanner;

public class Example {
	public void exam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 정수 입력: ");
		int num1 = sc.nextInt();
		System.out.print("두번째 입력 : ");
		int num2 = sc.nextInt();
		int sum = num1 + num2;
		int subtra = num1 - num2;
		int multiply = num1 * num2;
		double division = (double) num1 / (double) num2;
		double rest = (double)num1 / (double)num2;
		System.out.println("============ 결과 ============");
		System.out.println("더하기 결과 : "+sum);
		System.out.println("빼기 결과 : "+subtra);
		System.out.println("곱하기 결과 : "+multiply);
		System.out.printf("나누기 몫 : %.2f\n", division);
		System.out.printf("나누기 나머지 : %.2f", rest);
		
	}
	public void exam2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("가로 길이 입력: ");
		double width = sc.nextDouble();
		System.out.print("세로 길이 입력 : ");
		double height = sc.nextDouble();
		
		double area = width * height;
		double circumference = 2 * (width + height);
		
		System.out.println("============ 결과 ============");
		System.out.printf("면적 : %.2f\n", area);
		System.out.printf("둘레 : %.1f", circumference);
	}
	public void exam3()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("영어단어 입력: ");
		String str = sc.next();
		char first = str.charAt(0);
		System.out.println("첫번째 문자: "+first);
		char second = str.charAt(1);
		System.out.println("두번째 문자: "+second);
		char third = str.charAt(2);
		System.out.println("세번째 문자: "+third);
	}
}
