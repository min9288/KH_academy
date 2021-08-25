package kr.or.iei.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import common.JDBCTemplate;
import kr.or.iei.model.vo.Book;
import kr.or.iei.model.vo.Member;
import kr.or.iei.model.vo.Rent;

public class Dao {	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into member values (member_seq.nextval,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, m.getMemberId());
			pstmt.setString(i++, m.getMemberPw());
			pstmt.setString(i++, m.getMemberName());
			pstmt.setString(i++, m.getMemberPhone());
			pstmt.setInt(i++, m.getMemberLevel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member selectOneMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "select * from member where member_id=? and member_pw=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = parseMember(rset,0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return member;
	}
	public boolean selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			result = rset.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	

	public int insertBook(Connection conn, Book b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into book values(book_seq.nextval,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, b.getBookGenre());
			pstmt.setString(i++, b.getBookName());
			pstmt.setString(i++, b.getBookIntro());
			pstmt.setString(i++, b.getBookWriter());
			pstmt.setInt(i++, b.getBookStock());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}				
		return result;
	}

	public ArrayList<Book> selectBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Book> list = new ArrayList<Book>();
		String query = "select * from book";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {				
				list.add(parseBook(rset));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public Book selectOneBook(Connection conn, int bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Book b = null;
		String query = "select * from book where book_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bookNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = parseBook(rset);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}
	
	public int stockChange(Connection conn, int bookNo, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update book set book_stock = book_stock+? where book_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, bookNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}		
		return result;
	}

	public int insertRent(Connection conn, Rent r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into rent values(rent_seq.nextval,?,?,sysdate,sysdate+3,1)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getMemberNo());
			pstmt.setInt(2, r.getBookNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}		
		return result;
	}

	public ArrayList<Rent> selectRentList(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Rent> list = new ArrayList<Rent>();
		String query = "select rent_no, book_name, start_date, end_date, rent_status from rent join member using (member_no) join book using (book_no) where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Rent r = parseRent(rset,1);
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}	
	public ArrayList<Rent> selectRentList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Rent> list = new ArrayList<Rent>();
		String query = "select rent_no, book_name, member_name, start_date, end_date, rent_status from rent join member using (member_no) join book using (book_no)";
		try {
			pstmt = conn.prepareStatement(query);			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Rent r = parseRent(rset,3);
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public Rent selectOneRent(Connection conn, int rentNo, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Rent r = null;
		String query = "select rent_no, book_no, member_no, rent_status from rent where rent_no=? and member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rentNo);
			pstmt.setInt(2, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = parseRent(rset,2);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
	

	public int returnBook(Connection conn, int rentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update rent set rent_status=2 where rent_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rentNo);			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}		
		return result;
	}

	public Member selectOneMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "select m.*,(select count(*) from rent r where r.member_no=m.member_no and rent_status=1) as rent_count from member m where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = parseMember(rset,1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return member;
	}
	public Member parseMember(ResultSet rset, int checkSum) throws SQLException {
		Member m = new Member();
		m.setMemberId(rset.getString("member_id"));
		m.setMemberLevel(rset.getInt("member_level"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberPw(rset.getString("member_pw"));
		if(checkSum == 1) {
			m.setRentCount(rset.getInt("rent_count"));
		}
		return m;
	}
	public Book parseBook(ResultSet rset) throws SQLException {
		Book b = new Book();
		b.setBookGenre(rset.getString("book_genre"));
		b.setBookIntro(rset.getString("book_intro"));
		b.setBookName(rset.getString("book_name"));
		b.setBookNo(rset.getInt("book_no"));
		b.setBookStock(rset.getInt("book_stock"));
		b.setBookWriter(rset.getString("book_writer"));
		return b;
	}
	public Rent parseRent(ResultSet rset, int checkSum) throws SQLException {
		Rent r = new Rent();
		r.setRentNo(rset.getInt("rent_no"));
		r.setRentStatus(rset.getInt("rent_status"));
		if(checkSum == 1 || checkSum == 3) {			
			r.setBookName(rset.getString("book_name"));
			r.setStartDate(rset.getDate("start_date"));
			r.setEndDate(rset.getDate("end_date"));
			if(checkSum == 3) {
				r.setMemberName(rset.getString("member_name"));
			}
		}else if(checkSum == 2) {
			r.setBookNo(rset.getInt("book_no"));
			r.setMemberNo(rset.getInt("member_no"));
		}
		return r;
	}

	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select m.*,(select count(*) from rent r where r.member_no=m.member_no and rent_status=1) as rent_count from member m where member_level=1";
		try {
			pstmt = conn.prepareStatement(query);			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(parseMember(rset,1));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public Member selectOneMember1(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = parseMember(rset, 0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int selectRentCount(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as rent_count from rent where member_no=? and rent_status=1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("rent_count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectAllMember1(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member  where member_level=1";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = parseMember(rset, 0);
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	
}








