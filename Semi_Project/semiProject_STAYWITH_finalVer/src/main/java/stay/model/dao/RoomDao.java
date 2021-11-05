package stay.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import stay.model.vo.Room;
import stay.model.vo.RoomR;
/*객실등록*/
import stay.model.vo.RoomReserve;
import stay.model.vo.RoomReview;
public class RoomDao {

   public int insertRoom(Connection conn, Room r) {
      PreparedStatement pstmt =null; 

      int result =0;
      String query ="INSERT INTO ROOM VALUES(ROOM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      
      System.out.println(r.getRoomType());


      try {
         pstmt =conn.prepareStatement(query);// 문법검사

   
         
         pstmt.setString(1,r.getRoomType());
         pstmt.setString(2,r.getRoomName());
         pstmt.setString(3,r.getRoomDetail());
         pstmt.setString(4,r.getRoomLoc());
         pstmt.setString(5,r.getRoomSize());
         pstmt.setString(6,r.getBed());
         pstmt.setString(7,r.getRoomForm());
         pstmt.setString(8,r.getRoomView());
         pstmt.setInt(9,r.getMaxNum());
         pstmt.setInt(10,r.getRoomPrice());
         pstmt.setString(11,r.getRoomImg());
         pstmt.setString(12,r.getRoomInfo());
         pstmt.setInt(13,r.getRoomStatus());
         
         result=pstmt.executeUpdate();//결과실행

      } catch (SQLException e) {
         e.printStackTrace();
      }finally {

         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   /*객실전체조회*/
   public ArrayList<Room> selectAllRoom(Connection conn) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="select * from Room order by room_no"; 
      try {
         pstmt =conn.prepareStatement(query);
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomType(rset.getString("ROOM_TYPE"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));

            list.add(r);
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
/*객실상세조회*/
   public Room selectOneRoom(Connection conn,int roomNo) {

      PreparedStatement pstmt =null;  //sql구문을 전달하고 결과를 받아오는 객체
      ResultSet rset =null;  //select 쿼리 수행결과를 저장하는 객체

      Room r =null;
      String query="select *from Room where room_no=?"; 
      try {

         pstmt =conn.prepareStatement(query);
         pstmt.setInt(1, roomNo);
         rset=pstmt.executeQuery();
         
            if(rset.next()) {
               r =new Room();
               r.setRoomNo(rset.getInt("ROOM_NO"));
               r.setRoomType(rset.getString("ROOM_TYPE"));
               r.setRoomName(rset.getString("ROOM_NAME"));
               r.setRoomDetail(rset.getString("ROOM_DETAIL"));
               r.setRoomLoc(rset.getString("ROOM_LOC"));
               r.setRoomSize(rset.getString("ROOM_SIZE"));
               r.setBed(rset.getString("BED"));
               r.setRoomForm(rset.getString("ROOM_FORM"));
               r.setRoomView(rset.getString("ROOM_VIEW"));
               r.setMaxNum(rset.getInt("MAX_NUM"));
               r.setRoomPrice(rset.getInt("ROOM_PRICE"));
               r.setRoomImg(rset.getString("ROOM_IMG"));
               r.setRoomInfo(rset.getString("ROOM_INFO"));
               r.setRoomStatus(rset.getInt("ROOM_STATUS"));

         }
      } catch (SQLException e) {
         e.printStackTrace();

      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }

      return r;   

   }
   /*객실수정*/
   public int updateRoom(Connection conn, Room r) {
      PreparedStatement pstmt=null;
      int result=0;
      String query="UPDATE ROOM SET ROOM_TYPE=?,ROOM_NAME=?,ROOM_DETAIL=?,ROOM_LOC=?,ROOM_SIZE=?,BED=?,ROOM_FORM=?,ROOM_VIEW=?,\r\n" + 
            "MAX_NUM=?,ROOM_PRICE=?,ROOM_IMG=?,ROOM_STATUS=? WHERE ROOM_NO=?";
      try {
         pstmt = conn.prepareStatement(query);

         pstmt.setString(1,r.getRoomType());
         pstmt.setString(2,r.getRoomName());
         pstmt.setString(3,r.getRoomDetail());
         pstmt.setString(4,r.getRoomLoc());
         pstmt.setString(5,r.getRoomSize());
         pstmt.setString(6,r.getBed());
         pstmt.setString(7,r.getRoomForm());
         pstmt.setString(8,r.getRoomView());
         pstmt.setInt(9,r.getMaxNum());
         pstmt.setInt(10,r.getRoomPrice());
         pstmt.setString(11,r.getRoomImg());
         pstmt.setInt(12,r.getRoomStatus());
         pstmt.setInt(13,r.getRoomNo());
      
         result=pstmt.executeUpdate();

      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   
   /*객실삭제*/
   public int deleteRoom(Connection conn, int roomNo) {
      PreparedStatement pstmt =null;  
      int result=0;
      String query="delete from Room where room_no=?"; 

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, roomNo);

         result=pstmt.executeUpdate();

      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   /*객실예약상세*/

   public RoomReserve detailReserve(Connection conn, String resNum) {
      PreparedStatement pstmt =null;  //sql구문을 전달하고 결과를 받아오는 객체
      ResultSet rset =null;  //select 쿼리 수행결과를 저장하는 객체

      RoomReserve res =null;
      String query=" select r1.*,\r\n" + 
            "    (select to_char(r2.checkin, 'yyyy-mm-dd') from room_res r2 where r1.res_num=r2.res_num) r_checkin,\r\n" + 
            "    (select to_char(r2.checkout, 'yyyy-mm-dd') from room_res r2 where r1.res_num=r2.res_num) r_checkout\r\n" + 
            "from room_res r1 where res_num=?"; 
      try {

         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, resNum);
         rset=pstmt.executeQuery();
         
            if(rset.next()) {
               res =new RoomReserve();
               
               res.setResNum(rset.getString("RES_NUM"));
               res.setRoomNo(rset.getInt("ROOM_NO"));
               res.setMemberId(rset.getString("MEMBER_ID"));
               res.setMemberKname(rset.getString("MEMBER_KNAME"));
               res.setRoomType(rset.getString("ROOM_TYPE"));
               res.setRoomName(rset.getString("ROOM_NAME"));
               res.setCheckIn(rset.getString("r_checkin"));
               res.setCheckOut(rset.getString("r_checkout"));
               res.setRoomPrice(rset.getInt("ROOM_PRICE"));
               res.setPayStatus(rset.getInt("PAY_STATUS"));
               res.setAdult(rset.getInt("ADULT"));
               res.setKid(rset.getInt("KID"));

         }
      } catch (SQLException e) {
         e.printStackTrace();

      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }

      return res;   
}
   /*예약취소*/
   public int cancleReserve(Connection conn, RoomReserve reserve) {
      PreparedStatement pstmt =null;  
      int result=0;
      String query="update room_res set pay_status=3 where member_kname=? and res_Num=?"; 

      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, reserve.getMemberKname());
         pstmt.setString(2, reserve.getResNum());

         result=pstmt.executeUpdate();

      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   
   

   /*카테고리별 조회*/

   public ArrayList<Room> selectType(Connection conn, String roomType) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="SELECT * FROM ROOM where room_Type=? "; 
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, roomType);
         
      
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
         
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));
            r.setRoomType(rset.getString("ROOM_TYPE"));

            list.add(r);
      
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   

   /*객실예약변경*/
   public int updateReserve(Connection conn, RoomReserve reserve) {
      PreparedStatement pstmt =null;  
      int result=0;
      
      String query="update room_res set checkIn=?,checkOut=?,adult=?,kid=? where res_num=?"; 
      
      System.out.println(reserve.getRoomName());
      System.out.println(reserve.getCheckIn());
      System.out.println(reserve.getCheckOut());
      System.out.println(reserve.getAdult());
      System.out.println(reserve.getKid());
      System.out.println(reserve.getResNum());
      try {
         pstmt = conn.prepareStatement(query);
       
         pstmt.setString(1, reserve.getCheckIn());
         pstmt.setString(2, reserve.getCheckOut());
         pstmt.setInt(3, reserve.getAdult());
         pstmt.setInt(4, reserve.getKid());
         pstmt.setString(5, reserve.getResNum());
         result=pstmt.executeUpdate();

      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   /*예약내역*/
   public ArrayList<RoomReserve> selectAllReserveR(Connection conn) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<RoomReserve> list = new ArrayList<RoomReserve>();
      String query="select * from ROOM_RES order by room_no"; 
      try {
         pstmt =conn.prepareStatement(query);
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            RoomReserve res =new RoomReserve();
            
            res.setAdult(rset.getInt("adult"));
            res.setCheckIn(rset.getString("checkIn"));
            res.setCheckOut(rset.getString("checkOut"));
            res.setKid(rset.getInt("kid"));
            res.setMemberId(rset.getString("member_Id"));
            res.setMemberKname(rset.getString("member_Kname"));
            res.setPayStatus(rset.getInt("pay_Status"));
            res.setResNum(rset.getString("res_Num"));
            res.setRoomName(rset.getString("room_Name"));
            res.setRoomNo(rset.getInt("room_No"));
            res.setRoomPrice(rset.getInt("room_Price"));
            res.setRoomType(rset.getString("room_Type"));
         

            list.add(res);
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   /*객실예약*/
   public int insertReserve(Connection conn, RoomReserve reserve) {
      PreparedStatement pstmt =null; 

      int result =0;
      String query ="INSERT INTO ROOM_res VALUES('R'||rRES_SEQ.nextval,?,?,?,?,?,?,?,?,1,?,?)";
      

      try {
         pstmt =conn.prepareStatement(query);// 문법검사
         pstmt.setInt(1, reserve.getRoomNo());
         pstmt.setString(2, reserve.getMemberId());
         pstmt.setString(3, reserve.getMemberKname());
         pstmt.setString(4, reserve.getRoomType());
         pstmt.setString(5, reserve.getRoomName());
         pstmt.setString(6, reserve.getCheckIn());
         pstmt.setString(7, reserve.getCheckOut());
         pstmt.setInt(8, reserve.getRoomPrice());
         pstmt.setInt(9, reserve.getAdult());
         pstmt.setInt(10, reserve.getKid());

      
         
         result=pstmt.executeUpdate();//결과실행

      } catch (SQLException e) {
         e.printStackTrace();
      }finally {

         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   
   public ArrayList<Room> selectRoomList(Connection conn, int start, int end) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="select *from (select rownum as rnum,r.*from(select * from Room order by room_no desc)r) where rnum between ? and ?"; 
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setInt(1,start);
         pstmt.setInt(2, end);
         
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomType(rset.getString("ROOM_TYPE"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));

            list.add(r);
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   /*게시글 개수*/
   public int selectTotalCount(Connection conn) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null; //조회시 사용
      int result =0;
      String query="select count(*) as cnt from room";
      try {
         pstmt =conn.prepareStatement(query);
         rset=pstmt.executeQuery();
         if(rset.next()) {
            result =rset.getInt("cnt");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   /*후기*/
   public ArrayList<Room> selectRoomName(Connection conn, String roomName) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="select *from room_review where room_name=? "; 
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, roomName);
         
      
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
         
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));
            r.setRoomType(rset.getString("ROOM_TYPE"));

            list.add(r);
      
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
/*체크인*/
   public ArrayList<Room> selectCheck(Connection conn, String checkIn, String checkOut) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="select a.*from room a where a.ROOM_STATUS = 1 and not exists ( select 'x'from room_res b where b.room_No = a.room_No and (? between b.checkIn and b.checkOut  or ?  between b.checkIn and b.checkOut)and b.PAY_STATUS = 2)order by a.room_No" 
            ;  
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, checkIn);
         pstmt.setString(2, checkOut);
         
      
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
         
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));
            r.setRoomType(rset.getString("ROOM_TYPE"));

            list.add(r);
      
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }

   public ArrayList<RoomR> selectRoom(Connection conn, RoomReserve reserve) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<RoomR> list = new ArrayList<RoomR>();
      String query="select a.*\r\n" + 
             ", ? checkIn, ? checkOut, ? adult, ? kid\r\n" + 
            "  from room a\r\n" + 
            " where a.ROOM_STATUS = 1 \r\n" + 
            "   and a.room_name = case when ? is null then a.room_name else ? end\r\n" + 
            "   and a.bed = case when ? is null then a.bed else ? end\r\n" + 
            "   and a.max_num >= (? + ?)\r\n" + 
            "   and not exists ( select 'x'\r\n" + 
            "                      from room_res b\r\n" + 
            "                     where b.room_No = a.room_No\r\n" + 
            "                       and (? between b.checkIn and b.checkOut  or ?  between b.checkIn and b.checkOut)\r\n" + 
            "                       and b.PAY_STATUS = 2)\r\n" + 
            "order by a.room_No"  ;  
      
      
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1,reserve.getCheckIn() );
         pstmt.setString(2, reserve.getCheckOut());
         pstmt.setInt(3, reserve.getAdult());
         pstmt.setInt(4, reserve.getKid());
         pstmt.setString(5, reserve.getRoomName());
         pstmt.setString(6, reserve.getRoomName());
         pstmt.setString(7, reserve.getBed());
         pstmt.setString(8, reserve.getBed());
         pstmt.setInt(9, reserve.getAdult());
         pstmt.setInt(10, reserve.getKid());
         pstmt.setString(11,reserve.getCheckIn() );
         pstmt.setString(12, reserve.getCheckOut());
         
         
      
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            RoomR rr =new RoomR();
            
         
            rr.setRoomNo(rset.getInt("ROOM_NO"));
            rr.setRoomName(rset.getString("ROOM_NAME"));
            rr.setRoomDetail(rset.getString("ROOM_DETAIL"));
            rr.setRoomLoc(rset.getString("ROOM_LOC"));
            rr.setRoomSize(rset.getString("ROOM_SIZE"));
            rr.setBed(rset.getString("BED"));
            rr.setRoomForm(rset.getString("ROOM_FORM"));
            rr.setRoomView(rset.getString("ROOM_VIEW"));
            rr.setMaxNum(rset.getInt("MAX_NUM"));
            rr.setRoomPrice(rset.getInt("ROOM_PRICE"));
            rr.setRoomImg(rset.getString("ROOM_IMG"));
            rr.setRoomInfo(rset.getString("ROOM_INFO"));
            rr.setRoomStatus(rset.getInt("ROOM_STATUS"));
            rr.setRoomType(rset.getString("ROOM_TYPE"));

            rr.setCheckIn(rset.getString("checkIn"));
            rr.setCheckOut(rset.getString("checkOut"));
            rr.setAdult(rset.getInt("adult"));
            rr.setKid(rset.getInt("kid"));
            list.add(rr);
      
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   /*후기조회*/
   public ArrayList<RoomReview> selectRoomReview(Connection conn, String roomName) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<RoomReview> list = new ArrayList<RoomReview>();
      String query="select *from room_review where room_name=? "; 
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, roomName);
         
      
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            RoomReview rew =new RoomReview();
         
            rew.setRRNo(rset.getInt("r_r_no"));
                rew.setCheckInDate(rset.getString("checkIn_Date"));
                rew.setCheckOutDate(rset.getString("checkOut_Date"));
                rew.setResNum(rset.getString("res_Num"));
                rew.setReviewContent(rset.getString("review_Content"));
                rew.setReviewDate(rset.getString("review_Date"));
                rew.setReviewWriter(rset.getString("review_Writer"));
                rew.setRoomName(rset.getString("room_Name"));
                rew.setRoomNo(rset.getInt("ROOM_NO"));
                rew.setStar(rset.getInt("star"));

            list.add(rew);
      
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   /*객실번호조회*/
   public Room detailRoomNo(Connection conn, int roomNo) {
      PreparedStatement pstmt =null;  //sql구문을 전달하고 결과를 받아오는 객체
      ResultSet rset =null;  //select 쿼리 수행결과를 저장하는 객체

      Room r =null;
      String query="select *from Room where room_no=?"; 
      try {

         pstmt =conn.prepareStatement(query);
         pstmt.setInt(1, roomNo);
         rset=pstmt.executeQuery();
         
            if(rset.next()) {
               r =new Room();
               r.setRoomNo(rset.getInt("ROOM_NO"));
               r.setRoomType(rset.getString("ROOM_TYPE"));
               r.setRoomName(rset.getString("ROOM_NAME"));
               r.setRoomDetail(rset.getString("ROOM_DETAIL"));
               r.setRoomLoc(rset.getString("ROOM_LOC"));
               r.setRoomSize(rset.getString("ROOM_SIZE"));
               r.setBed(rset.getString("BED"));
               r.setRoomForm(rset.getString("ROOM_FORM"));
               r.setRoomView(rset.getString("ROOM_VIEW"));
               r.setMaxNum(rset.getInt("MAX_NUM"));
               r.setRoomPrice(rset.getInt("ROOM_PRICE"));
               r.setRoomImg(rset.getString("ROOM_IMG"));
               r.setRoomInfo(rset.getString("ROOM_INFO"));
               r.setRoomStatus(rset.getInt("ROOM_STATUS"));

         }
      } catch (SQLException e) {
         e.printStackTrace();

      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }

      return r;   

   }


   public RoomR roomReserve(Connection conn, RoomR r) {
      PreparedStatement pstmt =null;  //sql구문을 전달하고 결과를 받아오는 객체
      ResultSet rset =null;  //select 쿼리 수행결과를 저장하는 객체
      RoomR rr =new RoomR();
      
      String query="select a.* ,? checkIn,? checkOut,? adult,? kid from Room a where a.room_no=?"; 
      
      System.out.println(r.getRoomNo());
   
      System.out.println(r.getAdult());
      System.out.println(r.getKid());
      System.out.println(r.getCheckIn());
      System.out.println(r.getCheckOut());
      try {

         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, r.getCheckIn());
         pstmt.setString(2, r.getCheckOut());
         pstmt.setInt(3, r.getAdult());
         pstmt.setInt(4, r.getKid());
         pstmt.setInt(5, r.getRoomNo());
         rset=pstmt.executeQuery();
         
            if(rset.next()) {
               
               rr.setRoomNo(rset.getInt("ROOM_NO"));
               rr.setRoomType(rset.getString("ROOM_TYPE"));
               rr.setRoomName(rset.getString("ROOM_NAME"));
               rr.setRoomDetail(rset.getString("ROOM_DETAIL"));
               rr.setRoomLoc(rset.getString("ROOM_LOC"));
               rr.setRoomSize(rset.getString("ROOM_SIZE"));
               rr.setBed(rset.getString("BED"));
               rr.setRoomForm(rset.getString("ROOM_FORM"));
               rr.setRoomView(rset.getString("ROOM_VIEW"));
               rr.setMaxNum(rset.getInt("MAX_NUM"));
               rr.setRoomPrice(rset.getInt("ROOM_PRICE"));
               rr.setRoomImg(rset.getString("ROOM_IMG"));
               rr.setRoomInfo(rset.getString("ROOM_INFO"));
               rr.setRoomStatus(rset.getInt("ROOM_STATUS"));
               rr.setCheckIn(rset.getString("checkIn"));
               rr.setCheckOut(rset.getString("checkOut"));
               rr.setAdult(rset.getInt("adult"));
               rr.setKid(rset.getInt("kid"));
         }
      } catch (SQLException e) {
         e.printStackTrace();

      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }

      return rr;   

   }
   //111
   public int selectTotalCount(Connection conn, String tableType, String roomType) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null; //조회시 사용
      int result =0;
      String query = "select count(*) as cnt from "+tableType+" where room_type=?";
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, roomType);
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
   public ArrayList<Room> selectRoomListR(Connection conn, int start, int end,String roomType) {
      PreparedStatement pstmt =null;   
      ResultSet rset =null;
      ArrayList<Room> list = new ArrayList<Room>();
      String query="select *from (select rownum as rnum,r.*from(select * from Room where room_type=? order by room_no desc)r) where rnum between ? and ?"; 
      try {
         pstmt =conn.prepareStatement(query);
         pstmt.setString(1, roomType);
         pstmt.setInt(2,start);
         pstmt.setInt(3, end);
         
         rset=pstmt.executeQuery();//쿼리실행
         while(rset.next()) {
            Room r =new Room();
            r.setRoomNo(rset.getInt("ROOM_NO"));
            r.setRoomType(rset.getString("ROOM_TYPE"));
            r.setRoomName(rset.getString("ROOM_NAME"));
            r.setRoomDetail(rset.getString("ROOM_DETAIL"));
            r.setRoomLoc(rset.getString("ROOM_LOC"));
            r.setRoomSize(rset.getString("ROOM_SIZE"));
            r.setBed(rset.getString("BED"));
            r.setRoomForm(rset.getString("ROOM_FORM"));
            r.setRoomView(rset.getString("ROOM_VIEW"));
            r.setMaxNum(rset.getInt("MAX_NUM"));
            r.setRoomPrice(rset.getInt("ROOM_PRICE"));
            r.setRoomImg(rset.getString("ROOM_IMG"));
            r.setRoomInfo(rset.getString("ROOM_INFO"));
            r.setRoomStatus(rset.getInt("ROOM_STATUS"));

            list.add(r);
         }
      } catch (SQLException e) {

         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);

      }
      return list;   

   }
   public RoomR selectOneRoomt(Connection conn, int roomNo) {
      PreparedStatement pstmt =null;  //sql구문을 전달하고 결과를 받아오는 객체
      ResultSet rset =null;  //select 쿼리 수행결과를 저장하는 객체

      RoomR rr =null;
      String query="select *from Room where room_no=?"; 
      try {

         pstmt =conn.prepareStatement(query);
         pstmt.setInt(1, roomNo);
         rset=pstmt.executeQuery();
         
            if(rset.next()) {
               rr =new RoomR();
               rr.setRoomNo(rset.getInt("ROOM_NO"));
               rr.setRoomType(rset.getString("ROOM_TYPE"));
               rr.setRoomName(rset.getString("ROOM_NAME"));
               rr.setRoomDetail(rset.getString("ROOM_DETAIL"));
               rr.setRoomLoc(rset.getString("ROOM_LOC"));
               rr.setRoomSize(rset.getString("ROOM_SIZE"));
               rr.setBed(rset.getString("BED"));
               rr.setRoomForm(rset.getString("ROOM_FORM"));
               rr.setRoomView(rset.getString("ROOM_VIEW"));
               rr.setMaxNum(rset.getInt("MAX_NUM"));
               rr.setRoomPrice(rset.getInt("ROOM_PRICE"));
               rr.setRoomImg(rset.getString("ROOM_IMG"));
               rr.setRoomInfo(rset.getString("ROOM_INFO"));
               rr.setRoomStatus(rset.getInt("ROOM_STATUS"));

         }
      } catch (SQLException e) {
         e.printStackTrace();

      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }

      return rr;   

   }
   }