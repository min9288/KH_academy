package kr.or.iei.book.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import kr.or.iei.book.model.dao.MemberDao;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class MemberService {
	private MemberDao memberDao;

	public MemberService() {
		super();
		memberDao = new MemberDao();
	}

	public Member myPage(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = memberDao.myPage(conn, memberNo);
		JDBCTemplate.close(conn);
		return m;
	}

	public int checkBookVolume(int bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memberDao.checkBookVolume(conn, bookNo);
		JDBCTemplate.close(conn);
		return result;
	}

	public int rentalBook(int bookNo, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		int result1 = memberDao.updateDecreaseVolume(conn, bookNo);
		int result2 = memberDao.rentalBook(conn, bookNo, memberNo);
		if (result1 > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
			result = 1;
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Rental myRentalInfo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Rental r = memberDao.myRentalInfo(conn, memberNo);
		JDBCTemplate.close(conn);
		return r;
	}

	public int returnBook(int returnNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		int result1 = memberDao.updateIncreaseVolume(conn, returnNo);
		int result2 = memberDao.returnBook(conn, returnNo);
		if (result1 > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
			result = 1;
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int checkReturnNo(int returnNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = memberDao.checkReturnNo(conn, returnNo);
		if(count > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return count;
	}

}
