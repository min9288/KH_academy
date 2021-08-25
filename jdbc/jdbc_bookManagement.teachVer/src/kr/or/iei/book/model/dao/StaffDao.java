package kr.or.iei.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.or.iei.book.vo.Book;
import kr.or.iei.book.vo.Member;
import kr.or.iei.book.vo.Rental;

public class StaffDao {
	
	public Book parseBook(ResultSet rset) throws SQLException {
		Book b = new Book();
		b.setBookAuthor(rset.getString("author"));
		b.setBookGenre(rset.getString("genre"));
		b.setBookIntro(rset.getString("rental_intro"));
		b.setBookNo(rset.getInt("book_no"));
		b.setBookVolume(rset.getInt("rental_volume"));
		return b;
	}
	
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

	public ArrayList<Book> showBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Book> list = new ArrayList<Book>();
		String query = "select * from book";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book b = parseBook(rset);
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int regLatestBook(Connection conn, Book b) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into book vaules(book_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, b.getBookGenre());
			pstmt.setString(i++, b.getBookTitle());
			pstmt.setString(i++, b.getBookIntro());
			pstmt.setString(i++, b.getBookAuthor());
			pstmt.setInt(i++, b.getBookVolume());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Rental> rentalStatus(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Rental> list = new ArrayList<Rental>();
		String query = "select rental_no, member_name, title, rental_date, return_date, rental_status"
				+ "from rental"
				+ "left join member using (member_no)"
				+ "left join book using (book_no)"
				+ "where rental_status in (1, 2)";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Rental r = new Rental();
				r.setRentalNo(rset.getInt("rental_no"));
				r.setMemberName(rset.getString("member_name"));
				r.setBookTitle(rset.getString("title"));
				r.setRentalDate(rset.getDate("rental_date"));
				r.setReturnDate(rset.getDate("return_date"));
				r.setRentalStatus(rset.getInt("rental_status"));
				if(r.getRentalStatus() == 1) {
					r.setStrRentalStatus("대여 중");
				} else if(r.getRentalStatus() == 2){
					r.setStrRentalStatus("반납 완료");
				}
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}


	public static ArrayList<Member> showAllMemberInfo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select member_no, member_id, member_pw, member_name, member_phone, "
				+ "count(rental_status) as unpaid_books "
				+ "from member "
				+ "left join rental using member_no "
				+ "where rental_status = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setUnpaidBook(rset.getInt("unpaid_books"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public static ArrayList<Member> showAllMemberInfo1(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member where member_level = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = parseMember(rset, 0);
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	
}






























