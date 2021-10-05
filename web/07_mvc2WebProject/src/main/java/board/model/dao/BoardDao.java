package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import board.model.vo.Board;
import common.JDBCTemplate;

public class BoardDao {

	public int insertNotice(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into board values(board_seq.nextval,?,?,?,0,to_char(sysdate,'yyyy-mm-dd'),?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardWriter());
			pstmt.setString(4, b.getFilename());
			pstmt.setString(5, b.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
