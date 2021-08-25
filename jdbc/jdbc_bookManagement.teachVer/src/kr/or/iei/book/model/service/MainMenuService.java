package kr.or.iei.book.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import kr.or.iei.book.model.dao.MainMenuDao;
import kr.or.iei.book.model.dao.MemberDao;
import kr.or.iei.book.vo.Member;

public class MainMenuService {
	private MainMenuDao mainDao;
	
	public MainMenuService() {
		super();
		mainDao = new MainMenuDao();
	}
	
	public Member login(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		Member mem = mainDao.login(conn, m);
		JDBCTemplate.close(conn);
		return mem;
	}
	
	public int checkId(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int count = mainDao.checkId(conn, memberId);
		if (count > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return count;
	}

	public int join(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mainDao.join(conn, m);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
}
