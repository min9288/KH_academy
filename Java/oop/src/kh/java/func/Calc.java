package kh.java.func;

import java.util.Scanner;

public class Calc {
	public void main() {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° ���� �Է� : ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° ���� �Է� : ");
		int num2 = sc.nextInt();
		int result1 = addFunction(num1, num2); // �μ��� ���� ���� ����
		int result2 = subFunction(num1, num2); // �μ� �� 
		int result3 = mulFunction(num1, num2); // �μ� ��
		double result4 = divFunction(num1, num2); // ������
		System.out.println(result1); // 13
		System.out.println(result2); // 7
		System.out.println(result3); // 30
		System.out.println(result4); // 3.333333
	}
	public int addFunction(int num1, int num2) {
		return (num1 + num2);
	}
	public int subFunction(int num1, int num2) {
		return (num1 - num2);
	}
	public int mulFunction(int num1, int num2) {
		return (num1 * num2);
	}
	public double divFunction(double num1, double num2) {
		return ((double)(num1 / num2));
	}
}
