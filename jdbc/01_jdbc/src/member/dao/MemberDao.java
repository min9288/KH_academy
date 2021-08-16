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
		String query = "SELECT * FROM MEMBER";
		
		
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
}
