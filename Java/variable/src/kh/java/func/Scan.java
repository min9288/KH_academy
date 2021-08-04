package kh.java.func;
import java.util.Scanner;

public class Scan 
{
	public void test1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		System.out.println("당신이 입력한 수는 : "+num);
		System.out.print("실수 입력 : ");
		double d = sc.nextDouble();
		System.out.println("당신이 입력한 수는 : "+d);
		System.out.print("문자열 입력1 : ");
		String str = sc.next();
		System.out.println(str);
		System.out.print("문자열 입력2 : ");
		sc.nextLine();  // 위에 next가 사용한 버퍼를 비운다.
		String str1 = sc.nextLine();
		System.out.println(str1);
		System.out.print("문자 입력 : ");
		char ch = sc.next().charAt(0);
		System.out.println(ch);
	}
	public void scanExam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		System.out.print("키 입력 : ");
		double height = sc.nextDouble();
		System.out.print("몸무게 : ");
		double weight = sc.nextDouble();
		System.out.print("성별 : ");
		char gender = sc.next().charAt(0);
		
		System.out.println("이름 : "+ name);
		System.out.println("나이 : "+ age);
		System.out.println("주소 : "+ addr);
		System.out.println("키 : "+ (int)height);
		System.out.printf("몸무게 : %.1f\n", weight);
		System.out.println("성별 : "+ gender);
	}
	public void scanExam2()
	{
		Scanner sc = new Scanner(System.in);
		int lan = sc.nextInt();
		int mat = sc.nextInt();
		int en = sc.nextInt();
		int result = lan + mat + en;
		double avg = (double)result / 3;
		System.out.printf("당신 성적의 총합은 %d점이고, 평균은 %.2f입니다!", result, avg);
	} 
}
