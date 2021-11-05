package stay.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import stay.model.dao.RoomDao;
import stay.model.vo.Room;
import stay.model.vo.RoomPage;
import stay.model.vo.RoomR;
import stay.model.vo.RoomReserve;
import stay.model.vo.RoomReview;

public class RoomService {
	/*객실등록*/
	public int insertRoom(Room r) {
		Connection conn =JDBCTemplate.getConnection();
		int result =new RoomDao().insertRoom(conn, r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	/*객실전체*/
	public ArrayList<Room> selectAllRoom() {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<Room> list = new RoomDao().selectAllRoom(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	/*객실상세*/
	public Room detailRoom(int roomNo) {
		Connection conn =JDBCTemplate.getConnection();
		Room r =new RoomDao().selectOneRoom(conn, roomNo);
		JDBCTemplate.commit(conn);
		return r;
	}
	/*객실수정*/
	public int updateRoom(Room r) {
		Connection conn= JDBCTemplate.getConnection();
		int result= new RoomDao().updateRoom(conn, r);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}
	/*객실삭제*/
	public int deleteRoom(int roomNo) {
		Connection conn =JDBCTemplate.getConnection();
		int result =new RoomDao().deleteRoom(conn, roomNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;

	}
	/*객실예약취소*/
	public int cancleRes(RoomReserve reserve) {
		Connection conn =JDBCTemplate.getConnection();
		int result =new RoomDao().cancleReserve(conn,reserve);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
}
	/*예약상세*/
	public RoomReserve detailRerserve(String resNum) {
		Connection conn =JDBCTemplate.getConnection();
		RoomReserve res =new RoomDao().detailReserve(conn, resNum);
		JDBCTemplate.close(conn);
		return res;
	}
	/*룸타입별 조회*/

	public  ArrayList<Room> selectRoomType(String roomType) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<Room> list = new RoomDao().selectType(conn, roomType);
	     JDBCTemplate.close(conn);
		return list;
}
	

	/*객실예약 변경*/
	public int updateRoomR(RoomReserve reserve) {
		Connection conn =JDBCTemplate.getConnection();
		int result =new RoomDao().updateReserve(conn,reserve);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
}
	/*예약조회*/
	public ArrayList<RoomReserve> selectAllReserve() {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<RoomReserve> list = new RoomDao().selectAllReserveR(conn);
		JDBCTemplate.close(conn);
		return list;
	
	}
	/*예약내역확인하기*/
	public RoomReserve detailRoomReserve(String resNum) {
		Connection conn =JDBCTemplate.getConnection();
		RoomReserve res =new RoomDao().detailReserve(conn, resNum);
		JDBCTemplate.close(conn);
		return res;
	}
	/*객실예약*/
	public int insertReserve(RoomReserve reserve) {
		Connection conn =JDBCTemplate.getConnection();
		int result =new RoomDao().insertReserve(conn, reserve);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	
	/*후기조회*/
	public ArrayList<Room> selectRoomName(String roomName) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<Room> list = new RoomDao().selectRoomName(conn, roomName);
	     JDBCTemplate.close(conn);
		return list;
}


	public ArrayList<RoomR> selectCheck(RoomReserve reserve) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<RoomR> list = new RoomDao().selectRoom(conn, reserve);
	     JDBCTemplate.close(conn);
		return list;
	}
	
	/*페이징처리*/
	public RoomPage selectAllRoomLists(int reqPage) {
		Connection conn =JDBCTemplate.getConnection();
		int numberPage =4;
		int end =reqPage*numberPage;
		int start =end-numberPage+1;
		RoomDao dao =new RoomDao();
		ArrayList<Room> list = dao.selectRoomList(conn, start, end);
		//전체게시물 수 조회
			int totalCount =dao.selectTotalCount(conn);
			//전체 페이지수를 계산
			int totalPage =0;
			if(totalCount%numberPage==0) {
				totalPage =totalCount/numberPage;
			}else {
			totalPage =totalCount/numberPage+1;
				}
			/*
			 *지정해야할 항목
		    2.페이지 네비의 길이(네비게이션 숫자 최대개수)
			 */
			int pageNavisize =10;
			//1-5페이지 요청시 ->네비게이션 12345
			//6-10페이지 요청시 ->네비게이션 678910
			int pageNo =((reqPage-1)/pageNavisize)*pageNavisize +1;
			//페이지네비 태그 제작 시작
			String pageNavi ="<ul class='pagination pagination-lg'>";
			//이전버튼
			if(pageNo!=1) {
				pageNavi +="<li class='page-item>";
				pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+(pageNo-1)+"'>";
				pageNavi +="&lt;</a></li>";
			}
			//페이지숫자
			for(int i=0;i<pageNavisize;i++) {
				if(pageNo==reqPage) { //보고있는 페이지 일경우에
					pageNavi +="<li class='page-item active'>";
					pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}else {
					pageNavi +="<li class='page-item'>";
					pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break; //끝까지 다 하면 break
				}
			}
			//다음버튼
			if(pageNo<=totalPage) {
				pageNavi +="<li class='page-item'>";
				pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
				pageNavi +="&gt;</a></li>";
			}
			pageNavi +="</ul>";
			//게시물 목록
			RoomPage rpe =new RoomPage(list,pageNavi,start);
			JDBCTemplate.close(conn);
			return rpe;
		}
	/*후기조회*/
	public ArrayList<RoomReview> selectRoomReview(String roomName) {
		Connection conn =JDBCTemplate.getConnection();
		ArrayList<RoomReview> list = new RoomDao().selectRoomReview(conn, roomName);
	     JDBCTemplate.close(conn);
		return list;
}
	/*객실번호조회*/
	public RoomR RoomReserve (RoomR r) {
		Connection conn =JDBCTemplate.getConnection();
		RoomR resR =new RoomDao().roomReserve(conn,r);
		JDBCTemplate.close(conn);
		return resR;
	}
	/*예약검색 페이징*/
	public RoomPage selectLists(int reqPage) {
		Connection conn =JDBCTemplate.getConnection();
		int numberPage =5;
		int end =reqPage*numberPage;
		int start =end-numberPage+1;
		RoomDao dao =new RoomDao();
		ArrayList<Room> list = dao.selectRoomList(conn, start, end);
		//전체게시물 수 조회
			int totalCount =dao.selectTotalCount(conn);
			//전체 페이지수를 계산
			int totalPage =0;
			if(totalCount%numberPage==0) {
				totalPage =totalCount/numberPage;
			}else {
			totalPage =totalCount/numberPage+1;
				}
			/*
			 *지정해야할 항목
		    2.페이지 네비의 길이(네비게이션 숫자 최대개수)
			 */
			int pageNavisize =10;
			//1-5페이지 요청시 ->네비게이션 12345
			//6-10페이지 요청시 ->네비게이션 678910
			int pageNo =((reqPage-1)/pageNavisize)*pageNavisize +1;
			//페이지네비 태그 제작 시작
			String pageNavi ="<ul class='pagination pagination-lg'>";
			//이전버튼
			if(pageNo!=1) {
				pageNavi +="<li class='page-item>";
				pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+(pageNo-1)+"'>";
				pageNavi +="&lt;</a></li>";
			}
			//페이지숫자
			for(int i=0;i<pageNavisize;i++) {
				if(pageNo==reqPage) { //보고있는 페이지 일경우에
					pageNavi +="<li class='page-item active'>";
					pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}else {
					pageNavi +="<li class='page-item'>";
					pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break; //끝까지 다 하면 break
				}
			}
			//다음버튼
			if(pageNo<=totalPage) {
				pageNavi +="<li class='page-item'>";
				pageNavi +="<a class='page-link' href='/allRoom2?reqPage="+pageNo+"'>";
				pageNavi +="&gt;</a></li>";
			}
			pageNavi +="</ul>";
			//게시물 목록
			RoomPage rpe =new RoomPage(list,pageNavi,start);
			JDBCTemplate.close(conn);
			return rpe;
		}
	//11.
	public RoomPage selectRoomType(int reqPage, String roomType, String tableType) {
		Connection conn =JDBCTemplate.getConnection();
		int numberPage =4;
		int end =reqPage*numberPage;
		int start =end-numberPage+1;
		RoomDao dao =new RoomDao();
		ArrayList<Room> list = dao.selectRoomListR(conn, start, end,roomType);
		//전체게시물 수 조회
			int totalCount =dao.selectTotalCount(conn,tableType,roomType);
			//전체 페이지수를 계산
			int totalPage =0;
			if(totalCount%numberPage==0) {
				totalPage =totalCount/numberPage;
			}else {
			totalPage =totalCount/numberPage+1;
				}
			/*
			 *지정해야할 항목
		    2.페이지 네비의 길이(네비게이션 숫자 최대개수)
			 */
			int pageNavisize =5;
			//1-5페이지 요청시 ->네비게이션 12345
			int pageNo =((reqPage-1)/pageNavisize)*pageNavisize +1;
			//페이지네비 태그 제작 시작
			String pageNavi ="<ul class='pagination pagination-lg'>";
			//이전버튼
			if(pageNo!=1) {
				pageNavi +="<li class='page-item>";
				pageNavi +="<a class='page-link' href='/selectType2?roomType=roomType="+reqPage+"&reqPage="+(pageNo-1)+"'>";
				pageNavi +="&lt;</a></li>";
			}
			//페이지숫자
			for(int i=0;i<pageNavisize;i++) {
				if(pageNo==reqPage) { //보고있는 페이지 일경우에
					pageNavi +="<li class='page-item active'>";
					pageNavi +="<a class='page-link'  href='/selectType2?roomType="+roomType+"&reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}else {
					pageNavi +="<li class='page-item'>";
					pageNavi +="<a class='page-link'  href='/selectType2?roomType="+roomType+"&reqPage="+pageNo+"'>";
					pageNavi +=pageNo+"</a></li>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break; //끝까지 다 하면 break
				}
			}
			//다음버튼
			if(pageNo<=totalPage) {
				pageNavi +="<li class='page-item'>";
				pageNavi +="<a class='page-link'  href='/selectType2?roomType="+roomType+"&reqPage="+pageNo+"'>";
				pageNavi +="&gt;</a></li>";
			}
			pageNavi +="</ul>";
			//게시물 목록
			RoomPage rpe =new RoomPage(list,pageNavi,start);
			JDBCTemplate.close(conn);
			return rpe;
		}
	

	}
