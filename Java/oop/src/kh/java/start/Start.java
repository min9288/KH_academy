package kh.java.start;

import kh.java.func.Aclass;
import kh.java.func.Animal;
import kh.java.func.Bclass;
import kh.java.func.Calc;
import kh.java.func.Cat;
import kh.java.func.MethodTest;
import kh.java.func.TestClass3;
import kh.java.func.TestInterface;
import kh.java.func.Tiger;
import kh.java.func.Tv;

// 오버로딩 
//	-> 동일한 메소드명을 다시 사용하려고 할때
//	-> 메소드 이름은 동일하고 매개변수 부분으로 구분이 가능할때(매개변수 수, 매개변수 데이터 타입, 순서)

// 오버라이딩
//	-> 부모클래스에서 작성된 메소드를 상속한 자식 클래스에서 다시 정의해서 사용

public class Start {

	public static void main(String[] args) {
		
//		TestClass1 tc1 = new TestClass1();
//		tc1,testFunction();
//		TestClass tc2 = new TestClass1();
//		TestInterface ti = new TestInterface();
		TestClass3 tc3 = new TestClass3();
		TestInterface ti1 = new TestClass3();
		
		
//		Animal a1 = new Tiger();
//		Animal a2 = new Cat();
//		Animal a = new Cat();  //  up casting, "Animal"의 기능만 사용가능
//		((Cat)a).grooming(); // down casting, 자식형태로 형변환 해줌
	//	((Tiger)a).hunting(); // 오류남, 위에 cat으로 선언되어 있고 tiger로는 안되있으니 다운케스팅해도 기능 사용 못 함.
		
		
//		Animal a = new Animal();
//		a.breath();
//		Tiger t = new Tiger();
//		t.breath();
//		t.hunting();
//		Cat c = new Cat();
//		c.breath();
//		c.grooming();
//		
		
		
		
		
		
		
//		Aclass a = new Aclass();
//		a.setNum(100);
//		a.setNo(200);
//		System.out.println(a.getNum());
//		System.out.println(a.getNo());
//		
//		Bclass b = new Bclass();
//		b.setNum(100);
//		b.setNo(200);
//		b.setStr("hello");
//		System.out.println(b.getNum());
//		System.out.println(b.getNo());
//		System.out.println(b.getStr());
//		b.testMsg();
		
			
		//		new Tv().tv_channel_UP();
//		MethodTest mt = new MethodTest();
		
		// 기본생성자로 TV 객체 생성
//		Tv t1 = new Tv();
//		System.out.println("사이즈 : "+t1.getSize());
//		System.out.println("전원 : "+t1.getPower());
//		System.out.println("채널 : "+t1.getCh());
//		System.out.println("음량 : "+t1.getVol());
		// 매개변수 4개 있는 생성자로 TV 객체 생성
//		Tv t2 = new Tv(100, false, 30, 10);
//		System.out.println("사이즈 : "+t2.getSize());
//		System.out.println("전원 : "+t2.getPower());
//		System.out.println("채널 : "+t2.getCh());
//		System.out.println("음량 : "+t2.getVol());
//		//매개변수 1개 있는 생성자로 TV 객체 생성
//		Tv t3 = new Tv(20);
//		System.out.println("사이즈 : "+t3.getSize());
//		System.out.println("전원 : "+t3.getPower());
//		System.out.println("채널 : "+t3.getCh());
//		System.out.println("음량 : "+t3.getVol());
//		
		
		
//		mt.test();
//		mt.test1();
//		mt.main();
//		mt.main2();
		
//		Tv t1 = new Tv();
//		Tv t2 = new Tv();
//		Tv t3 = new Tv();
//		t2.tv_power();
//		t2.tv_channel_UP();
//		t2.tv_channel_UP();
//		t2.tv_channel_UP();
//		t2.tv_channel_UP();
//		t2.tv_volume_UP();
//		t2.tv_volume_UP();
//		t2.tv_volume_UP();
//		t2.tv_volume_UP();
//		t2.tv_volume_UP();
//		System.out.println("전원 : "+ t2.power);
//		System.out.println("전원 : "+ t2.power);

//		Tv t = new Tv();
////		System.out.println(t.vol);
//		t.tv_volume_UP();
//		System.out.println(t.vol);
//		t.vol = 100;
//		System.out.println(t.vol);
		
//		t.tv_volume_UP();
//		System.out.println(t.getVol());
//		System.out.println(t.getCh());
//		
//		t.setCh(100);

	}

}
