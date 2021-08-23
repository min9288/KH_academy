package kr.or.iei.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import kr.or.iei.user.vo.User;

public class UserDao {
	
	public User parseUser(ResultSet rset) throws SQLException{
		
		User u = new User();
		u.setUserAge(rset.getInt("user_age"));
		u.setUserCode(rset.getInt("user_no"));
		u.setUserId(rset.getString("user_id"));
		u.setUserName(rset.getString("user_name"));
		u.setUserPhone(rset.getString("user_phone"));
		u.setUserPw(rset.getString("user_pw"));
		
		return u;
	}
	
	public User login(Connection conn, User u) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from user_tbl where user_id = ? and user_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPw());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				u = parseUser(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return u;
	}
	
	public int checkId(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = "select count(*) cnt from user_tbl where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			rset.next();
			result = rset.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int join(Connection conn, User u) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into user_tbl values(seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, u.getUserId());
			pstmt.setString(i++, u.getUserPw());
			pstmt.setString(i++, u.getUserName());
			pstmt.setInt(i++, u.getUserAge());
			pstmt.setString(i++, u.getUserPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}

















































