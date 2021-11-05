package admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import admin.model.vo.Admin_MainData;
import admin.model.vo.Admin_Member;
import admin.model.vo.Admin_Question;
import admin.model.vo.Answer;
import admin.model.vo.Dining_Res;
import admin.model.vo.Lf_Res;
import admin.model.vo.Room_Res;
import common.JDBCTemplate;




public class AdminDao {

	public String selectOneMember_Test(Connection conn, String memberId) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String name = "";
		
		String query = "select MEMBER_KNAME from member where member_id = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				name = rset.getString("member_kname");				
			}
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return name;
	}
	
	public ArrayList<Admin_Question> get_QuestionList(Connection conn, int start, int end) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Admin_Question> list = new ArrayList<Admin_Question>();
		int i = 1;
		
		String query = "select * from (select ROWNUM as rnum, x.*  from (select a.*, b.Q_no AS A_QNO, case when (b.Q_NO IS NULL) then 'false'ELSE 'true' end as reply " 
						+"from question a left outer join answer b On(a.Q_NO = b.Q_NO) order by b.q_no nulls first) x) where rnum between ? and ?";
				
				query = "select h.* from (\r\n" + 
						"select rownum as rnum, g.* from(\r\n" + 
						"select a.* from  (select b.*, case when (c.Q_NO IS NULL) then 'false'ELSE 'true' end as reply from question b left outer join answer c On(b.Q_NO = c.Q_NO) where c.Q_NO IS NULL order by used_date desc) a\r\n" + 
						"union all\r\n" + 
						"select d.* from  (select e.*, case when (f.Q_NO IS NULL) then 'false'ELSE 'true' end as reply from question e left outer join answer f On(e.Q_NO = f.Q_NO) where f.Q_NO IS not NULL order by used_date desc) d\r\n" + 
						")g ) h where rnum between ? and ?";
		try 
		{
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Admin_Question q = new Admin_Question();
				q.setQ_No(rset.getInt("Q_NO"));
				q.setQ_Category(rset.getString("Q_CATEGORY"));
				
				q.setQ_Type(rset.getString("Q_TYPE"));
				q.setQ_About(rset.getString("Q_ABOUT"));
				q.setQ_Title(rset.getString("Q_TITLE"));
				
				q.setRes_No(rset.getString("RES_NO"));
				q.setQ_FileName(rset.getString("FILENAME"));
				q.setQ_FilePath(rset.getString("FILEPATH"));
				q.setUsed_Date(rset.getString("USED_DATE"));
				q.setQ_Content(rset.getString("Q_CONTENT"));
				
				q.setQ_Name(rset.getString("Q_NAME"));
				q.setEmail(rset.getString("EMAIL"));
				q.setPhone(rset.getString("PHONE"));
				q.setHome(rset.getString("HOME"));
				q.setQ_Auto(rset.getString("Q_AUTO"));
				
				q.setQ_reply(Boolean.parseBoolean(rset.getString("reply")));
				q.setQ_rowNum(i++);
				
				list.add(q);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Admin_Question> get_QuestionList_noReply(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Admin_Question> list = new ArrayList<Admin_Question>();
		
		
		String query = "select a.* from question a left outer join answer b On(a.Q_NO = b.Q_NO) where b.Q_NO IS NULL";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Admin_Question q = new Admin_Question();
				q.setQ_No(rset.getInt("Q_NO"));
				q.setQ_Category(rset.getString("Q_CATEGORY"));
				
				q.setQ_Type(rset.getString("Q_TYPE"));
				q.setQ_About(rset.getString("Q_ABOUT"));
				q.setQ_Title(rset.getString("Q_TITLE"));
				
				q.setRes_No(rset.getString("RES_NO"));
				q.setQ_FileName(rset.getString("FILENAME"));
				q.setQ_FilePath(rset.getString("FILEPATH"));
				q.setUsed_Date(rset.getString("USED_DATE"));
				q.setQ_Content(rset.getString("Q_CONTENT"));
				
				q.setQ_Name(rset.getString("Q_NAME"));
				q.setEmail(rset.getString("EMAIL"));
				q.setPhone(rset.getString("PHONE"));
				q.setHome(rset.getString("HOME"));
				q.setQ_Auto(rset.getString("Q_AUTO"));
				
				list.add(q);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Room_Res> get_RoomResList_All(Connection conn, int start, int end) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Room_Res> list = new ArrayList<Room_Res>();
		
		
		String query = "select * from (select ROWNUM as rnum, x.* from (select rrs.* from room_res rrs order by PAY_STATUS ASC) x) where rnum between ? and ? "
				+"ORDER BY DECODE(PAY_STATUS, 3, 1), PAY_STATUS ASC";
		
		String querysave = 
				"select j.* from (\r\n" + 
				"select rownum as rnum, i.* from (\r\n" + 
				"select a.* from  (select b.* from room_res b where pay_status = 3 order by checkin) a\r\n" + 
				"union all\r\n" + 
				"select c.* from (select d.* from room_res d where pay_status = 1 order by checkin) c\r\n" + 
				"union all\r\n" + 
				"select e.* from (select f.* from room_res f where pay_status = 2 order by checkin) e\r\n" + 
				"union all\r\n" + 
				"select g.* from (select h.* from room_res h where pay_status = 4 order by checkin) g\r\n" + 
				") i ) j where rnum between ? and ?";
		try 
		{
			pstmt = conn.prepareStatement(querysave);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Room_Res r = new Room_Res();
				r.setRes_Num(rset.getString("RES_NUM"));
				r.setRoom_No(rset.getInt("ROOM_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setRoom_Type(rset.getString("ROOM_TYPE"));
				r.setRoom_Name(rset.getString("ROOM_NAME"));
				r.setCheckin(rset.getString("CHECKIN"));
				r.setCheckout(rset.getString("CHECKOUT"));
				
				r.setRoom_Price(rset.getInt("ROOM_PRICE"));
				r.setPay_Status(rset.getInt("PAY_STATUS"));
				
				r.setAdult(rset.getInt("ADULT"));
				r.setKid(rset.getInt("KID"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Room_Res> get_RoomResList(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Room_Res> list = new ArrayList<Room_Res>();
		
		
		String query = "select * from room_res where PAY_STATUS = 3";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Room_Res r = new Room_Res();
				r.setRes_Num(rset.getString("RES_NUM"));
				r.setRoom_No(rset.getInt("ROOM_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setRoom_Type(rset.getString("ROOM_TYPE"));
				r.setRoom_Name(rset.getString("ROOM_NAME"));
				r.setCheckin(rset.getString("CHECKIN"));
				r.setCheckout(rset.getString("CHECKOUT"));
				
				r.setRoom_Price(rset.getInt("ROOM_PRICE"));
				r.setPay_Status(rset.getInt("PAY_STATUS"));
				
				r.setAdult(rset.getInt("ADULT"));
				r.setKid(rset.getInt("KID"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	

	public Admin_Question get_Question(Connection conn, int q_no) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Admin_Question q = null;
		
		String query = "select a.*, b.Q_no, case when (b.Q_NO IS NULL) then 'false'ELSE 'true' end as reply from question"
				+ " a left outer join answer b On(a.Q_NO = b.Q_NO) where a.Q_no = ? order by b.q_no nulls first";
				//"select * from question where Q_NO = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, q_no);
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				q = new Admin_Question();
				q.setQ_No(rset.getInt("Q_NO"));
				q.setQ_Category(rset.getString("Q_CATEGORY"));
				
				q.setQ_Type(rset.getString("Q_TYPE"));
				q.setQ_About(rset.getString("Q_ABOUT"));
				q.setQ_Title(rset.getString("Q_TITLE"));
				
				q.setRes_No(rset.getString("RES_NO"));
				q.setQ_FileName(rset.getString("FILENAME"));
				q.setQ_FilePath(rset.getString("FILEPATH"));
				q.setUsed_Date(rset.getString("USED_DATE"));
				q.setQ_Content(rset.getString("Q_CONTENT"));
				
				q.setQ_Name(rset.getString("Q_NAME"));
				q.setEmail(rset.getString("EMAIL"));
				q.setPhone(rset.getString("PHONE"));
				q.setHome(rset.getString("HOME"));
				q.setQ_Auto(rset.getString("Q_AUTO"));
				
				q.setQ_reply(Boolean.parseBoolean(rset.getString("reply")));
			}			
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return q;
	}

	public void get_Room(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from room";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				System.out.println(rset.getInt("room_no"));
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
	}

	public int sendAnswer(Connection conn, int q_no, String a_content) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into ANSWER values(A_SEQ.nextval,?,?,SYSDATE)";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, q_no);			
			pstmt.setString(2, a_content);
		
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Answer get_Answer(Connection conn, String msg) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Answer a = null;
		
		String query = "select * from answer where q_no = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(msg));		
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				a = new Answer
				(rset.getInt("A_NO"),rset.getInt("Q_NO"),rset.getString("A_CONTENT"),rset.getString("A_DATE") );				
			}
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		return a;
	}

	public int updateAnswer(Connection conn, int q_no, String a_content) 
	{
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update answer set a_content = ? where q_no = ?"; 
				//"insert into ANSWER values(A_SEQ.nextval,?,?,SYSDATE)";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a_content);			
			pstmt.setInt(2, q_no);
		
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Room_Res get_RoomRes(Connection conn, String rNo) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Room_Res r = null;
		
		String query = "select * from room_res where res_num = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rNo);		
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				r = new Room_Res();
				r.setRes_Num(rset.getString("RES_NUM"));
				r.setRoom_No(rset.getInt("ROOM_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setRoom_Type(rset.getString("ROOM_TYPE"));
				r.setRoom_Name(rset.getString("ROOM_NAME"));
				r.setCheckin(rset.getString("CHECKIN"));
				r.setCheckout(rset.getString("CHECKOUT"));
				
				r.setRoom_Price(rset.getInt("ROOM_PRICE"));
				r.setPay_Status(rset.getInt("PAY_STATUS"));
				
				r.setAdult(rset.getInt("ADULT"));
				r.setKid(rset.getInt("KID"));		
			}
			
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		return r;
	}

	public int updateRoom_Res(Connection conn, Room_Res r) 
	{
		PreparedStatement pstmt = null;		
		
		/*SimpleDateFormat Data_format = new SimpleDateFormat("yy/MM/dd");		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date chickIn;
		String date_in = "";
		
		Date chickOut;
		String date_out = "";
		
		try 
		{
			chickIn = transFormat.parse(r.getCheckin());
			date_in = Data_format.format(chickIn);
			
			chickOut = transFormat.parse(r.getCheckout());
			date_out = Data_format.format(chickOut);
		} 
		catch (ParseException e1) {	e1.printStackTrace();}	*/
		
		int result = 0;
		String query = "update room_res set room_no = ?, room_type = ?, room_name = ?, "
				+ "checkin = to_date(?,'YYYY-MM-DD HH24:MI:SS'), checkout = to_date(?,'YYYY-MM-DD HH24:MI:SS'), "
				+ "pay_status = ?, adult = ?, kid = ?  where RES_NUM = ?";			
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getRoom_No());
			pstmt.setString(2, r.getRoom_Type());
			pstmt.setString(3, r.getRoom_Name());
			pstmt.setString(4, r.getCheckin());
			pstmt.setString(5, r.getCheckout());
			pstmt.setInt(6, r.getPay_Status());
			
			pstmt.setInt(7, r.getAdult());
			pstmt.setInt(8, r.getKid());	
			
			pstmt.setString(9, r.getRes_Num());			
			
			result = pstmt.executeUpdate();			
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int selectTotalCount_Question(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from question";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;		
	}

	public int selectTotalCount_RoomResList(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from room_res";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;	
	}

	public ArrayList<Dining_Res> get_DiningList(Connection conn, int start, int end) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Dining_Res> list = new ArrayList<Dining_Res>();
		
		
		String query = "select *from (select rownum as rnum,dres.* from dining_res dres order by res_status) where rnum between ? and ? " 
		+"ORDER BY DECODE(RES_STATUS, 3, 1), RES_STATUS ASC";
		
		
		String querysave = 
				"select j.* from (\r\n" + 
				"select rownum as rnum, i.* from (\r\n" + 
				"select a.* from  (select b.* from dining_res b where res_status = 3 order by res_date) a\r\n" + 
				"union all\r\n" + 
				"select c.* from (select d.* from dining_res d where res_status = 1 order by res_date) c\r\n" + 
				"union all\r\n" + 
				"select e.* from (select f.* from dining_res f where res_status = 2 order by res_date) e\r\n" + 
				"union all\r\n" + 
				"select g.* from (select h.* from dining_res h where res_status = 4 order by res_date) g\r\n" + 
				") i ) j where rnum between ? and ?";
		
		try 
		{
			pstmt = conn.prepareStatement(querysave);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Dining_Res r = new Dining_Res();
				r.setRes_No(rset.getString("RES_NO"));
				r.setDining_No(rset.getInt("DINING_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setGuests_Adt_Cnt(rset.getInt("GUESTS_ADT_CNT"));
				r.setGuests_Kid_Cnt(rset.getInt("GUESTS_KID_CNT"));
				r.setRes_Date(rset.getString("RES_DATE"));
				r.setRes_Time(rset.getString("RES_TIME"));
				r.setTime_Type(rset.getInt("TIME_TYPE"));
				r.setSeat_Type(rset.getInt("SEAT_TYPE"));
				r.setRes_Status(rset.getInt("RES_STATUS"));
				
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;		
		//select * from dining_res order by res_status
		
	}

	public int selectTotalCount_DiningResList(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from dining_res";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;	
	}

	public Dining_Res get_DiningRes(Connection conn, String dNum) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Dining_Res r = null;
		
		String query = "select * from dining_res where res_no = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dNum);		
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				r = new Dining_Res();
				r.setRes_No(rset.getString("RES_NO"));
				r.setDining_No(rset.getInt("DINING_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setGuests_Adt_Cnt(rset.getInt("GUESTS_ADT_CNT"));
				r.setGuests_Kid_Cnt(rset.getInt("GUESTS_KID_CNT"));
				r.setRes_Date(rset.getString("RES_DATE"));
				r.setRes_Time(rset.getString("RES_TIME"));
				r.setTime_Type(rset.getInt("TIME_TYPE"));
				r.setSeat_Type(rset.getInt("SEAT_TYPE"));
				r.setRes_Status(rset.getInt("RES_STATUS"));
			}			
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		return r;
	}

	public int update_DiningRes(Connection conn, Dining_Res r) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining_res set dining_No = ?, member_Id = ?, GUESTS_ADT_CNT = ?, GUESTS_KID_CNT = ?, res_date = to_date(?,'YYYY-MM-DD HH24:MI:SS'), res_time = ?, ";
		query += "time_type = ?, seat_type = ?, res_status = ? ";
		query += "where RES_NO = ?";
		
		//개빡치네 SYSDATE 관련 이슈 literal does not match format string;
		
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getDining_No());
			pstmt.setString(2, r.getMember_Id());
			pstmt.setInt(3, r.getGuests_Adt_Cnt());
			pstmt.setInt(4, r.getGuests_Kid_Cnt());
			
			pstmt.setString(5, r.getRes_Date());
			pstmt.setString(6, r.getRes_Time());
			
			pstmt.setInt(7, r.getTime_Type());
			pstmt.setInt(8, r.getSeat_Type());
			pstmt.setInt(9, r.getRes_Status());
			
			pstmt.setString(10, r.getRes_No());
		
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Lf_Res> get_LfResList(Connection conn, int start, int end) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Lf_Res> list = new ArrayList<Lf_Res>();
		String query = 
				"select *from (select rownum as rnum,dres.* from lf_res dres order by status) where rnum between ? and ? " 
				+"ORDER BY DECODE(status, 3, 1), status ASC";
		
		String querysave = 
				"select j.* from (\r\n" + 
				"select rownum as rnum, i.* from (\r\n" + 
				"select a.* from  (select b.* from lf_res b where status = 3 order by res_date) a\r\n" + 
				"union all\r\n" + 
				"select c.* from (select d.* from lf_res d where status = 1 order by res_date) c\r\n" + 
				"union all\r\n" + 
				"select e.* from (select f.* from lf_res f where status = 2 order by res_date) e\r\n" + 
				"union all\r\n" + 
				"select g.* from (select h.* from lf_res h where status = 4 order by res_date) g\r\n" + 
				") i ) j where rnum between ? and ?";
		
		try 
		{
			pstmt = conn.prepareStatement(querysave);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Lf_Res r = new Lf_Res();
				r.setRes_No(rset.getString("RES_NO"));
				r.setLf_No(rset.getInt("LF_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setRes_People(rset.getInt("RES_PEOPLE"));
				r.setRes_Date(rset.getString("RES_DATE"));
				r.setRes_Time(rset.getString("RES_TIME"));
				r.setStatus(rset.getInt("STATUS"));
				r.setPrice(rset.getInt("PRICE"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;		
	}

	public int selectTotalCount_LfResList(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from lf_res";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;	
	}

	public Lf_Res get_Lf_Res(Connection conn, String lNum) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Lf_Res r = null;
		
		String query = "select * from lf_res where res_no = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lNum);		
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				r = new Lf_Res();
				r.setRes_No(rset.getString("RES_NO"));
				r.setLf_No(rset.getInt("LF_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setRes_People(rset.getInt("RES_PEOPLE"));
				r.setRes_Date(rset.getString("RES_DATE"));
				r.setRes_Time(rset.getString("RES_TIME"));
				r.setStatus(rset.getInt("STATUS"));
				r.setPrice(rset.getInt("PRICE"));
			}			
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		return r;
	}

	public int update_LfRes(Connection conn, Lf_Res r) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update lf_res SET LF_NO = ?, RES_PEOPLE = ?, RES_DATE = to_date(?,'YYYY-MM-DD HH24:MI:SS'), "
				+ "RES_TIME = ?, STATUS = ?, PRICE = ? WHERE res_no = ?";
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getLf_No());
			pstmt.setInt(2, r.getRes_People());
			pstmt.setString(3, r.getRes_Date());
			pstmt.setString(4, r.getRes_Time());
			pstmt.setInt(5, r.getStatus());
			pstmt.setInt(6, r.getPrice());			
			pstmt.setString(7, r.getRes_No());
		
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Admin_Member> get_MemberList(Connection conn, int start, int end) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Admin_Member> list = new ArrayList<Admin_Member>();
		String query = 
				"select *from (select rownum as rnum,dres.* from member dres order by member_level desc) where rnum between ? and ?";
		
		String querysave = "SELECT B.* FROM (\r\n" + 
				"SELECT  rownum as rnum, A.* FROM (\r\n" + 
				"SELECT DRES.* FROM MEMBER DRES ORDER BY MEMBER_LEVEL DESC) A) B WHERE rnum between ? AND ?";
		
		
		try 
		{
			pstmt = conn.prepareStatement(querysave);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Admin_Member r = new Admin_Member();
				r.setMember_No(rset.getInt("MEMBER_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Pw(rset.getString("MEMBER_PW"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setMember_Lname(rset.getString("MEMBER_LNAME"));
				r.setMember_Fname(rset.getString("MEMBER_FNAME"));
				
				r.setMember_Level(rset.getInt("MEMBER_LEVEL"));
				r.setPhone(rset.getString("PHONE"));
				r.setBirth(rset.getInt("BIRTH"));
				r.setEmail(rset.getString("EMAIL"));
				r.setPoint(rset.getInt("POINT"));
				r.setEnroll_Date(rset.getString("ENROLL_DATE"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int selectTotalCount_MemberList(Connection conn) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from member";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;	
	}

	public Admin_Member get_Member(Connection conn, int mNo) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Admin_Member r = null;
		
		String query = "select * from member where member_no = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				r = new Admin_Member();
				r.setMember_No(rset.getInt("MEMBER_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Pw(rset.getString("MEMBER_PW"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setMember_Lname(rset.getString("MEMBER_LNAME"));
				r.setMember_Fname(rset.getString("MEMBER_FNAME"));
				
				r.setMember_Level(rset.getInt("MEMBER_LEVEL"));
				r.setPhone(rset.getString("PHONE"));
				r.setBirth(rset.getInt("BIRTH"));
				r.setEmail(rset.getString("EMAIL"));
				r.setPoint(rset.getInt("POINT"));
				r.setEnroll_Date(rset.getString("ENROLL_DATE"));
			}			
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return r;
	}

	public int update_Member(Connection conn, Admin_Member r) 
	{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update MEMBER SET MEMBER_PW = ?, MEMBER_KNAME = ?, MEMBER_LNAME = ?, MEMBER_FNAME = ?, MEMBER_LEVEL = ?, PHONE = ?,"
				+ " BIRTH = ?, POINT = ? where MEMBER_NO = ?";
	
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getMember_Pw());
			
			pstmt.setString(2, r.getMember_Kname());
			pstmt.setString(3, r.getMember_Lname());
			pstmt.setString(4,  r.getMember_Fname());
			
			pstmt.setInt(5, r.getMember_Level());
			pstmt.setString(6, r.getPhone());
			pstmt.setInt(7, r.getBirth());
			pstmt.setInt(8, r.getPoint());
			
			pstmt.setInt(9, r.getMember_No());
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) {	e.printStackTrace(); }
		finally 
		{
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Admin_Member> get_MemberList_forSearch(Connection conn, String inputData, String data_type) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Admin_Member> list = new ArrayList<Admin_Member>();
		
		String query = 
				"select * from member where ";
		query += data_type;
		query += " = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			
			if(data_type == "MEMBER_LEVEL")
			{
				pstmt.setInt(1, Integer.parseInt(inputData));
			}
			else
			{
				pstmt.setString(1,inputData);
			}
			
		
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Admin_Member r = new Admin_Member();
				r.setMember_No(rset.getInt("MEMBER_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Pw(rset.getString("MEMBER_PW"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setMember_Lname(rset.getString("MEMBER_LNAME"));
				r.setMember_Fname(rset.getString("MEMBER_FNAME"));
				
				r.setMember_Level(rset.getInt("MEMBER_LEVEL"));
				r.setPhone(rset.getString("PHONE"));
				r.setBirth(rset.getInt("BIRTH"));
				r.setEmail(rset.getString("EMAIL"));
				r.setPoint(rset.getInt("POINT"));
				r.setEnroll_Date(rset.getString("ENROLL_DATE"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;		
	}

	public ArrayList<Admin_Member> get_MemberList_forSearch(Connection conn, int start, int end, String dataType,
			String data) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Admin_Member> list = new ArrayList<Admin_Member>();
		String query = 
				"select * from (select rownum as rnum,dres.* from member dres where " + dataType + " = ? order by member_level desc) where rnum between ? and ?";
		String dataSet = data;
		
		if(!dataType.equals("MEMBER_LEVEL"))
		{			
			dataSet = "%"+data+"%";
			query = "select * from (select rownum as rnum,dres.* from member dres where "+dataType+" like ? order by member_level desc) where rnum between ? and ?";			
		}
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			
			if(dataType == "MEMBER_LEVEL")
			{
				pstmt.setInt(1, Integer.parseInt(data));
				pstmt.setInt(2,start);
				pstmt.setInt(3, end);
			}
			else
			{
				pstmt.setString(1,dataSet);
				pstmt.setInt(2,start);
				pstmt.setInt(3, end);
			}
			
		
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				Admin_Member r = new Admin_Member();
				r.setMember_No(rset.getInt("MEMBER_NO"));
				r.setMember_Id(rset.getString("MEMBER_ID"));
				r.setMember_Pw(rset.getString("MEMBER_PW"));
				r.setMember_Kname(rset.getString("MEMBER_KNAME"));
				r.setMember_Lname(rset.getString("MEMBER_LNAME"));
				r.setMember_Fname(rset.getString("MEMBER_FNAME"));
				
				r.setMember_Level(rset.getInt("MEMBER_LEVEL"));
				r.setPhone(rset.getString("PHONE"));
				r.setBirth(rset.getInt("BIRTH"));
				r.setEmail(rset.getString("EMAIL"));
				r.setPoint(rset.getInt("POINT"));
				r.setEnroll_Date(rset.getString("ENROLL_DATE"));
				list.add(r);
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;	
	}

	public int selectTotalCount_MemberList_forSearch(Connection conn ,String dataType ,String data)  
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from (select * from member where "+ dataType +" like ?)";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+data+"%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				result = rset.getInt("cnt");
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		
		return result;	
	}

	public ArrayList<Integer> Get_MainChartInfo(Connection conn, ArrayList<String> dateList) 
	{
		int length = dateList.size();
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from room_res where checkin = to_date(?,'YY/MM/DD')";
		
		for(int i = 0; i < length; ++i)
		{
			try 
			{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,dateList.get(i));
				
				rset = pstmt.executeQuery();
				
				if(rset.next())
				{
					result = rset.getInt("cnt");
				}
				
				list.add(result);
			} 
			catch (SQLException e) {e.printStackTrace();}
			finally 
			{
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		}
		
		return list;
	}

	public ArrayList<Admin_MainData> Get_MainChartInfo_Map(Connection conn, ArrayList<String> dateList) 
	{
		int length = dateList.size();
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		ArrayList<Admin_MainData> list = new ArrayList<Admin_MainData>();
		
		String query = "select count(*) as cnt from (select * from room_res where to_date(checkin,'YY/MM/DD') = to_date(?,'YY/MM/DD')) c where PAY_STATUS != 4";
		
		for(int i = 0; i < length; ++i)
		{
			try 
			{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,dateList.get(i));
				
				rset = pstmt.executeQuery();
				
				if(rset.next())
				{
					result = rset.getInt("cnt");
				}
				
				
				list.add( new Admin_MainData(dateList.get(i),result) );				
				
			} 
			catch (SQLException e) {e.printStackTrace();}
			finally 
			{
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
		}
		
		return list;
	}

	public int get_TodayProgress(Connection conn, String toDay) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		int res_count = 0;
		int res_progress = 0;
		
		String query = "select * from room_res where to_date(checkin,'YY/MM/DD') = to_date(?,'YY/MM/DD')";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,toDay);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				int payStatus = rset.getInt("PAY_STATUS");
				
				if(payStatus == 1)//예약 완료상태
				{
					++res_count;
					++res_progress;
				}
				else if(payStatus == 2)//이용 완료 상태
				{
					++res_count;
				}
			}					
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}	
		
		
		float result_f = ((float)res_progress/(float)res_count) * 100;		
		return (int)result_f;
	}

	public int get_TodayCancel(Connection conn, String toDay) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		int res_count = 0;
		int res_cancel = 0;
		
		String query = "select * from room_res where to_date(checkin,'YY/MM/DD') = to_date(?,'YY/MM/DD')";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,toDay);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{				
				int payStatus = rset.getInt("PAY_STATUS");
				if(payStatus == 4)//취소 완료
				{
					++res_count;
					++res_cancel;
				}
				else //전체 예약수
				{
					++res_count;
				}
			}			
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		float result_f = ((float)res_cancel/(float)res_count) * 100;		
		return (int)result_f;
	}

	public int get_TodayVacancyRate(Connection conn, String toDay) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		ArrayList<Integer> list  = get_RoomNo(conn);
		
		int room_count = list.size();
		int res_count = 0;		
		
		int indexMax = list.size();
		
		String query = "select * from room_res where to_date(checkin,'YY/MM/DD') = to_date(?,'YY/MM/DD')";
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,toDay);
			
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{
				for(int i = 0; i < indexMax; ++i)
				{					
					if(list.get(i) == rset.getInt("room_no"))
					{
						list.remove(i);
						indexMax = list.size();
						break;
					}
				}
			}			
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		res_count = list.size(); //예약없는 방
		float result_f = ((float)res_count/(float)room_count) * 100;		
		return (int)result_f;
	}
	
	public ArrayList<Integer> get_RoomNo(Connection conn)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String queryRoom = "select ROOM_NO from room";		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try 
		{
			pstmt = conn.prepareStatement(queryRoom);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{				
				list.add(rset.getInt("ROOM_NO"));
			}			
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;		
	}

	public int get_NowdayVacancyRate(Connection conn, String toDay) 
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		int count = 0;
		int active = 0;
		
		String query= "select room_status as STATUS from room";		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try 
		{
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next())
			{	
				++count;				
				if(rset.getInt("STATUS") == 1)
					++active;
			}			
		} 
		catch (SQLException e) {e.printStackTrace();}
		finally 
		{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		float result_f = ((float)active/(float)count) * 100;		
		
		return (int)result_f;
	}
}
