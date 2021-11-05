package dining.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import dining.model.vo.Dining;
import dining.model.vo.DiningRes;
import dining.model.vo.DiningReview;
import dining.model.vo.DiningTime;
import dining.model.vo.ResInfo;

public class DiningDao {

	public int insertDining(Connection conn, Dining d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into dining values(dining_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, d.getDiningType());
			pstmt.setString(2, d.getDiningName());
			pstmt.setString(3, d.getDiningInfo());
			pstmt.setString(4, d.getDiningLoc());
			pstmt.setString(5, d.getDiningIntro());
			pstmt.setString(6, ((d.getSeatCnt() == 0) ? null : String.valueOf(d.getSeatCnt())));
			pstmt.setString(7, ((d.getRoomCnt() == 0) ? null : String.valueOf(d.getRoomCnt())));
			pstmt.setString(8, d.getThumbnailImg());
			pstmt.setString(9, d.getDetailedImg());
			pstmt.setString(10, d.getTel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectDiningNo(Connection conn, String thumbnailImg) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int diningNo = 0;
		String query = "select dining_no from dining where thumbnail_img = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, thumbnailImg);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				diningNo = rset.getInt("dining_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return diningNo;
	}

	public int insertDiningTime(Connection conn, DiningTime dt, int diningNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into dining_time values(dining_time_seq.nextval, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			pstmt.setInt(2, dt.getTimeType());
			pstmt.setString(3, dt.getOpen());
			pstmt.setString(4, dt.getClose());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Dining> selectDiningList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Dining> list = new ArrayList<Dining>();
		String query = "select * from (select rownum as rnum, d.* from (select * from dining order by dining_no desc)d) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Dining d = new Dining();
				d.setDiningNo(rset.getInt("dining_no"));
				d.setDiningType(rset.getInt("dining_type"));
				d.setDiningName(rset.getString("dining_name"));
				d.setDiningInfo(rset.getString("dining_info"));
				d.setDiningLoc(rset.getString("dining_loc"));
				d.setDiningIntro(rset.getString("dining_intro"));
				d.setSeatCnt(rset.getInt("seat_cnt"));
				d.setRoomCnt(rset.getInt("room_cnt"));
				d.setThumbnailImg(rset.getString("thumbnail_img"));
				d.setDetailedImg(rset.getString("detailed_img"));
				d.setTel(rset.getString("tel"));
				list.add(d);
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

	public int selectTotalCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from dining";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteDining(Connection conn, int diningNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from dining where dining_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Dining selectOneDining(Connection conn, int diningNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Dining d = null;
		String query = "select * from dining where dining_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				d = new Dining();
				d.setDiningNo(rset.getInt("dining_no"));
				d.setDiningType(rset.getInt("dining_type"));
				d.setDiningName(rset.getString("dining_name"));
				d.setDiningInfo(rset.getString("dining_info"));
				d.setDiningLoc(rset.getString("dining_loc"));
				d.setDiningIntro(rset.getString("dining_intro"));
				d.setSeatCnt(rset.getInt("seat_cnt"));
				d.setRoomCnt(rset.getInt("room_cnt"));
				d.setThumbnailImg(rset.getString("thumbnail_img"));
				d.setDetailedImg(rset.getString("detailed_img"));
				d.setTel(rset.getString("tel"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return d;
	}

	public ArrayList<DiningTime> selectTimeList(Connection conn, int diningNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DiningTime> timeList = new ArrayList<DiningTime>();
		String query = "select * from dining_time where dining_no=? order by time_type";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				DiningTime dt = new DiningTime();
				dt.setDiningNo(rset.getInt("dining_no"));
				dt.setTimeNo(rset.getInt("time_no"));
				dt.setTimeType(rset.getInt("time_type"));
				dt.setOpen(rset.getString("time_open"));
				dt.setClose(rset.getString("time_close"));
				timeList.add(dt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return timeList;
	}

	public int updateDining(Connection conn, Dining d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining set dining_name=?, dining_info=?, dining_loc=?, dining_intro=?, seat_cnt=?, room_cnt=?, thumbnail_img=?, detailed_img=?, tel=? where dining_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getDiningName());
			pstmt.setString(2, d.getDiningInfo());
			pstmt.setString(3, d.getDiningLoc());
			pstmt.setString(4, d.getDiningIntro());
			pstmt.setString(5, ((d.getSeatCnt() == 0) ? null : String.valueOf(d.getSeatCnt())));
			pstmt.setString(6, ((d.getRoomCnt() == 0) ? null : String.valueOf(d.getRoomCnt())));
			pstmt.setString(7, d.getThumbnailImg());
			pstmt.setString(8, d.getDetailedImg());
			pstmt.setString(9, d.getTel());
			pstmt.setInt(10, d.getDiningNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateDiningTime(Connection conn, DiningTime dt) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining_time set time_open=?, time_close=? where dining_no=? and time_type=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dt.getOpen());
			pstmt.setString(2, dt.getClose());
			pstmt.setInt(3, dt.getDiningNo());
			pstmt.setInt(4, dt.getTimeType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Dining> selectAllDining(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Dining> list = new ArrayList<Dining>();
		String query = "select * from dining order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Dining d = new Dining();
				d.setDiningNo(rset.getInt("dining_no"));
				d.setDiningType(rset.getInt("dining_type"));
				d.setDiningName(rset.getString("dining_name"));
				d.setDiningInfo(rset.getString("dining_info"));
				d.setDiningLoc(rset.getString("dining_loc"));
				d.setDiningIntro(rset.getString("dining_intro"));
				d.setSeatCnt(rset.getInt("seat_cnt"));
				d.setRoomCnt(rset.getInt("room_cnt"));
				d.setThumbnailImg(rset.getString("thumbnail_img"));
				d.setDetailedImg(rset.getString("detailed_img"));
				d.setTel(rset.getString("tel"));
				list.add(d);
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

	public int selectFirstDining(Connection conn, int diningType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select * from dining where dining_type=? order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningType);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("dining_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Dining> selectResvList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Dining> list = new ArrayList<Dining>();
		String query = "select * from dining where dining_type=1 order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Dining d = new Dining();
				d.setDiningNo(rset.getInt("dining_no"));
				d.setDiningType(rset.getInt("dining_type"));
				d.setDiningName(rset.getString("dining_name"));
				d.setDiningInfo(rset.getString("dining_info"));
				d.setDiningLoc(rset.getString("dining_loc"));
				d.setDiningIntro(rset.getString("dining_intro"));
				d.setSeatCnt(rset.getInt("seat_cnt"));
				d.setRoomCnt(rset.getInt("room_cnt"));
				d.setThumbnailImg(rset.getString("thumbnail_img"));
				d.setDetailedImg(rset.getString("detailed_img"));
				d.setTel(rset.getString("tel"));
				list.add(d);
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

	public ArrayList<ResInfo> selectResInfoList(Connection conn, int diningNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ResInfo> list = new ArrayList<ResInfo>();
		String query = "select distinct to_char(r1.res_date,'yyyy-mm-dd') as r_date, (select count(*) from dining_res r2 where to_char(r2.res_date,'yyyy-mm-dd') = to_char(r1.res_date,'yyyy-mm-dd') and time_type=1 and dining_no=? and res_status=1) lunch, (select count(*) from dining_res r2 where to_char(r2.res_date,'yyyy-mm-dd') = to_char(r1.res_date,'yyyy-mm-dd') and time_type=2 and dining_no=? and res_status=1) dinner from dining_res r1  where res_date > sysdate order by 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			pstmt.setInt(2, diningNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ResInfo r = new ResInfo();
				r.setRDate(rset.getString("r_date"));
				r.setLunch(rset.getInt("lunch"));
				r.setDinner(rset.getInt("dinner"));
				list.add(r);
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

	public ResInfo selectResInfo(Connection conn, int diningNo, String date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ResInfo r = null;
		String query = "select * from (select distinct to_char(r1.res_date,'yyyy-mm-dd') as r_date, (select count(*) from dining_res r2 where to_char(r2.res_date,'yyyy-mm-dd') = to_char(r1.res_date,'yyyy-mm-dd') and time_type=1 and dining_no=? and res_status=1) lunch, (select count(*) from dining_res r2 where to_char(r2.res_date,'yyyy-mm-dd') = to_char(r1.res_date,'yyyy-mm-dd') and time_type=2 and dining_no=? and res_status=1) dinner from dining_res r1) where r_date=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			pstmt.setInt(2, diningNo);
			pstmt.setString(3, date);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new ResInfo();
				r.setRDate(rset.getString("r_date"));
				r.setLunch(rset.getInt("lunch"));
				r.setDinner(rset.getInt("dinner"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return r;
	}

	public DiningTime selectDiningTime(Connection conn, int diningNo, int timeType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DiningTime dt = null;
		String query = "select * from dining_time where time_type=? and dining_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, timeType);
			pstmt.setInt(2, diningNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dt = new DiningTime();
				dt.setOpen(rset.getString("time_open"));
				dt.setClose(rset.getString("time_close"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dt;
	}

	public int insertDiningResv(Connection conn, DiningRes dr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into dining_res values ('D'||dining_res_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dr.getDiningNo());
			pstmt.setString(2, dr.getMemberId());
			pstmt.setInt(3, dr.getAdtCnt());
			pstmt.setInt(4, dr.getKidCnt());
			pstmt.setString(5, dr.getRDate());
			pstmt.setString(6, dr.getResTime());
			pstmt.setInt(7, dr.getTimeType());
			pstmt.setInt(8, dr.getSeatType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public DiningRes selectDiningResv(Connection conn, String resNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DiningRes dr = null;
		String query = "select r.*, (select dining_name from dining where r.dining_no = dining_no) dining_name, to_char(r.res_date,'yyyy-mm-dd') as r_date from (select * from dining_res where res_no=?)r";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, resNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr = new DiningRes();
				dr.setResNo(rset.getString("res_no"));
				dr.setDiningNo(rset.getInt("dining_no"));
				dr.setMemberId(rset.getString("member_id"));
				dr.setAdtCnt(rset.getInt("guests_adt_cnt"));
				dr.setKidCnt(rset.getInt("guests_kid_cnt"));
				dr.setRDate(rset.getString("r_date"));
				dr.setResTime(rset.getString("res_time"));
				dr.setTimeType(rset.getInt("time_type"));
				dr.setSeatType(rset.getInt("seat_type"));
				dr.setResStatus(rset.getInt("res_status"));
				dr.setDiningName(rset.getString("dining_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dr;
	}

	public int updateDiningResv(Connection conn, DiningRes dr) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining_res set guests_adt_cnt=?, guests_kid_cnt=?, res_date=?, res_time=?, time_type=?, seat_type=? where res_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dr.getAdtCnt());
			pstmt.setInt(2, dr.getKidCnt());
			pstmt.setString(3, dr.getRDate());
			pstmt.setString(4, dr.getResTime());
			pstmt.setInt(5, dr.getTimeType());
			pstmt.setInt(6, dr.getSeatType());
			pstmt.setString(7, dr.getResNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<DiningReview> selectReviewList(Connection conn, int diningNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DiningReview> list = new ArrayList<DiningReview>();
		String query = "select * from dining_review where dining_no=? order by 1 desc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diningNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				DiningReview dr = new DiningReview();
				dr.setDrNo(rset.getInt("d_r_no"));
				dr.setReviewWriter(rset.getString("review_writer"));
				dr.setReviewContent(rset.getString("review_content"));
				dr.setReviewDate(rset.getString("review_date"));
				dr.setStar(rset.getInt("star"));
				dr.setDiningNo(rset.getInt("dining_no"));
				list.add(dr);
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

	public int diningResvCancel(Connection conn, String resNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining_res set res_status=4 where res_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public boolean chkDiningNm(Connection conn, String diningName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
		String query = "select dining_no from dining where dining_name=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, diningName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return result;
	}
}
