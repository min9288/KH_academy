package kr.or.iei.func;

import java.util.Scanner;

public class Question {
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		int num[] = new int[5];
		int temp = 0;
		int sum = 0;
		
		for(int i = 0; i < num.length; i++) {
			System.out.print((i + 1) +"��° ���� �Է� : ");
			num[i] = sc.nextInt();
			sum += num[i];
		}
		for(int i = 0; i < num.length; i++) {
			for(int j = 0; j < num.length - 1 ; j++) {
				if(num[j] > num[j+1]) {
					temp = num[j];
					num[j] = num[j+1];
					num[j+1] = temp;
				}
			}
		}
		System.out.print("���� ��� :\t" );
		for(int i = 0; i < num.length; i++) {
			System.out.print(num[i] + "\t");
		}
		System.out.println();
		System.out.println("�Է��� ���� �� ���� : "+ sum);
	}
	
}
