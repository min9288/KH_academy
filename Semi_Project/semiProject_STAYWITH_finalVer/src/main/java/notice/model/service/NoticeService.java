package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;
public class NoticeService {
	public int insertNotice(Notice n) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new NoticeDao().insertNotice(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		/*
		페이징 처리를 위해 지정해야할 항목
		1.한페이지당 게시물을 몇개 보여줄지
		 * */
		//한페이지당 게시물 수 
		int numPerPage = 10;
		//reqPage = 1    start= 1/end=10, reqPage =2    start =11 /end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		NoticeDao dao = new NoticeDao();
		ArrayList<Notice> list= dao.selectNoticeList(conn,start,end);
		
		//페이지 네비게이션을 제작
		//DB조회해야하는 값 ->전체 게시물의 수
		
		int totalCount = dao.selectTotalCount(conn);
		//전체 페이지수를 게산
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		/*
		 지정해야할 항목
		 2.페이지 네비의 길이(네비게이션 숫자 최대 개수)
		 * */
		int pageNaviSize = 5;
		//1~5페이지 요청시(reqPage 값) ->네비게이션 1 2 3 4 5 
		//6~10페이지 요청 시 -> 네비게이션 6 7 8 9 10
		//11~15페이지 요청 시 -> 네비게이션 11 12 13 14 15
		//페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		String pageNavi="<ul class ='pageul'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li class='pageli'>";
			pageNavi += "<a href='/notice?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class= 'pageli'>";
				pageNavi += "<a href='/notice?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class= 'pageli'>";
				pageNavi += "<a href='/notice?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage){
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class= 'pageli'>";
			pageNavi += "<a href='/notice?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		//게시물목록(ArrayList),페이지네비(String),start(번호 표시용)
		NoticePageData npd = new NoticePageData(list,pageNavi,start);
		
		JDBCTemplate.close(conn);
		return npd;
	}

	public Notice getNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().selectOneNotice(conn, noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().updateNotice(conn,n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	public NoticePageData searchNotice(int reqPage, String type, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10; //숫자 맘대로
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		NoticeDao dao = new NoticeDao();
		ArrayList<Notice> list = dao.selectSearchNotice(conn,start,end,type,keyword);
		
		int totalCount = dao.selectTotalCount(conn,type,keyword);
		//전체 페이지수를 게산
				int totalPage = 0;
				if(totalCount%numPerPage == 0) {
					totalPage = totalCount/numPerPage;
				}else {
					totalPage = totalCount/numPerPage+1;
				}
				/*
				 지정해야할 항목
				 2.페이지 네비의 길이(네비게이션 숫자 최대 개수)
				 * */
				int pageNaviSize = 5;
				//1~5페이지 요청시(reqPage 값) ->네비게이션 1 2 3 4 5 
				//6~10페이지 요청 시 -> 네비게이션 6 7 8 9 10
				//11~15페이지 요청 시 -> 네비게이션 11 12 13 14 15
				//페이지 네비게이션 시작번호 계산
				int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
				String pageNavi="<ul class ='pageul'>";
				//이전버튼
				if(pageNo != 1) {
					pageNavi += "<li class='pageli'>";
					pageNavi += "<a href='/searchNotice?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>";
					pageNavi += "&lt;</a></li>";
				}
				//페이지숫자
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li class= 'pageli'>";
						pageNavi += "<a  href='/searchNotice?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
						pageNavi += pageNo+"</a></li>";
					}else {
						pageNavi += "<li class= 'pageli'>";
						pageNavi += "<a  href='/searchNotice?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage){
						break;
					}
				}
				//다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<li class= 'pageli'>";
					pageNavi += "<a href='/searchNotice?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
					pageNavi += "&gt;</a></li>";
				}
				pageNavi += "</ul>";
				//게시물목록(ArrayList),페이지네비(String),start(번호 표시용)
				NoticePageData npd = new NoticePageData(list,pageNavi,start);
				
				JDBCTemplate.close(conn);
				return npd;
	}
	public Notice selectOneNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = new NoticeDao().selectOneNotice(conn,noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}


}
