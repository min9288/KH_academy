package kh.java.func;

import java.util.Scanner;

public class Oper 
{
	public void test1()
	{
//		int num = 10;
//		System.out.println("num : "+num);
//		num++;
//		System.out.println("num : "+num);
//		++num;
//		System.out.println("num : "+num);
//		num--;
//		System.out.println("num : "+num);
//		--num;
//		System.out.println("num : "+num);
//		int num1 = 10;
//		int num2 = (++num1) + 2;
//		System.out.println("num1 : "+num1);
//		System.out.println("num2 : "+num2);
		
//		int a = 10;
//		int b = 20;
//		int c = (a++) + (++b) + a; // 10 + 21 + 11 = 42
//		System.out.println(a);
//		System.out.println(b);
//		System.out.println(c);
		
//		int a = 40, b = 20;
//		a += b;
//		System.out.printf("a의 값 : %d, b의 값 : %d\n", a, b);
//		a -= b;
//		System.out.printf("a의 값 : %d, b의 값 : %d\n", a, b);
//		b *= a;
//		System.out.printf("a의 값 : %d, b의 값 : %d\n", a, b);
//		b /= a;
//		System.out.printf("a의 값 : %d, b의 값 : %d\n", a, b);
		
//		Scanner sc = new Scanner(System.in);
//		System.out.print("첫번째 수 입력 : ");
//		int first = sc.nextInt();
//		System.out.print("두번째 수 입력 : ");
//		int second = sc.nextInt();
//		System.out.println("=========== 결과 ============");
//		System.out.println("두 수를 더한 수 : " + (first + second));
//		System.out.println("두 수를 뺀 수 : " + (first - second));
//		System.out.println("두 수를 곱한 수 : " + (first * second));
//		System.out.printf("두 수를 나눈 수 : %.2f", (double)first / second);
		
//		int a = 10, b = 20, c = 30, d = 40;
//		boolean result1, result2;
//		result1 = ((a < 20 && b > 10) && (c == 20 || d == 40));
//		result2 = ((a == 10 && b != 2 * 10) || (c == 30 && d != 40));
//		System.out.printf("첫번째 결과값 : %b \n", result1);
//		System.out.printf("두번째 결과값 : %b \n", result2);
		
		Scanner sc = new Scanner(System.in);
		System.out.print("나이를 입력하세요 : ");
		int age = sc.nextInt();
		if(age > 19)
		{
			System.out.println("성인입니다. 어서오세요.");
		}
		else
			System.out.println("미성년자는 입장불가입니다.");
		
	}
}
