package kr.or.iei.member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.or.iei.member.vo.Member;



public class MemberDao {
	
	public ArrayList<Member> selectAllMember(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberAddr = rset.getString("member_addr");
				String memberPhone = rset.getString("member_phone");
				int memberAge = rset.getInt("member_age");
				Date enrollDate = rset.getDate("enroll_date");
				Member m = new Member(memberId, memberPw, memberName, memberAddr, memberPhone, memberAge, enrollDate);
				list.add(m);
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
		return list;
	}

	public Member selectOneMember(String memberId) {
		Connection conn = null;
//		Statement stmt = null;
		PreparedStatement pstmt = null; // 쿼리문을 실행하고 결과를 가져오는 객체
		ResultSet rset = null;
		
		Member m = null;
//		String query = "select * from member where member_id = '"+memberId+"'";
		
		// PreparedStatement 변수로 대체할 값을 ?(위치홀더)로 대체
		// 위치홀더는 값으로만 사용이 가능 (컬럼명, 테이블명 등으로 사용 불가)
		// 위치홀더를 값으로 대체했을때 쿼리문이 완성된 형태 -> 위치홀더를 빼고 보더라도 문법상 문제 없어야함
		// 위치홀더(?) : SQL구문에 나타나는 토큰, 실제 SQL 구문으로 실행되기전에 값으로 대체되어야함 
		String query = "select * from member where member_id = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			
			// stmt = conn.createStatement();
			// PreparedStatement 객체 생성 시 쿼리문을 전달(문법검사)
			pstmt = conn.prepareStatement(query);
			// 위치홀더값을 값으로 대체
			pstmt.setString(1, memberId);
			
			// rset = stmt.executeQuery(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberAddr(rset.getString("member_addr"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEnrollDate(rset.getDate("enroll_date"));
			}
			
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				// stmt.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return m;
	}
	
	public ArrayList<Member> selectMemberName(String memberName){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member where member_name like '%'||?||'%'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberName);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberId(rset.getString(1));
				m.setMemberPw(rset.getString(2));
				m.setMemberName(rset.getString(3));
				m.setMemberAddr(rset.getString(4));
				m.setMemberPhone(rset.getString(5));
				m.setMemberAge(rset.getInt(6));
				m.setEnrollDate(rset.getDate(7));
				list.add(m);
				
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
		return list;
	}
	
	public int insertMember(Member m) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into member values(?,?,?,?,?,?,sysdate)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberAddr());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setInt(6, m.getMemberAge());
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
	
	public int updateMember(Member updateMember) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		
		int result = 0;
		String query = "update member set member_pw = ?, member_addr = ?, member_phone = ? where member_id = ?";
				
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, updateMember.getMemberPw()); 
			pstmt.setString(2, updateMember.getMemberAddr()); 
			pstmt.setString(3, updateMember.getMemberPhone()); 
			pstmt.setString(4, updateMember.getMemberId());
			result = pstmt.executeUpdate();// 쿼리문 실행구문
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
	
	public int deleteMember(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "delete from member where member_id = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
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




















