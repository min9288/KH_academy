package kh.java.func;

import java.util.Scanner;

public class SwitchTest {
	public void test1( ) {
		Scanner sc = new Scanner(System.in);
		System.out.print("1 ~ 3 사이의 정수를 입력하세요 : ");
		int num = sc.nextInt();
		switch (num) {
		case 1:
			System.out.println("1을 입력하였습니다.");
			break;
		case 2:
			System.out.println("2를 입력하였습니다.");
			break;
		case 3:
			System.out.println("3을 입력하였습니다.");
			break;
		default :
			System.out.println("잘 못 입력하였습니다.");
			break;
		}
	}
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("월을 입력하세요 : ");
		int month = sc.nextInt();
		switch(month) {
		case 2 :
			System.out.println("28일");
			break;
		case 1 :
		case 3 :
		case 5 :
		case 8 :
			System.out.println("내 생일");
		case 10 :
		case 12 :
			System.out.println("31일");
			break;
		case 4 :
			break;
		case 7 :
			break;
		case 9 :
			break;
		case 11 :
			System.out.println("30일");
			break;
	
		}
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("문자 입력: ");
		char ch = sc.next().charAt(0);
		switch(ch) {
		case 'a' :
			System.out.println("AAAAAAAa");
			break;
		case 'b' :
			System.out.println("Abbbbbbb");
			break;
		case 99 :
			System.out.println("cccccccc");
			break;
		}
	}
}
		
		
//		if (num == 1) {
//			System.out.println("1을 입력하였습니다.");
//		}else if (num == 2) {
//			System.out.println("2입력!!");
//		}else if(num == 2) {
//			System.out.println("3이네요");
//		}else {
//			System.out.println("잘 못 입력하였습니다.");
//		}
//	}

