package kh.java.func;

import java.util.Scanner;

public class CalcMain {
	public void main() {
		Scanner sc = new Scanner(System.in);
		System.out.println("첫번째 숫자 입력 : ");
		int num1 = sc.nextInt();
		System.out.println("두번째 숫자 입력 : ");
		int num2 = sc.nextInt();
		System.out.println("세번째 숫자 입력 : ");
		int num3 = sc.nextInt();
		CalcInterface ct = new CalcImpl();
		int result = ct.sum(num1, num2, num3);
		System.out.println(result);
	}
}
