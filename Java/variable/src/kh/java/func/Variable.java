package kh.java.func;

public class Variable {
	public void var1() 
	{
		boolean bool;
		char ch;
		int num;
		double dNum;
		String name;
		
		num = 10;
		System.out.println(num);
		dNum = 100.1;
		System.out.println(dNum);
		ch = 'A';
		System.out.println(ch);
		bool = true;
		System.out.println(bool);
		name = "���ο�";
		System.out.println(name);
	}
	public void var2() 
	{
		int num1 = 2147483647;
		int result1 = num1 + 1;
		System.out.println(result1);
		long result2 = (long) num1 + 1;
		System.out.println(result2);
		byte test1 = 10;
		byte test2 = 20;
		byte r = (byte) (test1 + test2);
		System.out.println(r);
	}
	public void print()
	{
		System.out.println("���� ����ϰ� ���� �ٷ� �̵�");
		System.out.println("�ι�° ��");
		System.out.print("����° ��"); // -ln �Ⱥپ \n ����� �ȵ�
		System.out.println("�׹�° ��????");
		
		String name = "���ο�";
		int age = 30;
		System.out.printf("�� �̸��� %s�̰�, ���̴� %d�� �Դϴ�.\n", name, age);
		System.out.println("�� �̸��� "+name+"�̰�, ���̴�"+age+"�Դϴ�.");
	}
	public void print2() 
	{
		System.out.println("�ȳ��ϼ�\t��");
		System.out.println("�ȳ��ϼ�\n��");
		System.out.println("\\");
		System.out.println("�ȳ���\"����");
		System.out.println("�ȳ���\'����");
	}
}
