package inquiryView.modal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import inquiryView.vo.InquiryAnswer;
import inquiryView.vo.InquiryView;
import member.modal.vo.Member;

public class InquiryViewDao {

	public InquiryView selectMyInquiry(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from question where email=?";
		InquiryView v = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				v = new InquiryView();
				v.setqNo(rset.getInt("q_no"));
				v.setqCategory(rset.getString("q_category"));
				v.setqType(rset.getString("q_type"));
				v.setqAbout(rset.getString("q_about"));
				v.setqTitle(rset.getString("q_title"));
				v.setResNo(rset.getString("res_no"));
				v.setFilepath(rset.getString("filepath"));
				v.setUsedDate(rset.getString("used_date"));
				v.setqContent(rset.getString("q_content"));
				v.setqName(rset.getString("q_name"));
				v.setEmail(rset.getString("email"));
				v.setPhone(rset.getString("phone"));
				v.setHome(rset.getString("home"));
				v.setqAuto(rset.getString("q_auto"));
				v.setFilename(rset.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return v;
	}

	public ArrayList<InquiryView> selectInquiryList(Connection conn, int start, int end, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<InquiryView> list = new ArrayList<InquiryView>();
		String query = "select ivv.*,(select count(*) from answer where q_no=ivv.q_no) as \"a_count\" "
				+ "from(select rownum as rnum, iv.*from (select * from question order by q_no desc)iv)ivv where rnum BETWEEN ? and ? and email=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, email);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				InquiryView v = new InquiryView();
				v.setqNo(rset.getInt("q_no"));
				v.setqCategory(rset.getString("q_category"));
				v.setqType(rset.getString("q_type"));
				v.setqAbout(rset.getString("q_about"));
				v.setqTitle(rset.getString("q_title"));
				v.setResNo(rset.getString("res_no"));
				v.setFilepath(rset.getString("filepath"));
				v.setUsedDate(rset.getString("used_date"));
				v.setqContent(rset.getString("q_content"));
				v.setqName(rset.getString("q_name"));
				v.setEmail(rset.getString("email"));
				v.setPhone(rset.getString("phone"));
				v.setHome(rset.getString("home"));
				v.setqAuto(rset.getString("q_auto"));
				v.setaCount(rset.getInt("a_count"));
				v.setFilename(rset.getString("filename"));
				list.add(v);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println(list);
		return list;
	}

	public int selectTotalCount(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from question where email = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public InquiryAnswer searchAnswer(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from answer where q_no=?";
		InquiryAnswer ia = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				ia = new InquiryAnswer();
				ia.setaNo(rset.getInt("a_no"));
				ia.setqNo(rset.getInt("q_no"));
				ia.setaContent(rset.getString("a_content"));
				ia.setaDate(rset.getString("a_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return ia;
	}

	public InquiryView selectOneInquiryList(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select ivv.*,(select count(*) from answer where Q_NO=ivv.Q_NO) as \"A_count\" "
				+ "from(select rownum as rnum, iv.*from (select * from question order by q_no desc)iv)ivv where q_no=?";
		InquiryView v = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				v = new InquiryView();
				v.setqNo(rset.getInt("q_no"));
				v.setqCategory(rset.getString("q_category"));
				v.setqType(rset.getString("q_type"));
				v.setqAbout(rset.getString("q_about"));
				v.setqTitle(rset.getString("q_title"));
				v.setResNo(rset.getString("res_no"));
				v.setFilepath(rset.getString("filepath"));
				v.setUsedDate(rset.getString("used_date"));
				v.setqContent(rset.getString("q_content"));
				v.setqName(rset.getString("q_name"));
				v.setEmail(rset.getString("email"));
				v.setPhone(rset.getString("phone"));
				v.setHome(rset.getString("home"));
				v.setqAuto(rset.getString("q_auto"));
				v.setaCount(rset.getInt("a_count"));
				v.setFilename(rset.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return v;
	}
	
}
