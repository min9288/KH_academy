package photo.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import photo.model.dao.PhotoDao;
import photo.model.vo.Photo;

public class PhotoService {

	public int insertPhoto(Photo p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PhotoDao().insertPhoto(conn, p);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
