package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardRowMapper;
import kr.or.board.model.vo.FileVO;
import kr.or.board.model.vo.FileVORowMapper;

@Repository
public class BoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public ArrayList<Board> selectBoardList() {
		String query = "select * from board";
		List list = jdbcTemplate.query(query, new BoardRowMapper());
		return (ArrayList<Board>) list;
	}

	public int insertBoard(Board b) {
		String query = "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate, 'yyyy-mm-dd'))";
		Object[] params = {b.getBoardTitle(), b.getBoardContent(), b.getBoardWriter()};
		int result = jdbcTemplate.update(query, params);
		return result;
	}

	public int selectBoardNo() {
		String query = "select max(board_no) from board";
		int boardNo = jdbcTemplate.queryForObject(query, int.class);
		return boardNo;
	}

	public int insertFile(FileVO fv) {
		String query = "insert into file_tbl values(file_seq.nextval, ?, ?, ?)";
		Object[] params = {fv.getBoardNo(), fv.getFilename(), fv.getFilepath()};
		int result = jdbcTemplate.update(query,params);
		return result;
	}

	public Board selectBoard(int boardNo) {
		String query = "select * from board where board_no=?";
		Object[] params = {boardNo};
		List list = jdbcTemplate.query(query, params, new BoardRowMapper());
		if(list.isEmpty()) {
			return null;
		} else {
			return (Board)list.get(0);
		}
	}

	public ArrayList<FileVO> selectFileList(int boardNo) {
		String query = "select * from file_tbl where board_no = ?";
		Object[] params = {boardNo};
		List list = jdbcTemplate.query(query, params, new FileVORowMapper());
		return (ArrayList<FileVO>) list;
	}
}
