package kh.java.func;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ApiClass {
	public void math() {
		// ���밪
		System.out.println(Math.abs(-10));
		System.out.println(Math.abs(10));
		
		//�ø�, ����, �ݿø�
		System.out.println(Math.ceil(10.1));
		System.out.println(Math.floor(10.9));
		System.out.println(Math.round(10.5));
		
		// 1.3456 -> 1.35
		// -> 134.56 -> �ݿø� -> 135 -> 1.35
		System.out.println(Math.round(1.3456 * 100) / 100); // �ݿø��� �׻� ������ ���ϵǴ� �ȿ� �� �� �ϳ��� �Ǽ��� ��������ߵ�
		System.out.println(Math.round(1.3456 * 100) / (double) 100);
		
		// ���� ����
		System.out.println(Math.random()); // 0.0 ~ 1.0 ������ ���ǰ�
		
		// ���� ��
		System.out.println(Math.max(50, 30)); // �� �� �ִ밪
		System.out.println(Math.min(50, 30)); // �� �� ������
	}
	public void calendar() {
		// Calendar Ŭ������ �������� �������������ڰ� protected
		// ��ü�� ����� getInstance �޼ҵ带 ����
		Calendar today = Calendar.getInstance();
//		System.out.println(today.get(Calendar.YEAR)); 			// �⵵
//		System.out.println(today.get(Calendar.MONTH)+1); 		// �� -> 0 ~ 11�� ���� -> 1�� �ƴ϶� 0���� ����
//		System.out.println(today.get(Calendar.DATE));			// ��
//		System.out.println(today.get(Calendar.AM_PM));			// AM = 0, PM = 1
//		System.out.println(today.get(Calendar.HOUR)); 			// �ð�
//		System.out.println(today.get(Calendar.MINUTE));			// ��
//		System.out.println(today.get(Calendar.SECOND));			// ��
//		System.out.println(today.get(Calendar.DAY_OF_WEEK));	// ���� ( 1 : �Ͽ��� ~ 7 : ����� )
		
		Calendar day1 = Calendar.getInstance();
//		System.out.println(day1.get(Calendar.DATE));
//		System.out.println(day1.get(Calendar.DAY_OF_WEEK));
		day1.set(Calendar.MONTH, 9);	// ���� 10���� ����
		day1.set(Calendar.DATE, 10);		// ���� 10�Ϸ� ����
//		System.out.println(day1.get(Calendar.MONTH) + 1);
//		System.out.println(day1.get(Calendar.DATE));
//		System.out.println(day1.get(Calendar.DAY_OF_WEEK));
		
		Calendar day2 = Calendar.getInstance();
		// day2 ��¥ 10�� 1�Ϸ� ����
		day2.set(Calendar.MONTH, 9);
		day2.set(Calendar.DATE, 1);
		System.out.println(day2.get(Calendar.MONTH) + 1);
		System.out.println(day2.get(Calendar.DATE));
		// ��ǻ�Ͱ� �ð��� ����ϴ� ���
		long time1 = day2.getTimeInMillis();		// 1960�� 1�� 1�� ~ day2�� �ð����� �� ms�� �귶���� ���
		System.out.println("time1 : "+ time1);
		day2.set(Calendar.DATE, 2);
		long time2 = day2.getTimeInMillis();		// 1960�� 1�� 1�� ~ day2�� �ð����� �� ms�� �귶���� ���
		System.out.println("time2 : "+ time2);
		System.out.println(time2 - time1);
	}
	public void date() {
		Date today = new Date();
		System.out.println(today);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy��MM��dd�� HH��mm��ss�� EEE");
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
		// ������ ���� �����ؼ� 10 ����
		int num = 10;
		System.out.println(num);
		// Wrapper Ŭ���� ���
		Integer num1 = new Integer(10); // boxing
		System.out.println(num1.intValue()); //unboxing
		// auto-boxing, auto-unboxing
		Integer num2 = 10;
		System.out.println(num2);
		Character ch = 'a';
		System.out.println(ch);
		
		// String -> �⺻�ڷ������� ����
		String str1 = "123";
		System.out.println(str1 + 1); // 1231
		
		int no = Integer.parseInt(str1);
		System.out.println(no + 1); //124
		
		String str2 = "123.222";
		double dNo = Double.parseDouble(str2);
		System.out.println(dNo);
		
		String str3 = "a";
		char ch1 = str3.charAt(0);  // '����' Ÿ���� �̹� ����� �����ϱ⿡ parse ��� ����.
		
		// �⺻�ڷ��� -> String ����
		double dNo1 = 11.1;
		String str11 = Double.valueOf(dNo1).toString();
		String str111 = String.valueOf(dNo1);
		
		int iNo1 = 100;
		String str22 = Integer.valueOf(iNo1).toString();
		String str222 = String.valueOf(iNo1);
	}
}























