package kh.java.func;

import java.util.Scanner;

public class WhileTest {
	public void test1() {
		
		int i = 0;
		while(i < 5) {
			System.out.println("�ȳ��ϼ���");
			i++;
		}
	}
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("����� ����Ͻðڽ��ϱ�? ");
		int num = sc.nextInt();
		System.out.println(num+"�� �Դϴ�.");
		
		int i = 0;
		while (++i <= 9) {
			System.out.printf("%d * %d = %d \n", num, i, num * i);
		}
	}
	public void exam2() {
		Scanner sc = new Scanner(System.in);
		
		int i = 0;
		int num = 0;
		while (i <= 4) {
			System.out.print("���� ���� �Է��Ͻÿ� : ");
			num += sc.nextInt();
			i++;
		}
		System.out.print("�Է��� 5���� ������ �� : "+ num);
	}
	public void exam3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("ù��° �� �Է� : ");
		int num1 = sc.nextInt();
		System.out.print("�ι�° �� �Է� : ");
		int num2 = sc.nextInt();
		
		int sum = 0;
		int start = num1 > num2 ? num2 : num1;
		int end = num1 < num2 ? num2 : num1;
		int i = start;
		while (i <= end) {
			sum += i;
			i++;
		}
		System.out.println("10 ~ 20�� ������ �� : "+ sum);
	}
	public void exam4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է� : ");
		int num = sc.nextInt();
		
		int i = 1;
		int total = 0;
		while (i <= num) {
			if(i % 2 == 0) {
				total += i;
			}
			i++;
		}
		System.out.println("¦������ ���� : "+ total);
	}
	public void loop1() {
		Scanner sc = new Scanner(System.in);
		for(int i = 0; i < 5; i++) {
			System.out.println("i : "+ i);
			System.out.print("1 / 2 / 3 �� �ϳ��� �����ϼ��� : ");
			int sel = sc.nextInt();
			if (sel == 1) {
				continue;
			}else if (sel == 2) {
				break;
			}else {
				System.out.println("�׿� ������");
			}
			System.out.println("�ݺ��� ������ ���ڵ�");
		}
		System.out.println("�ݺ����� ������ ���!!!!!");
	}
	
}
