package kh.java.test.function;

import java.util.Scanner;

public class Example 
{
	public void exam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("���� ���� �Է� : ");
		int korean = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		int en = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		int math = sc.nextInt();
		int sum = korean + en + math;
		double avg = (double)sum / 3;
		
		System.out.println("�հ� : "+sum);
		System.out.printf("��� : %.2f \n", avg);
		
		if ((korean & en & math) >= 40 && avg >= 60)
		{
			System.out.println("�հ�");
		}
		else
			System.out.println("���հ�");
	}
	public void exam2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է� : ");
		int num = sc.nextInt();
		if (num % 2 == 0)
		{
			System.out.println("¦��!!");
		}	
		else if (num % 2 != 0) 
		{
			System.out.println("Ȧ��!!");
		}
	}
}
