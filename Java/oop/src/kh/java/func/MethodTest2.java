package kh.java.func;

import java.util.Scanner;

public class MethodTest2 {
	public void main() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("ù��° ���� �Է� : ");
		int num1 = sc.nextInt();
		System.out.println("�ι�° ���� �Է� : ");
		int num2 = sc.nextInt();
		Calc c = new Calc();
		int result = c.mulFunction(num1, num2);
		
		
		System.out.println("����° ���� �Է� : ");
		int num3 = sc.nextInt();
		int sum = add(num1, num2, num3);
		test1("hello", 1);
		test1(1, "hello");
		
	}
	public void test1(String str, int num) {
		
	}
	public void test1(int num, String str) {
		
	}
	// �Ű������� ���� ������ ��ģ ���� �����ϴ� �޼ҵ� // �ۼ� �޼ҵ�� add
	// �޼ҵ���� ���Ƶ� ��ǻ�Ͱ� �Ű������� ���� �Ǵ��ؼ� ���� ����. -> �����ε�
	public int add(int num1, int num2) {
		return num1 + num2;
	}
	public int add(int num1, int num2, int num3) {
		return num1 + num2 + num3;
	}
}
