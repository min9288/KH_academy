package kh.java.func;

import java.util.Scanner;

public class subject_210716 {
	public void subject1() {
		Scanner sc = new Scanner(System.in);
		System.out.println("========== ���̰��� ���α׷� ==========");
		System.out.print("�����Ͻ� �� �ο��� ����Դϱ�? : ");
		int allVisitor = sc.nextInt();
		System.out.print("��� ����Դϱ�? : ");
		int adult = sc.nextInt();
		System.out.print("���̴� ����Դϱ�? : ");
		int children = sc.nextInt();
		
		if(allVisitor == (adult + children)) {
			System.out.printf("�����Ͻ� �� �ݾ��� %d�� �Դϴ�.\n", (15000 * adult) + (5000 * children));
		}else {
			System.out.println("�ο����� ���� �ʽ��ϴ�.");
		}
	}
	public void subject2() {
		int correctAnswer = 0;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("================ ���� ���α׷� ================");
		System.out.println("ù��° ����");
		System.out.print("����� ����� �����ϱ��? (1. apple | 2. ��Ƽ�� �⽺) : ");
		int first_choice = sc.nextInt();
		if(first_choice == 1) {
			System.out.println("����!");
			++correctAnswer;
		}else {
			System.out.println("��!");
		}
		
		System.out.println("�ι�° ����");
		System.out.print("�ٳ����� ��� ������ ���� ������? (1. ��� | 2. ����) : ");
		int second_choice = sc.nextInt();
		if(second_choice == 2) {
			System.out.println("����!");
			++correctAnswer;
		}else {
			System.out.println("��!");
		}
		System.out.printf("�� %d������ ������ϴ�.\n", correctAnswer);
	}
	public void subject3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("================ �ɸ��׽�Ʈ ================");
		System.out.print("����� ���� �����Ͻʴϱ�? (1. yes | 2. no) : ");
		int first_choice = sc.nextInt();
		if(first_choice == 1) {
		System.out.print("����� ��踦 �ǿ�ϱ�? (1. yes | 2. no) : ");
		int sub_first_choice = sc.nextInt();
			if(sub_first_choice == 1) {
				System.out.print("���� �ǰ��� ���� �ʽ��ϴ�.");
			}else {
				System.out.print("���� ���� ���� �ʽ��ϴ�.");
			}
		}else if(first_choice == 2) {
			System.out.print("����� �̼�ģ���� �ֽ��ϱ�? (1. yes | 2. no) : ");
			int sub_second_choice = sc.nextInt();
			if(sub_second_choice == 1) {
				System.out.print("��...");
			}else {
				System.out.print("���� ������..^��^");
			}
		}
	}
	public void transCase() {
		Scanner sc = new Scanner(System.in);
		System.out.println("================ ��/�ҹ��� ��ȯ ���α׷� ================");
		System.out.print("�����Է� : ");
		char ch = sc.next().charAt(0);
		System.out.println("======= ��� =======");
		
		if(ch >= 'a' && ch <= 'z') {
			System.out.println("�ҹ��� �Դϴ�.");
			System.out.println("�빮�ڷ� ��ȯ : "+(char) (ch - 32));
		}else if (ch >= 'A' && ch <= 'Z') {
			System.out.println("�빮�� �Դϴ�.");
			System.out.println("�ҹ��ڷ� ��ȯ : "+(char) (ch + 32));
		}else {
			System.out.println("�� �� �Է��ϼ̽��ϴ�. �����ڸ� �Է����ּ���.");
		}
	}
	public void multiple() {
		Scanner sc = new Scanner(System.in);
		System.out.print("�����Է� : ");
		int num = sc.nextInt();
		System.out.println("======= ��� =======");
		
		if(num == 0) {
			System.out.printf("[%d]��(��) ����� ����� �ƴմϴ�.", num);
		}else if(num % 3 != 0 && num % 4 != 0) {
			System.out.printf("[%d]��(��) 3�� ����� 4�� ����� �ƴմϴ�.", num);
		}else if(num % 3 == 0 && num % 4 == 0) {
			System.out.printf("[%d]��(��) 3�� ����鼭 4�� ����Դϴ�.", num);
		}else if(num % 3 == 0) {
			System.out.printf("[%d]��(��) 3�� ����Դϴ�.", num);
		}else if(num % 4 == 0) {
			System.out.printf("[%d]��(��) 4�� ����Դϴ�.", num);
		}
		
	}
	public void test4() {
		int num1 = 100;
		int num2 = 0;
		
		if(num1 == 100) {
			num2 = 10;
		}
		System.out.println(num1);
		System.out.println(num2);
	}
}
