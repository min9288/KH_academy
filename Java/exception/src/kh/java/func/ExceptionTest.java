package kh.java.func;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionTest {
	Scanner sc;

	public ExceptionTest() {
		super();
		sc = new Scanner(System.in);
	}

	public void test1() {
		while (true) {
			System.out.print("���� �Է� : ");
			int num = 0;
			try {
				// ������ �߻��� �� �ִ� ���ɼ��� �ִ� �ҽ��ڵ� �ۼ�
				num = sc.nextInt();
				System.out.println("�׽�����!!");
			} catch (Exception e) {
				// try ���� �� ������ �߻��ϸ� ������ ����
				System.out.println("�� �� �Է��ϼ̽��ϴ�, ������ �Է����ּ���.");
				sc.nextLine();
				continue;
			} finally {
				System.out.println("������ �����̿�");
			}
			System.out.println("�Է��Ͻ� ���ڴ� " + num + "�Դϴ�.");
		}

	}

	public void test2() {
//		System.out.print("ù��° ���ڸ� �Է��ϼ��� : ");
//		int num1 = sc.nextInt();
//		System.out.print("�ι�° ���ڸ� �Է��ϼ��� : ");
//		int num2 = sc.nextInt();

		// 0���� ������ ���� try&catch �� ó���ϴ°� �ƴ϶� if������ �������� ó���ϴ°� �������̴�.
//		if(num2 == 0) {
//			System.out.println("0���δ� ���� �� �����ϴ�.");
//		}else {
//			System.out.println("��� : " + num1 / num2);
//		}

		try {
			System.out.print("ù��° ���ڸ� �Է��ϼ��� : ");
			int num1 = sc.nextInt();
			System.out.print("�ι�° ���ڸ� �Է��ϼ��� : ");
			int num2 = sc.nextInt();
			System.out.println("��� : " + num1 / num2);
		} catch (ArithmeticException e) {
			System.out.println("0���� ���� �� �����ϴ�.");
			e.printStackTrace();
		} catch (InputMismatchException e) {
			System.out.println("������ �Է��� �����մϴ�.");
			e.printStackTrace();
		}
	}
	// ����ó���� 
	// 1. try & catch
	// 2. throws  
	public void main() {
		try {
			test3();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void test3() throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("test.txt");
	}
}
