package kh.java.test.function;

import java.util.Scanner;

public class Example 
{
	public void exam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수 입력 : ");
		int korean = sc.nextInt();
		System.out.print("영어 점수 입력 : ");
		int en = sc.nextInt();
		System.out.print("수학 점수 입력 : ");
		int math = sc.nextInt();
		int sum = korean + en + math;
		double avg = (double)sum / 3;
		
		System.out.println("합계 : "+sum);
		System.out.printf("평균 : %.2f \n", avg);
		
		if ((korean & en & math) >= 40 && avg >= 60)
		{
			System.out.println("합격");
		}
		else
			System.out.println("불합격");
	}
	public void exam2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		if (num % 2 == 0)
		{
			System.out.println("짝수!!");
		}	
		else if (num % 2 != 0) 
		{
			System.out.println("홀수!!");
		}
	}
}
