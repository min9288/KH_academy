package kh.java.run;

import kh.java.func.Animal;
import kh.java.func.AnimalMgr1;
import kh.java.func.AnimalMgr2;
import kh.java.func.Bear;
import kh.java.func.GenericEx1;
import kh.java.func.GenericEx2;
import kh.java.func.Tiger;

public class Run {

	public static void main(String[] args) {
//		GenericEx1<String> ge1 = new GenericEx1<String>();
//		GenericEx1<Integer> ge2 = new GenericEx1<Integer>();
//		ge1.setData("테스트");
//		ge2.setData(10);
//		String str1 = ge1.getData();
//		int no1 = ge2.getData();
		
//		GenericEx2<String, Integer> ge3 = new GenericEx2<String, Integer>();
		
		Tiger t = new Tiger(100);
		Bear b = new Bear(200);
//		AnimalMgr1 am1 = new AnimalMgr1(t);
//		AnimalMgr1 am2 = new AnimalMgr1(b);
//		am1.getData(); // t
//		am2.getData(); // b
//		Animal a1 = am1.getData();
//		Animal a2 = am2.getData();
//		((Tiger)a1).tigerFunction();
//		((Bear)a2).bearFunction1();
//		((Tiger)a2).tigerFunction(); // 이미 Bear 가 있기에, 실행하면 에러남.
		
//		Animal a = new Tiger(50);
//		a.getHp();
//		a.setHp(100);
//		((Tiger)a).tigerFunction();
		
		AnimalMgr2<Tiger> am3 = new AnimalMgr2<Tiger>(t);
		AnimalMgr2<Bear> am4 = new AnimalMgr2<Bear>(b);
		Tiger t1 = am3.getData();
		t1.tigerFunction();
		am4.getData().bearFunction1();
	}
}
