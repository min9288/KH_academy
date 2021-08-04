package kh.java.func;

import java.util.Random;
import java.util.StringTokenizer;


public class StringClass {
	public void test1() {
		StringBuffer sb = new StringBuffer();
		System.out.println(sb.length());	// 저장된 문자열 길이
		sb.append("hi");					// 현재 저장된 문자열 끝에 매개변수로 전달된 값 추가
		System.out.println(sb.toString());
		sb.append(" 안녕");
		System.out.println(sb.toString());
		sb.append(" test");
		System.out.println(sb.toString());
		sb.insert(3, "삽입구문 ");
		System.out.println(sb.toString());
		sb.insert(8, "여기 ");
		System.out.println(sb.toString());
		sb.replace(0, 2, "수정구문"); // 0~1 까지 바뀜, for(int i=0; i < 2; i++) 이렇게 생각하면 됨.
		System.out.println(sb.toString());
		sb.delete(5, 8); // 5 ~ 7 까지 삭제, for(int i = 5; i < 7; i++) 이렇게 생각하면 됨.
		System.out.println(sb.toString());
		sb.reverse();
		System.out.println(sb.toString());
		sb.reverse();
		System.out.println(sb.toString());
		
		Random r = new Random();
		StringBuffer joinCode = new StringBuffer();
		for(int i = 0; i < 6; i++) {
			int num = r.nextInt(10);
			joinCode.append(num);
		}
		System.out.println(joinCode);
	}
	public void test2() {
		String str = "이윤수/서울/강사";
		StringTokenizer sT = new StringTokenizer(str, "/");
		while(sT.hasMoreTokens()) {
			String str1 = sT.nextToken();
			System.out.println(str1);
		}
//		System.out.println(" 토큰 수 : "+sT.countTokens());
//		System.out.println("토큰이 남아있는지 확인 : "+sT.hasMoreTokens());
//		String str1 = sT.nextToken();  // 가장 앞의 토큰을 꺼내옴
//		System.out.println("첫번째 토큰 값 : "+str1);
//		System.out.println(" 토큰 수 : "+sT.countTokens());
//		System.out.println("토큰이 남아있는지 확인 : "+sT.hasMoreTokens());
//		String str2 = sT.nextToken();
//		System.out.println("두번째 토큰 값 : "+str2);
//		System.out.println(" 토큰 수 : "+sT.countTokens());
//		System.out.println("토큰이 남아있는지 확인 : "+sT.hasMoreTokens());
//		String str3 = sT.nextToken();
//		System.out.println("세번째 토큰 값 : "+str3);
//		System.out.println(" 토큰 수 : "+sT.countTokens());
//		System.out.println("토큰이 남아있는지 확인 : "+sT.hasMoreTokens());
//		String str4 = sT.nextToken();
//		System.out.println("네번째 토큰 값 : "+str4); // 꺼내올 수 있는 토큰이 없으니 오류 발생
	}
	public void exam() {
		String str = "J a v a P r o g r a m";
		StringTokenizer sT = new StringTokenizer(str, " ");
		while(sT.hasMoreTokens()) {
			char ch = sT.nextToken().charAt(0);
			if(ch >= 'a' && ch <= 'z') {
				ch -= 32;
			}
			System.out.print(ch);
//			String str1 = sT.nextToken();
//			System.out.print(str1.toUpperCase());
		}	
	}
}
