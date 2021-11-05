package question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import question.model.vo.Question;

public class QuestionDao {
	//문의 등록
	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="insert into question values(q_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getqCategory());
			pstmt.setString(2, q.getqType());
			pstmt.setString(3, q.getqAbout());
			pstmt.setString(4, q.getqTitle());
			pstmt.setString(5, q.getResNo());
			pstmt.setString(6, q.getFilepath());
			pstmt.setString(7, q.getUsedDate());
			pstmt.setString(8, q.getqContent());
			pstmt.setString(9, q.getqName());
			pstmt.setString(10, q.getEmail());
			pstmt.setString(11, q.getPhone());
			pstmt.setString(12, q.getHome());
			pstmt.setString(13, q.getqAuto());
			pstmt.setString(14, q.getFileName());
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
