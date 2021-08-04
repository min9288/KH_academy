package kh.java.func;

import java.util.Scanner;

public class WhileTest {
	public void test1() {
		
		int i = 0;
		while(i < 5) {
			System.out.println("안녕하세요");
			i++;
		}
	}
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("몇단을 출력하시겠습니까? ");
		int num = sc.nextInt();
		System.out.println(num+"단 입니다.");
		
		int i = 0;
		while (++i <= 9) {
			System.out.printf("%d * %d = %d \n", num, i, num * i);
		}
	}
	public void exam2() {
		Scanner sc = new Scanner(System.in);
		
		int i = 0;
		int num = 0;
		while (i <= 4) {
			System.out.print("정수 값을 입력하시오 : ");
			num += sc.nextInt();
			i++;
		}
		System.out.print("입력한 5개의 정수의 합 : "+ num);
	}
	public void exam3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 수 입력 : ");
		int num2 = sc.nextInt();
		
		int sum = 0;
		int start = num1 > num2 ? num2 : num1;
		int end = num1 < num2 ? num2 : num1;
		int i = start;
		while (i <= end) {
			sum += i;
			i++;
		}
		System.out.println("10 ~ 20의 정수의 합 : "+ sum);
	}
	public void exam4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("숫자 입력 : ");
		int num = sc.nextInt();
		
		int i = 1;
		int total = 0;
		while (i <= num) {
			if(i % 2 == 0) {
				total += i;
			}
			i++;
		}
		System.out.println("짝수들의 합은 : "+ total);
	}
	public void loop1() {
		Scanner sc = new Scanner(System.in);
		for(int i = 0; i < 5; i++) {
			System.out.println("i : "+ i);
			System.out.print("1 / 2 / 3 중 하나를 선택하세요 : ");
			int sel = sc.nextInt();
			if (sel == 1) {
				continue;
			}else if (sel == 2) {
				break;
			}else {
				System.out.println("그외 나머지");
			}
			System.out.println("반복문 마지막 줄코드");
		}
		System.out.println("반복문이 끝나면 출력!!!!!");
	}
	
}
