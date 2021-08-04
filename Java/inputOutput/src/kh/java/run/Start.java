package kh.java.run;

import kh.java.func.ByteStream;
import kh.java.func.CharStream;
import kh.java.func.StreamTest;
import kh.java.func.UserMgr;
import kh.java.func.UserMgrList;
import kh.java.func.fileTest;

public class Start {

	public static void main(String[] args) {
		ByteStream bs = new ByteStream();
//		bs.primaryStream();
		
		CharStream cs = new CharStream();
//		cs.subStream();
//		cs.charStreamReader();
		
		StreamTest st = new StreamTest();
//		st.test1();
//		st.test2();
	
		fileTest ft = new fileTest();
//		ft.fileTest();
		
		UserMgr um = new UserMgr();
//		um.test1();
//		um.test2();
		
		UserMgrList uml = new UserMgrList();
		uml.main();
	}

}
