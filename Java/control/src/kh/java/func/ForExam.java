package kh.java.func;

import java.util.Scanner;

public class ForExam {
	public void exam1() {
		Scanner sc = new Scanner(System.in);
		
		for (int i = 2; i <= 9; i++) {
			if(i == 2) {
			System.out.printf("<%d´Ü>\n", i);
			}
			for(int j = 1; j <= 9; j++) {
				if(i >= 3 && j == 1) {
					System.out.printf("\n<%d´Ü>\n", i);
				}
				System.out.printf("%d * %d = %d\t", i, j, i * j);
				
			}
		}
		
	}
	public void exam2() {
		Scanner sc = new Scanner(System.in);
		
		for (int i = 1; i <= 9; i++) {
			System.out.printf("\n");
			
			for(int j = 2; j <= 9; j++) {
				System.out.printf("%d * %d = %d\t", j, i, i * j);
				
			}
		}
	}
	public void q1() {
		for (int i = 0; i < 5; i++) {
			System.out.print("*");
		}
	}
	public void q2() {
		for (int i = 0; i < 5; i++) {
			System.out.println("*");
		}
	}
	public void q3() {
		for (int i = 0; i < 5; i++) {
	
			for(int j = 0; j < 5; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q4() {
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < 5; j++) {
				System.out.print(i + 1);
			}
			System.out.println();
		}
	}
	public void q5() {
		for(int i = 0; i < 5; i++) {
			for(int j = 1; j <= 5; j++) {
				System.out.print(j);
			}
			System.out.println();
		}
	}
	public void q6() {		
		for(int i = 0; i < 5; i++) {
			for(int j = 1; j <= 5; j++) {
				System.out.print(i + j);
			}
			System.out.println();
		}
	}
	public void q7() {
		for(int i = 5; i > 0; i--) {
			for(int j = 0; j < 5; j++) {
				System.out.print(i + j);
			}
			System.out.println();
		}
	}
	public void q8() {
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q9() {
		for(int i = 4; i >= 0; i--) {
			for(int j = 0; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q10() {
		for(int i = 0; i <= 5; i++) {
			for(int j = 0; j < i; j++) {
				System.out.print(" ");
			}
			for(int k = 5; k > i; k--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q11() {
		for(int i = 1; i <= 5; i++) {
			for(int j = 5; j > i; j--) {
				System.out.print(" ");
			}
			for(int k = 0; k < i; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
//	public void q12() {
//		for(int i = 0; i < 5; i++) {
//			for(int j = 0; j <= i; j++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
//		for(int i = 1; i < 5; i++) {
//			for(int j = 0; j < 5 - i; j++) {
//				System.out.print("*");
//			}
//			System.out.println();
//		}
//	}
//	public void q12() {
//		for(int i = 0; i < 10; i++) {
//			if( i < 5) {
//				for(int j = 0; j < i; j++) {
//					System.out.print("*");
//				}
//			}else {
//				for(int k = 0; k < 10 - i; k++) {
//					System.out.print("*");
//				}
//			}
//			System.out.println();
//		}
//	}
	public void q12() {
		for(int i = 0; i < 10; i++) {
			for(int j = 0; (i < 5) ? j < i : j < 10 - i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q13() {
		for(int i = 0; i < 5; i++) {
			for(int j = 5; j > i; j--) {
				System.out.print("*");
			}
			System.out.println();
		}
		for(int i = 1; i < 5; i++) {
			for(int j = 0; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q16() {
		for(int i = 0; i < 5; i++) {
			for(int j = 1; j < 5 - i; j++) {
				System.out.print(" ");
			}
			for(int k = 0; k < i * 2 + 1; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q17() {
		for(int i = 5; i > 0; i--) {
			for(int j = 5 - i; j > 0; j--) {
				System.out.print(" ");
			}
			for(int k = i * 2 - 1; k > 0; k--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q18() {
		for(int i = 0; i < 5; i++) {
			for(int j = 1; j < 5 - i; j++) {
				System.out.print(" ");
			}
			for(int k = 0; k < i * 2 + 1; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		for(int i = 4; i > 0; i--) {
			for(int j = 5 - i; j > 0; j--) {
				System.out.print(" ");
			}
			for(int k = i * 2 - 1; k > 0; k--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q19() {
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < 5 - i; j++) {
				System.out.print("*");
			}
			for(int k = 0; k < i * 2 + 1; k++) {
				System.out.print(" ");
			}
			for(int l = 0; l < 5 - i; l++) {
				System.out.print("*");	
			}
			System.out.println();
		}
		for(int i = 1; i < 5; i++) {
			for(int j = 0;  j < i + 1 ; j++) {
				System.out.print("*");
			}
			for(int k = 10 - (i * 2); k > 1; k--) {
				System.out.print(" ");
			}
			for(int j = 0;  j < i + 1 ; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q20() {
		for(int i = 0; i < 5; i++) {
			for(int j = 0; j < (i + 1); j++) {
				System.out.print("*");
			}
			for(int k = 10; k > i * 2 + 1; k--) {
				System.out.print(" ");
			}
			for(int j = 0; j < (i + 1); j++) {
				System.out.print("*");	
			}
			System.out.println();
		}
		for(int i = 0; i < 4; i++) {
			for(int j = 4; j > i ; j--) {
				System.out.print("*");
			}
			for(int k = 0; k < (i * 2 + 3); k++) {
				System.out.print(" ");
			}
			for(int j = 4; j > i ; j--) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	public void q21() {
		for(int i = 1; i < 6; i++) {
			for(int j = 1; j < (i + 1); j++) {
				System.out.print(" ");
			}
			for(int k = 12; k > (i * 2 + 1); k--) {
				System.out.print("*");
			}
			for(int l = 1; l < (i + 1); l++) {
				System.out.print(" ");
			}
			System.out.println();
		}
		for(int i = 1; i < 5; i++) {
			for(int j = 8; j > i + 3; j--) {
				System.out.print(" ");
			}
			for(int k = 0; k < i * 2 + 1; k++) {
				System.out.print("*");
			}
			for(int l = 8; l > i + 3; l--) {
				System.out.print(" ");
			}
			System.out.println();
			}
		}
}
