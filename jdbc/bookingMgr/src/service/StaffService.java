package service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import dao.StaffDao;
import vo.Accommodation;
import vo.Member;
import vo.Reservation;


public class StaffService {
	private StaffDao sDao;

	public StaffService() {
		super();
		sDao = new StaffDao();
	}

	public ArrayList<Accommodation> selectAccList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Accommodation>acc = sDao.selectAccList(conn);
		JDBCTemplate.close(conn);
		return acc;
	}

	public int insertAcc(Accommodation acc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = sDao.insertAcc(conn,acc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int deleteAcc(int acc) {
		Connection conn = JDBCTemplate.getConnection();
		int result =  sDao.deleteAcc(conn,acc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public ArrayList<Reservation> selectAllRes() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation>resList = sDao.selectAllRes(conn);
		JDBCTemplate.close(conn);
		return resList;
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member>memList = sDao.selectAllMember(conn);
		return memList;
	}
}
