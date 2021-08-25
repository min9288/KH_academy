package kr.or.iei.book.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.or.iei.book.model.dao.StaffDao;
import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class StaffService {
	private StaffDao staffDao;

	public StaffService() {
		super();
		staffDao = new StaffDao(); 
	}

	public ArrayList<Book> showBookList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> list = staffDao.showBookList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int regLatestBook(Book b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = staffDao.regLatestBook(conn, b);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Rental> rentalStatus() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Rental> list = staffDao.rentalStatus(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Member> showAllMemberInfo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = StaffDao.showAllMemberInfo(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Member> showAllMemberInfo1() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = StaffDao.showAllMemberInfo1(conn);
		for (Member m : list) {
			int rentCount = StaffDao.selectRentCount(conn, m.getMemberNo());
			m.setUnpaidBook(rentCount);
		}
		JDBCTemplate.close(conn);
		return list;
	}

	

}
