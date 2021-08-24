package kr.or.iei.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.JDBCTemplate;
import kr.or.iei.member.model.vo.Member;

public class MemberDao {
	Properties prop = new Properties();
	String selectAll;
	String selectOne;
	String selectOneName; 
	String insertMember;
	String updateMember;
	String deleteMember;
	String insertDelMember;
	
	public MemberDao() {
		super();
		readProp();
		selectAll = prop.getProperty("selectAll");
		selectOne = prop.getProperty("selectOne");
		selectOneName = prop.getProperty("selectOneName");
		insertMember = prop.getProperty("insertMember");
		updateMember = prop.getProperty("updateMember");
		deleteMember = prop.getProperty("deleteMember");
		insertDelMember = prop.getProperty("insertDelMember");
		
	}
	
	public void readProp() {
		try {
			FileReader fr = new FileReader("resources/memberQuery.properties");
			prop.load(fr);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member parseMember(ResultSet rset) throws SQLException {
		Member m = new Member();
		m.setEnrollDate(rset.getDate("enroll_date"));
		m.setMemberAddr(rset.getString("member_addr"));
		m.setMemberAge(rset.getInt("member_age"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberPw(rset.getString("member_pw"));
		return m;
	}
	
	public ArrayList<Member> selectAllMember(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = selectAll;
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m = parseMember(rset);
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
	
	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member m = null;
		String query = selectOne;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = parseMember(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public Member selectOneMemberName(Connection conn, String memberName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member m = null;
		String query = selectOneName;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = parseMember(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public int insertMember (Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = insertMember;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberAddr());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setInt(6, m.getMemberAge());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = updateMember;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberAddr());
			pstmt.setString(3, m.getMemberPhone());
			pstmt.setString(4, m.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = deleteMember;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int insertDelMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = insertDelMember;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);;
		}
		return result;
	}
}






















