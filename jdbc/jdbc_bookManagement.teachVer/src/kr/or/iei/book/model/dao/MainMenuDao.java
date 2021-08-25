package kr.or.iei.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import kr.or.iei.book.vo.Member;

public class MainMenuDao {
	public Member parseMember(ResultSet rset) throws SQLException {
		Member m = new Member();
		m.setMemberGrade(rset.getInt("member_level"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberPw(rset.getString("member_pw"));
		
		return m;
	}

	public Member login(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member mem = null;
		String query = "select * from member where member_id = ? and member_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mem = parseMember(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mem;
	}

	public int checkId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int count = 0;
		String query = "select count(*) cnt from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
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

	public int join(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into member values (member_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, m.getMemberId());
			pstmt.setString(i++, m.getMemberPw());
			pstmt.setString(i++, m.getMemberName());
			pstmt.setString(i++, m.getMemberPhone());
			pstmt.setInt(i++, m.getMemberGrade());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
