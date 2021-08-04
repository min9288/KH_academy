package kh.java.func;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ApiClass {
	public void math() {
		// 절대값
		System.out.println(Math.abs(-10));
		System.out.println(Math.abs(10));
		
		//올림, 버림, 반올림
		System.out.println(Math.ceil(10.1));
		System.out.println(Math.floor(10.9));
		System.out.println(Math.round(10.5));
		
		// 1.3456 -> 1.35
		// -> 134.56 -> 반올림 -> 135 -> 1.35
		System.out.println(Math.round(1.3456 * 100) / 100); // 반올림은 항상 정수로 리턴되니 안에 값 중 하나를 실수로 변경해줘야됨
		System.out.println(Math.round(1.3456 * 100) / (double) 100);
		
		// 랜덤 숫자
		System.out.println(Math.random()); // 0.0 ~ 1.0 사이의 임의값
		
		// 숫자 비교
		System.out.println(Math.max(50, 30)); // 둘 중 최대값
		System.out.println(Math.min(50, 30)); // 둘 중 최저값
	}
	public void calendar() {
		// Calendar 클래스는 생성자의 접근제어지시자가 protected
		// 객체를 만드는 getInstance 메소드를 제공
		Calendar today = Calendar.getInstance();
//		System.out.println(today.get(Calendar.YEAR)); 			// 년도
//		System.out.println(today.get(Calendar.MONTH)+1); 		// 월 -> 0 ~ 11로 리턴 -> 1이 아니라 0부터 시작
//		System.out.println(today.get(Calendar.DATE));			// 일
//		System.out.println(today.get(Calendar.AM_PM));			// AM = 0, PM = 1
//		System.out.println(today.get(Calendar.HOUR)); 			// 시간
//		System.out.println(today.get(Calendar.MINUTE));			// 분
//		System.out.println(today.get(Calendar.SECOND));			// 초
//		System.out.println(today.get(Calendar.DAY_OF_WEEK));	// 요일 ( 1 : 일요일 ~ 7 : 토요일 )
		
		Calendar day1 = Calendar.getInstance();
//		System.out.println(day1.get(Calendar.DATE));
//		System.out.println(day1.get(Calendar.DAY_OF_WEEK));
		day1.set(Calendar.MONTH, 9);	// 월을 10월로 변경
		day1.set(Calendar.DATE, 10);		// 일을 10일로 변경
//		System.out.println(day1.get(Calendar.MONTH) + 1);
//		System.out.println(day1.get(Calendar.DATE));
//		System.out.println(day1.get(Calendar.DAY_OF_WEEK));
		
		Calendar day2 = Calendar.getInstance();
		// day2 날짜 10월 1일로 변경
		day2.set(Calendar.MONTH, 9);
		day2.set(Calendar.DATE, 1);
		System.out.println(day2.get(Calendar.MONTH) + 1);
		System.out.println(day2.get(Calendar.DATE));
		// 컴퓨터가 시간을 계산하는 방법
		long time1 = day2.getTimeInMillis();		// 1960년 1월 1일 ~ day2의 시간까지 몇 ms가 흘렀는지 계산
		System.out.println("time1 : "+ time1);
		day2.set(Calendar.DATE, 2);
		long time2 = day2.getTimeInMillis();		// 1960년 1월 1일 ~ day2의 시간까지 몇 ms가 흘렀는지 계산
		System.out.println("time2 : "+ time2);
		System.out.println(time2 - time1);
	}
	public void date() {
		Date today = new Date();
		System.out.println(today);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초 EEE");
		String todayString = format1.format(today);
		System.out.println(todayString);
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE");
		String todayString2 = format2.format(today);
		System.out.println(todayString2);
		
		Calendar day = Calendar.getInstance();
		day.set(Calendar.MONTH, 9);
		day.set(Calendar.DATE, 1);
		long time = day.getTimeInMillis();
		Date d = new Date(time);
		System.out.println(d);
		
		String str = format1.format(d);
		System.out.println(str);
	}
	public void wrap() {
		// 정수형 변수 선언해서 10 대입
		int num = 10;
		System.out.println(num);
		// Wrapper 클래스 사용
		Integer num1 = new Integer(10); // boxing
		System.out.println(num1.intValue()); //unboxing
		// auto-boxing, auto-unboxing
		Integer num2 = 10;
		System.out.println(num2);
		Character ch = 'a';
		System.out.println(ch);
		
		// String -> 기본자료형으로 변경
		String str1 = "123";
		System.out.println(str1 + 1); // 1231
		
		int no = Integer.parseInt(str1);
		System.out.println(no + 1); //124
		
		String str2 = "123.222";
		double dNo = Double.parseDouble(str2);
		System.out.println(dNo);
		
		String str3 = "a";
		char ch1 = str3.charAt(0);  // '문자' 타입은 이미 기능이 존재하기에 parse 기능 없음.
		
		// 기본자료형 -> String 변경
		double dNo1 = 11.1;
		String str11 = Double.valueOf(dNo1).toString();
		String str111 = String.valueOf(dNo1);
		
		int iNo1 = 100;
		String str22 = Integer.valueOf(iNo1).toString();
		String str222 = String.valueOf(iNo1);
	}
}























