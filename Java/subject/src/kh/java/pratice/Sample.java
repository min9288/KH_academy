package kh.java.pratice;
import java.util.Scanner;

public class Sample 
{
	public void sample1() 
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("�����Է� : ");
		char ch = sc.next().charAt(0);
		System.out.printf(ch+"�� �����ڵ� �� : %d\n", (int)ch);
	}
	public void sample2()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("���� ���� �Է� : ");
		int korean = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		int math = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		int en = sc.nextInt();
		System.out.println("=========== ��� ===========");
		System.out.println("���� : "+(korean+math+en));
		System.out.printf("��� : %.2f",((korean+math+en) / (double)3));
	}
		
}
