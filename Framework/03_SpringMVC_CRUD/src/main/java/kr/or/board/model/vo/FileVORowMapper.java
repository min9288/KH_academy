package kr.or.board.model.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FileVORowMapper implements RowMapper {
	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException{
		FileVO fv = new FileVO();
		fv.setBoardNo(rs.getInt("board_no"));
		fv.setFileNo(rs.getInt("file_no"));
		fv.setFilename(rs.getString("filename"));
		fv.setFilepath(rs.getString("filepath"));
		return fv;
	}
}
