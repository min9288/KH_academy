package kr.or.iei.func;

import java.util.ArrayList;

import kr.or.iei.vo.User;

public class Exam {
	public void exam1() {

		ArrayList<User> userList = new ArrayList<User>();
		User user1 = new User("user01", "1234", "����1", 23, "01022478875");
		User user2 = new User("user02", "1357", "����2", 27, "01095887774");
		User user3 = new User("user03", "2468", "����3", 34, "01036425456");

		userList.add(user1);
		userList.add(user2);
		userList.add(user3);

		System.out.println("���̵�\t��й�ȣ\t�̸�\t����\t��ȭ��ȣ");

		for(int i=0;i<userList.size(); i++) {

			User u = userList.get(i);

			System.out.println(u.getId()+"\t"+u.getPw()+"\t\t"+u.getName()+"\t"+u.getAge()+"\t"+u.getPhone());

			}
	}
}
