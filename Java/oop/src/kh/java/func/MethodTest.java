package kh.java.func;

import java.util.Scanner;

public class MethodTest {
	public void main2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		// 두 수의 곱한값을 출력
		Calc c = new Calc(); 
		int result  = c.mulFunction(num1, num2);
		System.out.println(result);
	}
	public void main() {
		int[] arr = {1, 2, 3, 4, 5};
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] +" " );
		}
		System.out.println();
		test3(arr[2]);
		System.out.println(arr[2]);
		test4(arr);
		System.out.println(arr[2]);
	}
	public void test3(int num) {
		System.out.println(num);
		num += 100;
		System.out.println(num);
	}
	public void test4(int arr[]) {
		System.out.println(arr[2]);
		arr[2] += 100;
		System.out.println(arr[2]);
	}
	
	public void test() {
		Scanner sc = new Scanner(System.in);
		printMsg();
		System.out.print("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		
		System.out.print("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		// 두 정수의 합을 sum이라는 변수에 저장한 후 출력
		// 두 정수로 연산하는 코드가 100줄이라고 가정
		int sum = add(num1, num2);
		// 100줄 추가
		System.out.println(sum);
		System.out.print("세번째 정수 입력 : ");
		int num3 = sc.nextInt();
		System.out.print("네번째 정수 입력 : ");
		int num4 = sc.nextInt();
		
		int sum2 = add(num3, num4);
		System.out.println(sum2);
	}
	
	// 숫자 2개를 합쳐서 더한다.
	public int add(int su1, int su2) {
		int sum = su1 + su2;
		return sum;
	}
	
	public void printMsg() {
		System.out.println("ㅇㅇㅇㅇ");
	}
	public void test1() {
		int num1 = 10;
		int num2 = 20;
		methodTest(num1, num2);
	}
	public void methodTest(int num2, int num1) {
		System.out.println(num2);
		System.out.println(num1);
	}
}
