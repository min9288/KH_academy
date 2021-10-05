package board.model.service;

import java.sql.Connection;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import common.JDBCTemplate;
import notice.model.dao.NoticeDao;

public class BoardService {

	public int insertBoard(Board b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().insertNotice(conn, b);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
