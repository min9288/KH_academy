package service;

import java.sql.Connection;

import common.JDBCTemplate;
import dao.MainDao;
import vo.Member;

public class MainService {
	private MainDao mDao;
	
	public MainService() {
		super();
		mDao = new MainDao();
	}

	public Member selectOneMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = mDao.selectOneMember(conn,m);
		JDBCTemplate.close(conn);
		return member;
	}

	public boolean idCheck(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = mDao.selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDao.insertMember(conn, m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
