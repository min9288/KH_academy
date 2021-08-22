package kh.jdbc.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import kh.jdbc.member.vo.Board;

public class BoardDao {
	
	public ArrayList<Board> selectAllPostingList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> list = new ArrayList<Board>();
		String query = "select board_no, board_title, nvl(user_name, '탈퇴회원') as U_NAME, read_count, enroll_date "
				+ "from board_tbl "
				+ "left join user_tbl on (board_writer = user_no) order by 1 desc";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setBoardWriterString(rset.getString("u_name"));
//				String boardWriter = rset.getString("u_name");
//				if(boardWriter == null) {
//					b.setBoardWriterString("탈퇴회원");
//				} else {
//					b.setBoardWriterString(boardWrier);
//				}
				b.setReadCount(rset.getInt("read_count"));
				b.setEnrollDate(rset.getDate("enroll_date"));
				list.add(b);
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
	
	public int addReadCount(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query ="update board_tbl set read_count = read_count + 1 where board_no = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
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
	
	public Board selectOneBoard(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		String query = "SELECT BOARD_NO, BOARD_TITLE,BOARD_CONTENT,USER_NAME AS U_NAME, READ_COUNT,REG_DATE "
				+ "FROM BOARD_TBL LEFT JOIN USER_TBL ON (BOARD_WRITER = USER_NO) WHERE BOARD_NO = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setBoardTitle(rset.getString("board_title"));
				b.setBoardContent(rset.getString("board_content"));
				b.setBoardWriterString(rset.getString("u_name"));
				b.setReadCount(rset.getInt("read_count"));
				b.setEnrollDate(rset.getDate("enroll_date"));
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
		return b;
	}
	
	
	public int createPosting(Board b) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into board_tbl values"
				+ "(seq_board.nextval, ?, ?, ?, default, sysdate)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:"
					+ "@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, b.getBoardTitle());
			pstmt.setString(i++, b.getBoardContent());
			pstmt.setInt(i++, b.getBoardWriter());
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
	
	public int updatePosting(Member up, int postingNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "update board_tbl set board_title = ?, board_content = ? "
				+ "where board_no = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, up.getBoardTitle());
			pstmt.setString(2, up.getBoardContent());
			pstmt.setInt(3, postingNo);
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
	
	public int deleteMyPosting(int postingNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "delete from board_tbl where board_no = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC1", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postingNo);
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
