package kh.java.func;

import java.util.Scanner;

public class MethodTest2 {
	public void main() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.println("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		Calc c = new Calc();
		int result = c.mulFunction(num1, num2);
		
		
		System.out.println("세번째 정수 입력 : ");
		int num3 = sc.nextInt();
		int sum = add(num1, num2, num3);
		test1("hello", 1);
		test1(1, "hello");
		
	}
	public void test1(String str, int num) {
		
	}
	public void test1(int num, String str) {
		
	}
	// 매개변수로 받은 정수를 합친 값을 리턴하는 메소드 // 작성 메소드명 add
	// 메소드명이 같아도 컴퓨터가 매개변수를 보고 판단해서 문제 없음. -> 오버로딩
	public int add(int num1, int num2) {
		return num1 + num2;
	}
	public int add(int num1, int num2, int num3) {
		return num1 + num2 + num3;
	}
}
