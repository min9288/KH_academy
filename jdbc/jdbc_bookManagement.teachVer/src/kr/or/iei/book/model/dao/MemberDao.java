package kr.or.iei.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class MemberDao {
	// checkSum 부분 미완성, 강사님 코드 확인!
	public Member parseMember(ResultSet rset, int checkSum) throws SQLException {
		Member m = new Member();
		m.setMemberGrade(rset.getInt("member_level"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberPw(rset.getString("member_pw"));
		if(checkSum == 1) {
			m.setUnpaidBook(rset.getInt("rental_"));
		}
		
		
		return m;
	}
	
	public Member myPage(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member m = null;
		
		String query = "select m.*, "
				+ "(select count(*) as cnt from rental r where r.member_no = m.member_no and rental_rental_status = 1) as rental_count "
				+ "from member m "
				+ "where member_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				m.setMemberGrade(rset.getInt("member_level"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setUnpaidBook(rset.getInt("unpaid_books"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public int checkBookVolume(Connection conn, int bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = "select count(rental_volume) as cnt from book where book_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bookNo);
			rset = pstmt.executeQuery();
			rset.next();
			result = rset.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int rentalBook(Connection conn, int bookNo, int memberNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into rental values(rental_seq.nextval, ?, ?, default, default, 1)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, bookNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateDecreaseVolume(Connection conn, int bookNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "update book set rental_volume = rental_volume - 1"
				+ "where book_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bookNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public Rental myRentalInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Rental r = new Rental();
		String query = "select rental_no, title, rental_date, return_date, rental_status"
				+ "from rental"
				+ "left join book using (book_no)"
				+ "where member_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r.setRentalNo(rset.getInt("rental_no"));
				r.setBookTitle(rset.getString("title"));
				r.setRentalDate(rset.getDate("rental_date"));
				r.setReturnDate(rset.getDate("return_date"));
				r.setStrRentalStatus(rset.getString("rental_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
	
	public int checkReturnNo(Connection conn, int returnNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int count = 0;
		String query = "select count(*) cnt from rental where rental_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, returnNo);
			rset = pstmt.executeQuery();
			rset.next();
			count = rset.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	
	public int updateIncreaseVolume(Connection conn, int returnNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "update book set rental_volume = rental_volume + 1"
				+ "where book_no = (select book_no from rental where rental_no = ?)";
				
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, returnNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int returnBook(Connection conn, int returnNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "update rental set rental_status = 2"
				+ "where rental_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, returnNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}
