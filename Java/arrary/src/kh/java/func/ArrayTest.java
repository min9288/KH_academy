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
		System.out.println("������ ���");
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
		System.out.println("�迭�� ���");
		System.out.println(arr1[0]);
		System.out.println(arr1[1]);
		System.out.println(arr1[2]);
		System.out.println(arr1[3]);
		System.out.println(arr1[4]);
		System.out.println("�迭�� ���");
		for(int i = 0; i < 5; i++)
			System.out.println(arr1[i]);
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		//������ ���� 5�� ������ �� ��������� �Է� �� �ޱ�
		System.out.print("1��° ���� �Է� : ");
		int num1 = sc.nextInt();
		System.out.print("2��° ���� �Է� : ");
		int num2 = sc.nextInt();
		System.out.print("3��° ���� �Է� : ");
		int num3 = sc.nextInt();
		System.out.print("4��° ���� �Է� : ");
		int num4 = sc.nextInt();
		System.out.print("5��° ���� �Է� : ");
		int num5 = sc.nextInt();
		//�迭�� �̿��ؼ� ��������� ���� �� 5�� �Է¹ޱ�
		int arr[] = new int[5];
		for(int i = 0; i < 5; i++) {
			System.out.print((i + 1) + "��° ���� �Է� : ");
			arr[i] = sc.nextInt();
		}
	}
	public void test3() {
		// ������ �迭 �����ؼ� 1, 2, 3, 4, 5 ������� �ֱ�
		
		// 1) �迭 ���� �� �ε����� �ֱ�
		int arr[] = new int[5];
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		// 2) �迭 ���� �� �ε����� �ֱ� (for�� ���)
		int arr2[] = new int[5];
		for(int i = 0; i < 5; i++) {
			arr2[i] = (i + 1);
		}
		// 3) �ʱ�ȭ ������ �迭 �� �����ϱ� 
		int arr3[] = {1, 2, 3, 4, 5};
		System.out.println("arr ���");
		for(int i = 0; i < 5; i++) {
			System.out.println(arr[i] + "\t");
		}
		System.out.println();
		System.out.println("arr2 ���");
		for(int i = 0; i < 5; i++ ) {
			System.out.println(arr2[i] + "\t");
		}
		System.out.println();
		System.out.println("arr3 ���");
		for(int i = 0; i < 5; i++ ) {
			System.out.println(arr3[i] + "\t");
		}
	}
	public void test4() {
		// ���̰� 3�� ���ڿ� �迭�� ������ �� Hi, Hello, �ȳ��ϼ���
		// �ε��� �̿�, {} �̿� // for�� ��� ����
		
		String arr[] = {"Hi", "Hello", "�ȳ��ϼ���"};
		System.out.println("arr ���");
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+"\t");
		}
		System.out.println();
	}
	public void exam1() {
		String arr[] = {"����", "������", "Ű��", "���", "�ٳ���"};
		System.out.println("< �迭 �ε����� ��� >");
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);
		System.out.println(arr[3]);
		System.out.println(arr[4]);
		System.out.println("< for ���� �̿��� �迭 ��� >");
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
		System.out.print("���� ���� �Է� : ");
		arr[0] = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		arr[1] = sc.nextInt();
		System.out.print("���� ���� �Է� : ");
		arr[2] = sc.nextInt();
		arr[3] = (arr[0] + arr[1] + arr[2]);
		double avg = (double) arr[3] / 3;
		
		
		System.out.println("���� : "+arr[0]);
		System.out.println("���� : "+arr[1]);
		System.out.println("���� : "+arr[2]);
		System.out.println("�հ� : "+arr[3]);
		System.out.printf("��� : %.2f", avg);
	}
	public void exam4() {
		// ���̰� 5�� ������ �迭�� ����
		// �ݺ����� �̿��ؼ� ���ڸ� 5�� �Է¹޾� �迭�� ����
		// �ݺ����� �̿��ؼ� �迭 ��ü ���
		Scanner sc = new Scanner(System.in);
		int arr[] = new int[5];
		int temp = 0;
		
		for(int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "��° ���� �Է� : ");
			arr[i] = sc.nextInt();
		}
		// ����(�������� ������ -> ū���� �ڷ�)
		// ��������, ��������, ������, ��������
		for(int i = 0; i < arr.length; i++) {
			for(int j = 0; j < arr.length - 1; j++) {
				if(arr[j] > arr[j + 1]) {
					temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
		//�ݺ����� �̿��ؼ� �迭 ��ü ��� (��������)
		for(int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+"\t");
		}
	}
	public void exam5() {
		// ���̰� 5�� ������ �迭 ����
		// �ݺ����� �̿��ؼ� ���ڸ� �Է¹���
		// ���� ������ �̿��ؼ� ���� ���� ���� ���� �ڷ�, ū ���� ���� ������
		// �ݺ��� �̿��ؼ� ���
		Scanner sc = new Scanner(System.in);
		int arr[] = new int[5];
		int temp = 0;
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "��° ���� �Է� : ");
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
			
			System.out.println("================ �ζ� ���α׷� ================");
			for(int i = 0; i < userNum.length; i++) {
				System.out.print((i + 1) + "��° ��ȣ �Է�(1 ~ 45) : ");
				int inputNum = sc.nextInt();
				if (1 <= inputNum && inputNum <= 45) {
					boolean bool2 = true;
					for(int j = 0; j < userNum.length; j++) {
						if(inputNum == userNum[j]) {
							System.out.println("�̹� �ߺ��� ��ȣ�Դϴ�. �ٽ� �Է����ּ���.");
							i--;
							bool2 = false;
							break;
						}
					}
					if(bool2) {
						userNum[i] = inputNum;
					}
				}else if (inputNum > 45) {
					System.out.println("�� �� �Է��ϼ̽��ϴ�. 1 ~ 45 �� �Ѱ��� �Է��� �ּ���");
					i--;
				}
			}
			System.out.println("����� ��ȣ");
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
			System.out.println("��ǻ�� ��ȣ");
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
			System.out.println("���� ���� : "+count);
			if(count < 3) {
				System.out.print("��");
			}else if(count == 6) {
				System.out.print("1��!!");
			}else if(count == 5) {
				System.out.print("2��!!");
			}else if(count == 4) {
				System.out.print("3��!!");
			}else if(count == 3) {
				System.out.print("4��!!");
			}
			System.out.println();
			System.out.print("�ѹ� �� �Ͻðڽ��ϱ�? (1. yes / 2. no) : ");
			int choice = sc.nextInt();
			if(choice == 1) {
				continue;
			}else if(choice == 2) {
				System.out.print("���α׷��� �����մϴ�.");
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
		
		System.out.println("================ �ζ� ���α׷� ================");
		for(int i = 0; i < userNum.length; i++) {
			System.out.print((i + 1) + "��° ��ȣ �Է�(1 ~ 45) : ");
			int inputNum = sc.nextInt();
			if (1 <= inputNum && inputNum <= 45) {
				boolean bool2 = true;
				for(int j = 0; j < userNum.length; j++) {
					if(inputNum == userNum[j]) {
						System.out.println("�̹� �ߺ��� ��ȣ�Դϴ�. �ٽ� �Է����ּ���.");
						i--;
						bool2 = false;
						break;
					}
				}
				if(bool2) {
					userNum[i] = inputNum;
				}
			}else if (inputNum > 45) {
				System.out.println("�� �� �Է��ϼ̽��ϴ�. 1 ~ 45 �� �Ѱ��� �Է��� �ּ���");
				i--;
			}
		}
			while(bool) {
			int count = 0;
			System.out.println("����� ��ȣ");
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
			System.out.println("��ǻ�� ��ȣ");
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
			System.out.println("���� ���� : "+count);
			if(count < 3) {
				System.out.print("��");
			}else if(count == 6) {
				System.out.print("1��!!");
			}else if(count == 5) {
				System.out.print("2��!!");
			}else if(count == 4) {
				System.out.print("3��!!");
			}else if(count == 3) {
				System.out.print("4��!!");
			}
			System.out.println();
			System.out.println("����Ƚ�� : "+number_of_times);
			if(count != 6) {
				number_of_times++;
				continue;
			}else {
				bool = false;
			}
		}
	}
	public void test5() {
		// �迭 ��������
		int arr1[] = {1, 2, 3, 4, 5};
		int arr2[] = arr1;
		System.out.println("arr1 �ּ� : "+ arr1.hashCode());
		System.out.println("arr2 �ּ� : "+ arr2.hashCode());
	}
	public void test6() {
		
		int arr1[] = {1, 2, 3, 4, 5};
		// �迭 �������� 1) �ݺ���
		int arr2[] = new int[arr1.length];
		for(int i = 0; i < arr2.length; i++) {
			arr2[i] = arr1[i];
		}
		System.out.println("arr1 �ּ� : "+ arr1.hashCode());
		System.out.println("arr2 �ּ� : "+ arr2.hashCode());
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
		// ������ �����Ͱ� ����Ǿ��ִ� �ּ�, �����Ϸ��� �������� ���� �ε��� ��ȣ
		// ������ �����Ͱ� �� �迭 �ּ�, �����Ͱ� �� ���� �ε��� ��ȣ
		// ������ ������ ����
		System.arraycopy(arr1, 0, arr2, 2, 3);
		for(int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
	}
	public void test8() {
		int arr1[] = {1, 2, 3, 4, 5};
		int arr2[] = arr1.clone();
		System.out.println("arr1 �ּ� : "+ arr1.hashCode());
		for(int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		System.out.println("arr2 �ּ� : "+ arr2.hashCode());
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
		System.out.print("2���� �迭 ũ�� �Է�(������) > ");
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
		System.out.print("2���� �迭 ũ�� �Է�(������) > ");
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
