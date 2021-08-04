package kh.java.func;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class ListClass {
	public void listTest1() {
		String[] str = new String[3];
		str[0] = "HI";
		str[1] = "Hello";
		str[2] = "안녕하세요";
//		str[3] = "반가워요";		// 배열 길이를 초과해서 에러 발생
		System.out.println("배열 전체 출력");
		for(int i = 0; i < str.length; i++) {
			System.out.println(str[i]);
		}
		ArrayList<String> list = new ArrayList<String>();
		System.out.println("\n리스트 길이 : "+list.size());
		list.add("HI");
		System.out.println("리스트 길이 : "+list.size());
		list.add("Hello");
		System.out.println("리스트 길이 : "+list.size());
		list.add("안녕하세요");
		System.out.println("리스트 길이 : "+list.size());
		list.add("반가워요");
		System.out.println("리스트 길이 : "+list.size());
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	public void liseTest2() {
		Scanner sc = new Scanner(System.in);
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(true) {
			System.out.print("리스트에 추가할 숫자 입력 : ");
			int num = sc.nextInt();
			list.add(num);
			System.out.print("종료하려면 1을 입력하세요 : ");
			int sel = sc.nextInt();
			
			if(sel == 1) {
				break;
			}
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	public void listTest3() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(10);
		list.add(5);
		list.add(100);
		list.add(55);
		list.add(80);
		System.out.println(list.get(2));
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {
			System.out.println((i + 1)+". "+list.get(i));
		}
		list.remove(3);			// 3번의 인덱스의 값을 삭제
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {		// 반복 4회
			System.out.println((i + 1)+". "+list.get(i));
		}
		int num = list.set(1, 2);			// 1번 인덱스의 값을 2로 변경, 변경 전 값을 리턴
		System.out.println("1번 인덱스 변경 전 값 : "+num);
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {		// 반복 4회
			System.out.println((i + 1)+". "+list.get(i));
		}
		Collections.sort(list);		// 오름차순 정렬 (다만, 내림차순은 없지만 reverse 를 사용하면 됨)
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {	
			System.out.println((i + 1)+". "+list.get(i));
		}
		Collections.reverse(list);
		System.out.println("\n리스트 전체 출력");
		for(int i = 0; i < list.size(); i++) {	
			System.out.println((i + 1)+". "+list.get(i));
		}
		System.out.println(list);
		list.clear();
		System.out.println(list);
		System.out.println(list.size());
	}
	public void listTest4() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("안녕하세요");
		list.add("오늘은");
		list.add("금요일 입니다");
		list.add("집에 가고 싶어요");
		// foreach 문 -> collection용 for문
		for(String str : list) {
			System.out.println(str);
		}
//		for(int i = 0; i < list.size(); i++) {
//			String str = list.get(i);
//			System.out.println(str);
//		}
	}
}
