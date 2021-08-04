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
		name = "정민우";
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
		System.out.println("값을 출력하고 다음 줄로 이동");
		System.out.println("두번째 줄");
		System.out.print("세번째 줄"); // -ln 안붙어서 \n 기능이 안됨
		System.out.println("네번째 줄????");
		
		String name = "정민우";
		int age = 30;
		System.out.printf("내 이름은 %s이고, 나이는 %d세 입니다.\n", name, age);
		System.out.println("내 이름은 "+name+"이고, 나이는"+age+"입니다.");
	}
	public void print2() 
	{
		System.out.println("안녕하세\t요");
		System.out.println("안녕하세\n요");
		System.out.println("\\");
		System.out.println("안녕하\"세요");
		System.out.println("안녕하\'세요");
	}
}
