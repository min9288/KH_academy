package dao;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

import vo.Memo;

public class Dao {
	public int update(Memo m) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		int result = 0;
//		String query = "update memo name = ?, msg = ? where no = ?";
		String query = "update memo set name = ?, msg = ? where no = ?";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "oracleuser", "pwd1234");
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getName());
			pstmt.setString(2, m.getMsg());
			pstmt.setInt(3, m.getNo());
			result = pstmt.executeUpdate();
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
//			result = pstmt.executeQuery();

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			try {

				pstmt.close();

				conn.close();

			} catch (SQLException e) {

				e.printStackTrace();

			}

		}

		return result;

	}
}
