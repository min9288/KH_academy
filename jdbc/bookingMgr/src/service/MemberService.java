package service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import dao.MemberDao;
import vo.Member;
import vo.Reservation;

public class MemberService {
	private MemberDao mDao;

	public MemberService() {
		super();
		mDao = new MemberDao();
	}

	public int reservation(Reservation r, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDao.reservation(conn, r, memberNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);			
		}else {
			JDBCTemplate.rollback(conn);			
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int cancelReservation(int resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDao.cancelReservation(conn, resNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public Member mypage(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = mDao.mypage(conn, memberNo);
		JDBCTemplate.close(conn);
		return member;
	}
	public ArrayList<Reservation> myReservationInfo(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = mDao.myReservationInfo(conn,memberNo);
		JDBCTemplate.close(conn);
		return list;
	}


	public Member selectOneMember(Member m) {
			Connection conn = JDBCTemplate.getConnection();
			Member member = mDao.selectOneMember(conn,m);
			JDBCTemplate.close(conn);
			return member;

	}


}
