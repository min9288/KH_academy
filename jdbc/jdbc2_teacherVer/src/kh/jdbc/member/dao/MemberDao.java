package kh.jdbc.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import kh.jdbc.member.vo.Member;


public class MemberDao {
	Member login = null;
	
	public Member login(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from user_tbl where user_id = ? and user_pw = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				login = new Member();
				login.setMemberCode(rset.getInt("user_no"));
				login.setMemberId(rset.getString("user_id"));
				login.setMemberPw(rset.getString("user_pw"));
				login.setMemberName(rset.getString("user_name"));
				login.setMemberAge(rset.getInt("user_age"));
				login.setMemberPhone(rset.getString("user_phone"));
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return login;
	}
	
	public Member searchMember(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member member = null;
		String query = "select * from user_tbl where user_id = ? and user_pw = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				member = new Member();
				member.setMemberCode(rset.getInt("user_no"));
				member.setMemberId(rset.getString("user_id"));
				member.setMemberPw(rset.getString("user_pw"));
				member.setMemberName(rset.getString("user_name"));
				member.setMemberAge(rset.getInt("user_age"));
				member.setMemberPhone(rset.getString("user_phone"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public int checkId(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 조회된 count결과를 저장하는 변수 
		int count = 0;
		String query = "SELECT COUNT(*) as cnt FROM USER_TBL WHERE USER_ID = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			rset.next(); // 그룹함수(count -> 데이터가 없어서 0 이라도 행을 하나 무조건 출력)를 썼기때문에 조회결과는 무조건 1줄 -> rset.next() -> 무조건 true
			count = rset.getInt("cnt");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public boolean checkId1(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		boolean result = true;
		String query = "select * from user_tbl where user_id = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			result = rset.next();
//			if(rset.next()) {
//				result = false;
//			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertMember(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into user_tbl values(seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, m.getMemberId());
			pstmt.setString(i++, m.getMemberPw());
			pstmt.setString(i++, m.getMemberName());
			pstmt.setInt(i++, m.getMemberAge());
			pstmt.setString(i++, m.getMemberPhone());
			result = pstmt.executeUpdate();
			if (result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	public int updateMyInfo(Member updateMember) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "update user_tbl set user_pw = ?, user_name = ?, user_phone = ? where user_id = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, updateMember.getMemberPw());
			pstmt.setString(i++, updateMember.getMemberName());
			pstmt.setString(i++, updateMember.getMemberPhone());
			pstmt.setString(i++, updateMember.getMemberId());
			result = pstmt.executeUpdate();
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	public int deleteMyAccount(int memberCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "delete from user_tbl where user_no = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			result = pstmt.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	
}


































