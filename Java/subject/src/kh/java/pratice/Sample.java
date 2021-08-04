package kh.java.pratice;
import java.util.Scanner;

public class Sample 
{
	public void sample1() 
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("문자입력 : ");
		char ch = sc.next().charAt(0);
		System.out.printf(ch+"의 유니코드 값 : %d\n", (int)ch);
	}
	public void sample2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수 입력 : ");
		int korean = sc.nextInt();
		System.out.print("수학 점수 입력 : ");
		int math = sc.nextInt();
		System.out.print("영어 점수 입력 : ");
		int en = sc.nextInt();
		System.out.println("=========== 결과 ===========");
		System.out.println("총점 : "+(korean+math+en));
		System.out.printf("평균 : %.2f",((korean+math+en) / (double)3));
	}
		
}
