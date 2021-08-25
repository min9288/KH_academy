package kr.or.iei.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.or.iei.model.dao.Dao;
import kr.or.iei.model.vo.Book;
import kr.or.iei.model.vo.Member;
import kr.or.iei.model.vo.Rent;

public class Service {
	private Dao dao;
	
	public Service() {
		super();
		dao = new Dao();
	}

	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.insertMember(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = dao.selectOneMember(conn,m);
		JDBCTemplate.close(conn);
		return member;
	}

	public boolean idCheck(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = dao.selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertBook(Book b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertBook(conn,b);
		if(result>0) {
			JDBCTemplate.commit(conn);			
		}else {
			JDBCTemplate.rollback(conn);			
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Book> selectBookList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> list = dao.selectBookList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int rentBook(Rent r) {
		Connection conn = JDBCTemplate.getConnection();
		Book b = dao.selectOneBook(conn, r.getBookNo());
		int result = 0;
		if(b == null) {
			result = -2; 
		}else {
			if(b.getBookStock() == 0) {
				result = -1;
			}else {
				result = dao.stockChange(conn,r.getBookNo(),-1);
				if(result > 0 ) {
					result = dao.insertRent(conn,r);
				}				
			}			
		}	
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Rent> selectRentList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Rent> list = dao.selectRentList(conn,memberNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public int returnBook(int rentNo, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		Rent r = dao.selectOneRent(conn,rentNo,memberNo);
		if(r == null) {
			result = -1;
		}else {
			result = dao.stockChange(conn, r.getBookNo(), 1);
			if(result > 0) {
				result = dao.returnBook(conn,rentNo);
			}
		}
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member selectOneMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = dao.selectOneMember(conn,memberNo);
		JDBCTemplate.close(conn);
		return member;
	}

	public ArrayList<Rent> allRentInfo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Rent> list = dao.selectRentList(conn);
		JDBCTemplate.close(conn);
		return list;		
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;		
	}

	public Member selectOneMember1(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = dao.selectOneMember1(conn, memberNo);
		int rentCount = dao.selectRentCount(conn,memberNo);
		member.setRentCount(rentCount);
		JDBCTemplate.close(conn);
		return member;
	}

	public ArrayList<Member> selectAllMember1() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember1(conn);
		for(Member m : list) {
			int rentCount = dao.selectRentCount(conn, m.getMemberNo());
			m.setRentCount(rentCount);
		}
		JDBCTemplate.close(conn);
		return list;
	}

}
