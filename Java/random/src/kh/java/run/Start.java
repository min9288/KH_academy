package kh.java.run;

import kh.java.func.RandomTest;
import kh.java.func.randomExam;

public class Start {

	public static void main(String[] args) {
		RandomTest rt = new RandomTest();
//		rt.test1();
//		rt.coin();
//		rt.rps();
//		rt.rps2();
		
		randomExam re = new randomExam();
//		re.UPDownGame();
//		re.BaskinRobbins_31_Game();
		re.Dice_Game();
	}

}
