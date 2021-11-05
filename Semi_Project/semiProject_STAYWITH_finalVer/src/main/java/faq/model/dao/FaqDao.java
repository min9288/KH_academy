package faq.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.vo.Faq;
public class FaqDao {

	public int insertFaq(Connection conn, Faq f) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "insert into faq values(faq_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setInt(3, f.getFaqSort());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<Faq> selectFaqList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Faq> list = new ArrayList<Faq>();
		String query = "select * from faq";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Faq f = new Faq();
				f.setFaqContent(rset.getString("faq_content"));
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqSort(rset.getInt("faq_sort"));
				list.add(f);
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
	public int deleteFaq(Connection conn, String qna, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query  = "delete from faq where faq_title=? and faq_content=? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qna);
			pstmt.setString(2, content);
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
