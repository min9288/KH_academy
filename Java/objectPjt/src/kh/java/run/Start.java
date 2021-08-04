package kh.java.run;

import java.util.Scanner;

import kh.java.func.ApiClass;
import kh.java.func.StringClass;
import kh.java.func.TestClass;

public class Start {

	public static void main(String[] args) {
		
//		TestClass tc = new TestClass();
//		System.out.println(tc);
//		System.err.println(tc.toString());
//		String str = "test";
//		System.out.println(str);
//		System.out.println(str.toString());
//		
//		int [] arr = {1, 2, 3, 4, 5};
//		int [] arr1 = arr.clone();
//		try {
//			TestClass tc1 = (TestClass) (tc.clone());
//		} catch (CloneNotSupportedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		StringClass sc = new StringClass();
//		sc.test1();
//		sc.test2();
//		sc.exam();
		
		ApiClass ac = new ApiClass();
//		ac.math();
//		ac.calendar();
//		ac.date();
		ac.wrap();
		
		

	}

}
