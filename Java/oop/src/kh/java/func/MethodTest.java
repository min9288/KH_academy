package kh.java.func;

import java.util.Scanner;

public class MethodTest {
	public void main2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° ���� �Է� : ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° ���� �Է� : ");
		int num2 = sc.nextInt();
		// �� ���� ���Ѱ��� ���
		Calc c = new Calc(); 
		int result  = c.mulFunction(num1, num2);
		System.out.println(result);
	}
	public void main() {
		int[] arr = {1, 2, 3, 4, 5};
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] +" " );
		}
		System.out.println();
		test3(arr[2]);
		System.out.println(arr[2]);
		test4(arr);
		System.out.println(arr[2]);
	}
	public void test3(int num) {
		System.out.println(num);
		num += 100;
		System.out.println(num);
	}
	public void test4(int arr[]) {
		System.out.println(arr[2]);
		arr[2] += 100;
		System.out.println(arr[2]);
	}
	
	public void test() {
		Scanner sc = new Scanner(System.in);
		printMsg();
		System.out.print("ù��° ���� �Է� : ");
		int num1 = sc.nextInt();
		
		System.out.print("�ι�° ���� �Է� : ");
		int num2 = sc.nextInt();
		// �� ������ ���� sum�̶�� ������ ������ �� ���
		// �� ������ �����ϴ� �ڵ尡 100���̶�� ����
		int sum = add(num1, num2);
		// 100�� �߰�
		System.out.println(sum);
		System.out.print("����° ���� �Է� : ");
		int num3 = sc.nextInt();
		System.out.print("�׹�° ���� �Է� : ");
		int num4 = sc.nextInt();
		
		int sum2 = add(num3, num4);
		System.out.println(sum2);
	}
	
	// ���� 2���� ���ļ� ���Ѵ�.
	public int add(int su1, int su2) {
		int sum = su1 + su2;
		return sum;
	}
	
	public void printMsg() {
		System.out.println("��������");
	}
	public void test1() {
		int num1 = 10;
		int num2 = 20;
		methodTest(num1, num2);
	}
	public void methodTest(int num2, int num1) {
		System.out.println(num2);
		System.out.println(num1);
	}
}
