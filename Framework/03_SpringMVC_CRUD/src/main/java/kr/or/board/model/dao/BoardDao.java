package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardRowMapper;

@Repository
public class BoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public ArrayList<Board> selectBoardList() {
		String query = "select * from board";
		List list = jdbcTemplate.query(query, new BoardRowMapper()); 
		return (ArrayList<Board>) list;
	}

	public int insertBoard1(Board b) {
		String query = "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate, 'yyyy-mm-dd'))";
		Object[] params = {b.getBoardTitle(), b.getBoardContent(), b.getBoardWriter()};
		int result = jdbcTemplate.update(query, params);
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		String query = "select * from board where board_no=?";
		Object[] params= {boardNo};
		List list = jdbcTemplate.query(query, params, new BoardRowMapper());
		if(list.isEmpty()) {
			return null;
		}else {
			return (Board)list.get(0);
		}
	}
}
