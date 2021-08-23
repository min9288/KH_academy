package kr.or.iei.user.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import kr.or.iei.user.model.dao.UserDao;
import kr.or.iei.user.vo.User;

public class UserService {
	private UserDao dao;
	
	public UserService() {
		super();
		dao = new UserDao();
	}

	public User login(User user) {
		Connection conn = JDBCTemplate.getConnection();
		User u = dao.login(conn, user);
		JDBCTemplate.close(conn);
		return u;
	}
	
	public int checkId(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.checkId(conn, userId);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int join(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.join(conn, u);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
