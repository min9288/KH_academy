package kh.java.func;

import java.util.Scanner;

public class ifTest 
{
	public void test1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자 10을 입력하세요 : ");
		int num = sc.nextInt();
		if(num == 10) {
			System.out.println("잘했어요!");
		}
		System.out.println("종료합니다..!");
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ 숫자 구별 프로그램 ============");
		System.out.print("임의의 정수를 입력 하세요 : ");
		int num = sc.nextInt();
		if(num > 0) {
			System.out.printf("당신이 입력한 수 %d은(는) 양수입니다.", num);
		}else if (num < 0){
			System.out.printf("당신이 입력한 수 %d은(는) 음수입니다.", num);
		}else {
			System.out.printf("당신이 입력한 수 %d은(는) %d입니다.", num, num);
		}
		
	}
	public void test3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ 두수 비교 프로그램 ============");
		System.out.print("첫번째 정수를 입력 하세요 : ");
		int num1 = sc.nextInt();
		System.out.print("첫번째 정수를 입력 하세요 : ");
		int num2 = sc.nextInt();
		if(num1 > num2) {
			System.out.println(num1+ ">" +num2);
			System.out.println("첫번째 수가 더 큽니다.");
		}else if(num1 == num2) {
			System.out.println(num1+ "=" +num2);
			System.out.println("두 수가 같습니다.");
		}else if(num1 < num2) {
			System.out.println(num1+ "<" +num2);
			System.out.println("두번째 수가 더 큽니다.");
		}
	
	}
	public void test4() {
		Scanner sc = new Scanner(System.in);
		System.out.println("============ 계산기 프로그램 ============");
		System.out.print("연산자를 입력하세요(+, -, *, /) : ");
		char oper = sc.next().charAt(0);
		System.out.print("첫번째 정수를 입력 하세요 : ");
		int num1 = sc.nextInt();
		System.out.print("첫번째 정수를 입력 하세요 : ");
		int num2 = sc.nextInt();
		if(oper == '+') {
			System.out.println(num1+"+"+num2+"="+ (num1 + num2));
		}else if(oper == '-') {
			System.out.println(num1+"-"+num2+"="+ (num1 - num2));
		}else if(oper == '*') {
			System.out.println(num1+"*"+num2+"="+ (num1 * num2));
	}else if(oper == '/') {
		System.out.printf("%d // %d = %.2f", num1, num2, ((double)num1 / num2));
	
		}
	}
	public void test5() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		if(num % 2 == 0 ) {
			System.out.print(num+"은(는) 짝수 입니다.");
		}else {
			System.out.print(num+"은(는) 홀수 입니다.");
		}
	}
	public void test6() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		if(num > 1000) {
			System.out.print("1000보다 큰 정수입니다.");
		}else if(num > 100) {
			System.out.print("100보다 큰 정수입니다.");
		}else if(num > 10) {
			System.out.print("10보다 큰 정수입니다.");
		}
	}
}
		
