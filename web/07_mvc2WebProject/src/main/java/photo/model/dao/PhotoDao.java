package photo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import photo.model.vo.Photo;

public class PhotoDao {

	public int insertPhoto(Connection conn, Photo p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into photo values(photo_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPhotoWriter());
			pstmt.setString(2, p.getPhotoComment());
			pstmt.setString(3, p.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
