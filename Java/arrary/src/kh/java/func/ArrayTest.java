package kh.java.func;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;
import java.util.stream.Stream;

public class ArrayTest {
	public void test1() {
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		int num4 = 4;
		int num5 = 5;
		System.out.println("변수로 출력");
		System.out.println(num1);
		System.out.println(num2);
		System.out.println(num3);
		System.out.println(num4);
		System.out.println(num5);
		
		int arr1[] = new int[5];
		arr1[0] = 1;
		arr1[1] = 2;
		arr1[2] = 3;
		arr1[3] = 4;
		arr1[4] = 5;
		System.out.println("배열로 출력");
		System.out.println(arr1[0]);
		System.out.println(arr1[1]);
		System.out.println(arr1[2]);
		System.out.println(arr1[3]);
		System.out.println(arr1[4]);
		System.out.println("배열로 출력");
		for(int i = 0; i < 5; i++)
			System.out.println(arr1[i]);
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		//정수형 변수 5개 선언한 후 사용자한테 입력 값 받기
		System.out.print("1번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("2번째 정수 입력 : ");
		int num2 = sc.nextInt();
		System.out.print("3번째 정수 입력 : ");
		int num3 = sc.nextInt();
		System.out.print("4번째 정수 입력 : ");
		int num4 = sc.nextInt();
		System.out.print("5번째 정수 입력 : ");
		int num5 = sc.nextInt();
		//배열을 이용해서 사용자한테 정수 값 5개 입력받기
		int arr[] = new int[5];
		for(int i = 0; i < 5; i++) {
			System.out.print((i + 1) + "번째 정수 입력 : ");
			arr[i] = sc.nextInt();
		}
	}
	public void test3() {
		// 정수형 배열 선언해서 1, 2, 3, 4, 5 순서대로 넣기
		
		// 1) 배열 선언 후 인덱스로 넣기
		int arr[] = new int[5];
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		// 2) 배열 선언 후 인덱스로 넣기 (for문 사용)
		int arr2[] = new int[5];
		for(int i = 0; i < 5; i++) {
			arr2[i] = (i + 1);
		}
		// 3) 초기화 값으로 배열 값 대입하기 
		int arr3[] = {1, 2, 3, 4, 5};
		System.out.println("arr 출력");
		for(int i = 0; i < 5; i++) {
			System.out.println(arr[i] + "\t");
		}
		System.out.println();
		System.out.println("arr2 출력");
		for(int i = 0; i < 5; i++ ) {
			System.out.println(arr2[i] + "\t");
		}
		System.out.println();
		System.out.println("arr3 출력");
		for(int i = 0; i < 5; i++ ) {
			System.out.println(arr3[i] + "\t");
		}
	}
	public void test4() {
		// 길이가 3인 문자열 배열을 선언한 후 Hi, Hello, 안녕하세요
		// 인덱스 이용, {} 이용 // for문 사용 제외
		
		String arr[] = {"Hi", "Hello", "안녕하세요"};
		System.out.println("arr 출력");
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+"\t");
		}
		System.out.println();
	}
	public void exam1() {
		String arr[] = {"딸기", "복숭아", "키위", "사과", "바나나"};
		System.out.println("< 배열 인덱스로 출력 >");
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);
		System.out.println(arr[3]);
		System.out.println(arr[4]);
		System.out.println("< for 문을 이용한 배열 출력 >");
		for(int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}
	public void exam2() {
		int arr[] = new int[100];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = i + 1;
			System.out.println(arr[i]);
		}
	}
	public void exam3() {
		Scanner sc = new Scanner(System.in);
		int arr[] = new int[4];
		System.out.print("국어 점수 입력 : ");
		arr[0] = sc.nextInt();
		System.out.print("영어 점수 입력 : ");
		arr[1] = sc.nextInt();
		System.out.print("수학 점수 입력 : ");
		arr[2] = sc.nextInt();
		arr[3] = (arr[0] + arr[1] + arr[2]);
		double avg = (double) arr[3] / 3;
		
		
		System.out.println("국어 : "+arr[0]);
		System.out.println("영어 : "+arr[1]);
		System.out.println("수학 : "+arr[2]);
		System.out.println("합계 : "+arr[3]);
		System.out.printf("평균 : %.2f", avg);
	}
	public void exam4() {
		// 길이가 5인 정수형 배열을 생성
		// 반복문을 이용해서 숫자를 5개 입력받아 배열에 저장
		// 반복문을 이용해서 배열 전체 출력
		Scanner sc = new Scanner(System.in);
		int arr[] = new int[5];
		int temp = 0;
		
		for(int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "번째 숫자 입력 : ");
			arr[i] = sc.nextInt();
		}
		// 정렬(낮은수가 앞으로 -> 큰수가 뒤로)
		// 선택정렬, 삽입정렬, 퀵정렬, 버블정렬
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr.length - 1; j++) {
				if(arr[j] > arr[j + 1]) {
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
		//반복문을 이용해서 배열 전체 출력 (오름차순)
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+"\t");
		}
	}
	public void exam5() {
		// 길이가 5인 정수형 배열 선언
		// 반복문을 이용해서 숫자를 입력받음
		// 버블 정렬을 이용해서 정렬 작은 수가 가장 뒤로, 큰 수가 가장 앞으로
		// 반복문 이용해서 출력
		Scanner sc = new Scanner(System.in);
		int arr[] = new int[5];
		int temp = 0;
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "번째 숫자 입력 : ");
			arr[i] = sc.nextInt();
		}
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr.length - 1; j++) {
				if(arr[j] < arr[j + 1]) {
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+"\t");
		}
	}
	public void exam6() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		boolean bool = true;
		int userNum[] = new int[6];
		int comNum[] = new int[6];
		
		while(bool) {
			int count = 0;
			
			System.out.println("================ 로또 프로그램 ================");
			for(int i = 0; i < userNum.length; i++) {
				System.out.print((i + 1) + "번째 번호 입력(1 ~ 45) : ");
				int inputNum = sc.nextInt();
				if (1 <= inputNum && inputNum <= 45) {
					boolean bool2 = true;
					for(int j = 0; j < userNum.length; j++) {
						if(inputNum == userNum[j]) {
							System.out.println("이미 중복된 번호입니다. 다시 입력해주세요.");
							i--;
							bool2 = false;
							break;
						}
					}
					if(bool2) {
						userNum[i] = inputNum;
					}
				}else if (inputNum > 45) {
					System.out.println("잘 못 입력하셨습니다. 1 ~ 45 중 한개를 입력해 주세요");
					i--;
				}
			}
			System.out.println("사용자 번호");
			for(int i = 0; i < userNum.length; i++) {
			System.out.print(userNum[i]+"\t");
			}
			System.out.println();
			
			boolean bool3 = true;
			int randomNum = 0;
			for(int i = 0; i < comNum.length; i++) {
				randomNum = r.nextInt(45) + 1;
				for(int j = 0; j < comNum.length; j++) {					
					if(comNum[j] == randomNum) {
						i--;
						bool3 = false;
						break;
					}
				}
				if(bool3) {
					comNum[i] = randomNum;
				}
			}
			System.out.println("컴퓨터 번호");
			for(int i = 0; i < comNum.length; i++) {
					System.out.print(comNum[i]+"\t");
			}
			for(int i = 0; i < userNum.length; i++) {
				for(int j = 0; j < comNum.length; j++) {
					if(userNum[i] == comNum[j]) {
						count++;
						break;
					}
				}
			}
			System.out.println();
			System.out.println("맞은 개수 : "+count);
			if(count < 3) {
				System.out.print("꽝");
			}else if(count == 6) {
				System.out.print("1등!!");
			}else if(count == 5) {
				System.out.print("2등!!");
			}else if(count == 4) {
				System.out.print("3등!!");
			}else if(count == 3) {
				System.out.print("4등!!");
			}
			System.out.println();
			System.out.print("한번 더 하시겠습니까? (1. yes / 2. no) : ");
			int choice = sc.nextInt();
			if(choice == 1) {
				continue;
			}else if(choice == 2) {
				System.out.print("프로그램을 종료합니다.");
				bool = false;
			}
		}
	}
	public void exam7() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		int number_of_times = 1;
		boolean bool = true;
		int userNum[] = new int[6];
		int comNum[] = new int[6];
		
		System.out.println("================ 로또 프로그램 ================");
		for(int i = 0; i < userNum.length; i++) {
			System.out.print((i + 1) + "번째 번호 입력(1 ~ 45) : ");
			int inputNum = sc.nextInt();
			if (1 <= inputNum && inputNum <= 45) {
				boolean bool2 = true;
				for(int j = 0; j < userNum.length; j++) {
					if(inputNum == userNum[j]) {
						System.out.println("이미 중복된 번호입니다. 다시 입력해주세요.");
						i--;
						bool2 = false;
						break;
					}
				}
				if(bool2) {
					userNum[i] = inputNum;
				}
			}else if (inputNum > 45) {
				System.out.println("잘 못 입력하셨습니다. 1 ~ 45 중 한개를 입력해 주세요");
				i--;
			}
		}
			while(bool) {
			int count = 0;
			System.out.println("사용자 번호");
			for(int i = 0; i < userNum.length; i++) {
			System.out.print(userNum[i]+"\t");
			}
			System.out.println();
			
			int randomNum = 0;
			for(int i = 0; i < userNum.length; i++) {
				boolean bool3 = true;
				randomNum = r.nextInt(45) + 1;
				for(int j = 0; j < userNum.length; j++) {					
					if(comNum[j] == randomNum) {
						i--;
						bool3 = false;
						break;
					}
				}
				if(bool3) {
					comNum[i] = randomNum;
				}
			}
			System.out.println("컴퓨터 번호");
			for(int i = 0; i < comNum.length; i++) {
					System.out.print(comNum[i]+"\t");
			}
			for(int i = 0; i < userNum.length; i++) {
				for(int j = 0; j < comNum.length; j++) {
					if(userNum[i] == comNum[j]) {
						count++;
						break;
					}
				}
			}
			System.out.println();
			System.out.println("맞은 개수 : "+count);
			if(count < 3) {
				System.out.print("꽝");
			}else if(count == 6) {
				System.out.print("1등!!");
			}else if(count == 5) {
				System.out.print("2등!!");
			}else if(count == 4) {
				System.out.print("3등!!");
			}else if(count == 3) {
				System.out.print("4등!!");
			}
			System.out.println();
			System.out.println("실행횟수 : "+number_of_times);
			if(count != 6) {
				number_of_times++;
				continue;
			}else {
				bool = false;
			}
		}
	}
	public void test5() {
		// 배열 얇은복사
		int arr1[] = {1, 2, 3, 4, 5};
		int arr2[] = arr1;
		System.out.println("arr1 주소 : "+ arr1.hashCode());
		System.out.println("arr2 주소 : "+ arr2.hashCode());
	}
	public void test6() {
		
		int arr1[] = {1, 2, 3, 4, 5};
		// 배열 깊은복사 1) 반복문
		int arr2[] = new int[arr1.length];
		for(int i = 0; i < arr2.length; i++) {
			arr2[i] = arr1[i];
		}
		System.out.println("arr1 주소 : "+ arr1.hashCode());
		System.out.println("arr2 주소 : "+ arr2.hashCode());
		for(int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + "\t");
		}
		System.out.println();
		for(int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + "\t");
		}
		System.out.println();
		arr1[0] = 100;
		System.out.println(arr1[0]);
		System.out.println(arr2[0]);
	}
	public void test7() {
		int arr1[] = {1, 2, 3, 4, 5};
		int arr2[] = new int[10]; // 0 ~ 9
		// 복사할 데이터가 저장되어있는 주소, 복사하려는 데이터의 시작 인덱스 번호
		// 복사한 데이터가 들어갈 배열 주소, 데이터가 들어갈 시작 인덱스 번호
		// 복사할 데이터 길이
		System.arraycopy(arr1, 0, arr2, 2, 3);
		for(int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
	}
	public void test8() {
		int arr1[] = {1, 2, 3, 4, 5};
		int arr2[] = arr1.clone();
		System.out.println("arr1 주소 : "+ arr1.hashCode());
		for(int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		System.out.println("arr2 주소 : "+ arr2.hashCode());
		for(int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
	}
	public void test9() {
		int arr[][] = new int[2][3];
		arr[0][0] = 100;
		arr[0][1] = 200;
		arr[0][2] = 300;
		arr[1][0] = 400;
		arr[1][1] = 500;
		arr[1][2] = 600;
		
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
	}
	public void test10() {
		int arr[][] = new int[3][3];
		int num = 1;
//		arr[0][0] = 1;
//		arr[0][1] = 2;
//		arr[0][2] = 3;
//		arr[1][0] = 4;
//		arr[1][1] = 5;
//		arr[1][2] = 6;
//		arr[2][0] = 7;
//		arr[2][1] = 8;
//		arr[2][2] = 9;
		
//		for(int i = 0; i < arr.length; i++) {
//			for(int j = 0; j < arr[i].length; j++) {
//				System.out.print(arr[i][j]+" ");
//			}
//			System.out.println();
//		}
		
//		for(int i = 0; i < arr.length; i++) {
//			for(int j = 0; j < arr[i].length; j++) {
//				arr[i][j] += num;
//				num++;
//			}
//		}
//		for(int i = 0; i < arr.length; i++) {
//			for(int j = 0; j < arr[i].length; j++) {
//				System.out.print(arr[i][j]+" ");
//			}
//			System.out.println();
//		}
		
		for(int i = 0; i < 1; i++) {
			for(int j = 0; j < 3; j++) {
				arr[i][j] += num;
				num++;
			}
		}
		for(int i = 0; i < 1; i++) {
			for(int j = 0; j < 3; j++) {
				arr[1][j] += num;
				num++;
			}
		}
		for(int i = 0; i < 1; i++) {
			for(int j = 0; j < 3; j++) {
				arr[2][j] += num;
				num++;
			}
		}
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
	}
	public void twoDimensional_ArrayExam1() {
		int arr[][] = new int[5][5];
		int num = 5;
		int temp = 0;
		
		for(int i = 0; i < arr.length; i++) {
			temp = num * (i + 1);
			for(int j = 0; j < arr[i].length; j++) {
				arr[i][j] = temp--;
			}
		}
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	public void twoDimensional_ArrayExam2() {
		int arr[][] = new int[5][5];
		int num = 0;
		
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				arr[i][j] = i + (j * 5) + 1;
			}
		}
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	public void twoDimensional_ArrayExam3() {
		int arr[][] = new int[5][5];
		int num = 0;
		int temp = 0;
		
		for(int i = 0; i < 5; i++) {
			num = (5 - i);
			arr[i][0] = num;
			for(int j = 1; j < 5; j++) {
				num += 5; 
				arr[i][j] = num;  
			}
		}
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
	}
	public void twoDimensional_ArrayExam4() {
		int arr[][] = new int[5][5];
		int num = 1;
		int temp = 0;
		
		for(int i = 0; i < 5; i++) {
			if( i % 2 != 0) 
				num += 5;
			for(int j = 0; j < 5; ++j) {
				if(i % 2 == 0) {
					arr[i][j] = num++;
				}
				else
					arr[i][j] = --num;
			}
			if(i % 2 != 0) {
				num += 5;
			}
		}
		
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	public void twoDimensionalArray_deepenExam00() {
		Scanner sc = new Scanner(System.in);
		System.out.print("2차원 배열 크기 입력(정방향) > ");
		int value = sc.nextInt();
		int arr[][] = new int[value][value];
		
		int x = 0;
		int y = 0;
		int num = 1;
		int f = value;
		
		for(int i = 0; i < (2 * value - 1); i++) {
			switch (i % 4) {
			case 0: // right way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					x++;
					num++;
				}
				x--;
				y++;
				f--;
				break;
			case 1: // under way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					y++;
					num++;
				}
				y--;
				x--;
				break;
			case 2: // left way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					x--;
					num++;
				}
				x++;
				y--;
				f--;
				break;
			case 3: // up way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					y--;
					num++;
				}
				x++;
				y++;
				break;
			}
		}
		for(int i = 0; i < value; i++) {
			for(int j = 0; j < value; j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	public void twoDimensionalArray_deepenExam01() {
		Scanner sc = new Scanner(System.in);
		System.out.print("2차원 배열 크기 입력(역방향) > ");
		int value = sc.nextInt();
		int arr[][] = new int[value][value];
		
		int x = value - 1;
		int y = 0;
		int num = 1;
		int f = value;
		
		for(int i = 0; i < (2 * value - 1); i++) {
			switch (i % 4) {
			case 0: // left way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					x--;
					num++;
				}
				x++;
				y++;
				f--;
				break;
			case 1: // under way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					y++;
					num++;
				}
				x++;
				y--;
				break;
			case 2: // right way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					x++;
					num++;
				}
				x--;
				y--;
				f--;
				break;
			case 3: // up way
				for (int k = 0; k < f; k++) {
					arr[y][x] = num;
					y--;
					num++;
				}
				x--;
				y++;
				break;
			}
		}
		for(int i = 0; i < value; i++) {
			for(int j = 0; j < value; j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	
}
