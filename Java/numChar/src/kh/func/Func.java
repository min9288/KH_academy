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
		// 1.0 + 1.1 => 정수/실수 연산 시 정수를 실수로 변환하여 연산
		System.out.println(1 + '1');
		// 1 + 49 => 정수/문자 연산 시 문자를 정수로 변환하여 연산
		System.out.println(1.1 + '1');
		// 1.1 + 49.0 => 문자를 실수로 변환하여 연산  
	}
	public void print4() {
		System.out.println(1 + "1"); // => "1" + "1" = 11
		// 문자열은 다른 자료형과 더하기할때 최우선 순위로 문자열로 변환하여 더한다.
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
