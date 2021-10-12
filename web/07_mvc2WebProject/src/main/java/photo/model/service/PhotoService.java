package photo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<Photo> morePhoto(int start) {
		Connection conn = JDBCTemplate.getConnection();
		int length = 5;  // 한번에 추가로 가지고 올 게시물 수
		int end = start+length-1;
		ArrayList<Photo> list = new PhotoDao().morePhoto(conn, start, end);
		JDBCTemplate.close(conn);
		return list;
	}

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int count = new PhotoDao().totalCount(conn);
		return count;
	}

}
