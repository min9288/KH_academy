package kh.java.func;
import java.util.Scanner;

public class Scan 
{
	public void test1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է� : ");
		int num = sc.nextInt();
		System.out.println("����� �Է��� ���� : "+num);
		System.out.print("�Ǽ� �Է� : ");
		double d = sc.nextDouble();
		System.out.println("����� �Է��� ���� : "+d);
		System.out.print("���ڿ� �Է�1 : ");
		String str = sc.next();
		System.out.println(str);
		System.out.print("���ڿ� �Է�2 : ");
		sc.nextLine();  // ���� next�� ����� ���۸� ����.
		String str1 = sc.nextLine();
		System.out.println(str1);
		System.out.print("���� �Է� : ");
		char ch = sc.next().charAt(0);
		System.out.println(ch);
	}
	public void scanExam1()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("�̸� �Է� : ");
		String name = sc.next();
		System.out.print("���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("�ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
		System.out.print("Ű �Է� : ");
		double height = sc.nextDouble();
		System.out.print("������ : ");
		double weight = sc.nextDouble();
		System.out.print("���� : ");
		char gender = sc.next().charAt(0);
		
		System.out.println("�̸� : "+ name);
		System.out.println("���� : "+ age);
		System.out.println("�ּ� : "+ addr);
		System.out.println("Ű : "+ (int)height);
		System.out.printf("������ : %.1f\n", weight);
		System.out.println("���� : "+ gender);
	}
	public void scanExam2()
	{
		Scanner sc = new Scanner(System.in);
		int lan = sc.nextInt();
		int mat = sc.nextInt();
		int en = sc.nextInt();
		int result = lan + mat + en;
		double avg = (double)result / 3;
		System.out.printf("��� ������ ������ %d���̰�, ����� %.2f�Դϴ�!", result, avg);
	} 
}
