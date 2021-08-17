package member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import member.vo.Member;

public class MemberDao {
	public ArrayList<Member> selectAllMember(){
		// 1. 필요한 변수들 선언
		Connection conn = null;		// DBMS 연결 객체
		Statement stmt = null;		// SQL 구문을 전달하고 결과를 받아오는 객체
		ResultSet rset = null;		// SELECT 쿼리 수행 결과를 저장하는 객체
		
		// 조회결과를 리턴할 객체
		ArrayList<Member> list = new ArrayList<Member>();
		// 사용할 쿼리문 (주의 : ; 을 넣는경우 에러발생 !!!)
		String query = "select * from member";
		
		
		try {
			// 2. 사용할 DB에 대한 드라이버 등록 (연결 시 사용할 클래스를 등록(ojdbc가 제공하는 클래스))
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 3. 등록된 클래스를 이용해서 DB 연결 처리 (성공하면 Connection 객체, 실패하면 null 리턴)
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			// 4. 쿼리문을 실행하고 결과를 받아오는 statement 객체를 생성
			stmt = conn.createStatement();
			// 5. 쿼리문을 전송하여 실행하고, 실행 결과를 받아와 저장
			rset = stmt.executeQuery(query);
			// 6. 받은 결과를 객체에 옮겨 저장
			while(rset.next()) {
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
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			// 7. 사용자원 반환
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public Member selectOneMember(String memberId) {
		// 1. 필요한 변수선언
		Connection conn = null;		// DBMS 연결 객체
		Statement stmt = null;		// SQL 구문을 전달하고 결과를 받아오는 객체
		ResultSet rset = null;		// SELECT 쿼리 수행 결과를 저장하는 객체
		
		Member m = null;
		String query = "select * from member where member_id = '"+memberId+"'";
		
		try {
			// 2. DB 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 3. 등록된 클래스를 이용해서 연결 설정
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			// 4. 쿼리문을 수행하고 결과를 받아올 Statement 객체 생성
			stmt = conn.createStatement();
			// 5. 쿼리문 수행 후 결과를 받아서 저장
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				m = new Member();
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberAddr(rset.getString("member_addr"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEnrollDate(rset.getDate("enroll_date"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return m;
	}
	
	public ArrayList<Member> selectNameMember(String memberName) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member where member_name like '%" +memberName+ "%'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				Member m = new Member();
				m.setMemberId(rset.getString(1));
				m.setMemberPw(rset.getString(2));
				m.setMemberName(rset.getString(3));
				m.setMemberAddr(rset.getString(4));
				m.setMemberPhone(rset.getString(5));
				m.setMemberAge(rset.getInt(6));
				m.setEnrollDate(rset.getDate(7));
				
//				m.setMemberId(rset.getString("member_id"));
//				m.setMemberPw(rset.getString("member_pw"));
//				m.setMemberName(rset.getString("member_name"));
//				m.setMemberAddr(rset.getString("member_addr"));
//				m.setMemberPhone(rset.getString("member_phone"));
//				m.setMemberAge(rset.getInt("member_age"));
//				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public int insertMember(Member m) {
		Connection conn = null;
		Statement stmt = null;
		// ResultSet rset = null;   // 사용하는 쿼리문이 SELECT 가 아닌경우 ResultSet 사용 X
		// insert / update / delete 변경된 행의 갯수를 리턴
		int result = 0;
		String query = "insert into member values("
						+"'"+m.getMemberId()+"',"
						+"'"+m.getMemberPw()+"',"
						+"'"+m.getMemberName()+"',"
						+"'"+m.getMemberAddr()+"',"
						+"'"+m.getMemberPhone()+"',"
						+m.getMemberAge()+","
						+"sysdate)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			stmt = conn.createStatement();
			// insert, update, delete executeUpdate(query); 사용해서 쿼리를 실행하고 결과로 정수 리턴
			// 적용된 행의 숫자 리턴
			result = stmt.executeUpdate(query);
			if(result > 0) {
				// insert 결과가 0보다 크면 -> 1개 이상의 데이터가 추가되었으면
				conn.commit(); // 추가된 데이터를 적용
			} else {
				conn.rollback(); // 되돌리기
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;	
	}
	
	public int updateMember(Member m) {
		Connection conn = null;
		Statement stmt = null;
		
		int result = 0;
		String query = "update member set member_pw ='"+m.getMemberPw()+"',"
				+"member_addr ='"+m.getMemberAddr()+"',"
				+"member_phone = '"+m.getMemberPhone()+"' "
				+"where member_id = '"+m.getMemberId()+"'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int deleteMember(String memberId) {
		Connection conn = null;
		Statement stmt = null;
		
		int result = 0;
		String query = "delete from member where member_id = '"+memberId+"'";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			stmt = conn.createStatement();
			result = stmt.executeUpdate(query);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public Member login(Member m) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		Member loginMember = null;
		String query = "select * from member where member_id = '"
						+m.getMemberId()+"' and member_pw = '"+m.getMemberPw()+"'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "1234");
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				loginMember = new Member();
				loginMember.setEnrollDate(rset.getDate("enroll_date"));
				loginMember.setMemberAddr(rset.getString("member_addr"));
				loginMember.setMemberAge(rset.getInt("member_age"));
				loginMember.setMemberId(rset.getString("member_id"));
				loginMember.setMemberName(rset.getString("member_name"));
				loginMember.setMemberPhone(rset.getString("member_phone"));
				loginMember.setMemberPw(rset.getString("member_pw"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}
}
