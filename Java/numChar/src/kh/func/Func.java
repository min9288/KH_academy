package kh.func;

public class Func {
	public void print1() {
		System.out.println(1);
		System.out.println(1.0);
		System.out.println('1');
		System.out.println("1");
	}
	public void print2() {
		System.out.println(1 + 1);
		System.out.println(1.0 + 1.0);
		System.out.println('1' + '1'); //98
		System.out.println("1" + "1"); //11
	}
	public void print3() {
		System.out.println(1 + 1.1);
		// 1.0 + 1.1 => ����/�Ǽ� ���� �� ������ �Ǽ��� ��ȯ�Ͽ� ����
		System.out.println(1 + '1');
		// 1 + 49 => ����/���� ���� �� ���ڸ� ������ ��ȯ�Ͽ� ����
		System.out.println(1.1 + '1');
		// 1.1 + 49.0 => ���ڸ� �Ǽ��� ��ȯ�Ͽ� ����  
	}
	public void print4() {
		System.out.println(1 + "1"); // => "1" + "1" = 11
		// ���ڿ��� �ٸ� �ڷ����� ���ϱ��Ҷ� �ֿ켱 ������ ���ڿ��� ��ȯ�Ͽ� ���Ѵ�.
		System.out.println(1.0 + "1"); // => "1.0" + "1" = 1.01
		System.out.println('1' + "1"); // => "1" + "1" = 11
	}
	public void print5() {
		System.out.println("Hello" + 10);
		System.out.println(10 + "Hello");
		System.out.println(10 + 20 + "Hello");
		System.out.println(10 + (20 + "Hello"));
	}
}
