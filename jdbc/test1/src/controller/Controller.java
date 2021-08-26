package controller;

import java.util.ArrayList;

import dao.Dao;
import vo.Memo;


public class Controller {
	public void main() {

		Dao dao = new Dao();
		Memo m = new Memo();
		m.setNo(101);
		m.setName("홍길동");
		m.setMsg("환영합니다");

		int result = dao.update(m);
//		if (result < 1) {
		if (result > 0) {
			System.out.println("변경 성공");
		} else {
			System.out.println("변경 실패");
		}

	}
}
