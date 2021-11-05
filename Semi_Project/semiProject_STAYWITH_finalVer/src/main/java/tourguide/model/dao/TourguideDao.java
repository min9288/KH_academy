package tourguide.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.vo.Faq;
import tourguide.model.vo.Tourguide;

public class TourguideDao {

	public ArrayList<Tourguide> selectTgList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Tourguide> list = new ArrayList<Tourguide>();
		String query = "select * from tourguide";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Tourguide t = new Tourguide();
				t.setFilepath(rset.getString("filepath"));
				t.setTgContent(rset.getString("tg_content"));
				t.setTgLocation(rset.getString("tg_location"));
				t.setTgNo(rset.getInt("tg_no"));
				t.setTgPhone(rset.getString("tg_phone"));
				t.setTgSort(rset.getInt("tg_sort"));
				t.setTgTitle(rset.getString("tg_title"));
				
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int insertTg(Connection conn, Tourguide tg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "insert into Tourguide values (tg_seq.nextval,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tg.getTgTitle());
			pstmt.setString(2, tg.getTgContent());
			pstmt.setString(3, tg.getTgLocation());
			pstmt.setString(4, tg.getTgPhone());
			pstmt.setString(5, tg.getFilepath());
			pstmt.setInt(6, tg.getTgSort());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteTg(Connection conn, int tgNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "delete from tourguide where tg_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, tgNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateTg(Connection conn, Tourguide tg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "update tourguide set tg_title=?, tg_content=?,tg_location=?,tg_phone=?,filepath=?,tg_sort=? where tg_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tg.getTgTitle());
			pstmt.setString(2, tg.getTgContent());
			pstmt.setString(3, tg.getTgLocation());
			pstmt.setString(4, tg.getTgPhone());
			pstmt.setString(5, tg.getFilepath());
			pstmt.setInt(6, tg.getTgSort());
			pstmt.setInt(7, tg.getTgNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
