package tourguide.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.dao.FaqDao;
import tourguide.model.dao.TourguideDao;
import tourguide.model.vo.Tourguide;

public class TourguideService {

	public ArrayList<Tourguide> selectTgList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Tourguide> list= new TourguideDao().selectTgList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertTg(Tourguide tg) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new TourguideDao().insertTg(conn,tg);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteTg(int tgNo) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new TourguideDao().deleteTg(conn,tgNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateTg(Tourguide tg) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new TourguideDao().updateTg(conn,tg);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
