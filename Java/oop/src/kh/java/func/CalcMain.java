package kh.java.func;

import java.util.Scanner;

public class CalcMain {
	public void main() {
		Scanner sc = new Scanner(System.in);
		System.out.println("ù��° ���� �Է� : ");
		int num1 = sc.nextInt();
		System.out.println("�ι�° ���� �Է� : ");
		int num2 = sc.nextInt();
		System.out.println("����° ���� �Է� : ");
		int num3 = sc.nextInt();
		CalcInterface ct = new CalcImpl();
		int result = ct.sum(num1, num2, num3);
		System.out.println(result);
	}
}
