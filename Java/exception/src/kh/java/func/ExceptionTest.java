package kh.java.func;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionTest {
	Scanner sc;

	public ExceptionTest() {
		super();
		sc = new Scanner(System.in);
	}

	public void test1() {
		while (true) {
			System.out.print("숫자 입력 : ");
			int num = 0;
			try {
				// 에러가 발생할 수 있는 가능성이 있는 소스코드 작성
				num = sc.nextInt();
				System.out.println("테스문구!!");
			} catch (Exception e) {
				// try 실행 중 에러가 발생하면 실행할 구문
				System.out.println("잘 못 입력하셨습니다, 정수만 입력해주세요.");
				sc.nextLine();
				continue;
			} finally {
				System.out.println("무조건 실행이여");
			}
			System.out.println("입력하신 숫자는 " + num + "입니다.");
		}

	}

	public void test2() {
//		System.out.print("첫번째 숫자를 입력하세요 : ");
//		int num1 = sc.nextInt();
//		System.out.print("두번째 숫자를 입력하세요 : ");
//		int num2 = sc.nextInt();

		// 0으로 나누는 것은 try&catch 로 처리하는게 아니라 if문으로 논리적으로 처리하는게 보편적이다.
//		if(num2 == 0) {
//			System.out.println("0으로는 나눌 수 없습니다.");
//		}else {
//			System.out.println("결과 : " + num1 / num2);
//		}

		try {
			System.out.print("첫번째 숫자를 입력하세요 : ");
			int num1 = sc.nextInt();
			System.out.print("두번째 숫자를 입력하세요 : ");
			int num2 = sc.nextInt();
			System.out.println("결과 : " + num1 / num2);
		} catch (ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다.");
			e.printStackTrace();
		} catch (InputMismatchException e) {
			System.out.println("정수만 입력이 가능합니다.");
			e.printStackTrace();
		}
	}
	// 예외처리는 
	// 1. try & catch
	// 2. throws  
	public void main() {
		try {
			test3();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void test3() throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("test.txt");
	}
}
