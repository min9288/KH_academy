package admin.model.service;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import admin.model.dao.AdminDao;
import admin.model.vo.Admin_MainData;
import admin.model.vo.Admin_Member;
import admin.model.vo.Admin_Question;
import admin.model.vo.Answer;
import admin.model.vo.Dining_Res;
import admin.model.vo.Dining_ResPageData;
import admin.model.vo.Lf_Res;
import admin.model.vo.Lf_ResPageData;

import admin.model.vo.MemberPageData;
import admin.model.vo.QuestionPageData;
import admin.model.vo.Room_Res;
import admin.model.vo.Room_ResPageData;
import common.JDBCTemplate;

public class AdminService 
{
	public String selectOneMember_Test(String memberId)
	{
		Connection conn = JDBCTemplate.getConnection();
		
		String name = new AdminDao().selectOneMember_Test(conn, memberId);
		JDBCTemplate.close(conn);
		return name;
	}
	
	public QuestionPageData get_QuestionList(int reqPage) 
	{
		Connection conn = JDBCTemplate.getConnection();
				
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;
		
		ArrayList<Admin_Question> list = new AdminDao().get_QuestionList(conn,start,end);		
		int totalCount = new AdminDao().selectTotalCount_Question(conn);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminQuestionList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminQuestionList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminQuestionList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminQuestionList?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		
		QuestionPageData pageData = new QuestionPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;
	}

	public ArrayList<Admin_Question> get_QuestionList_noReply() 
	{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Admin_Question> list = new AdminDao().get_QuestionList_noReply(conn);		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Room_Res> get_RoomResList() 
	{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Room_Res> list = new AdminDao().get_RoomResList(conn);		
		JDBCTemplate.close(conn);
		return list;
	}
	
	public Room_ResPageData get_RoomResList_All(int reqPage) 
	{		
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;
		
		ArrayList<Room_Res> list = new AdminDao().get_RoomResList_All(conn,start,end);
		
		
		int totalCount = new AdminDao().selectTotalCount_RoomResList(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminRoomResList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminRoomResList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminRoomResList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminRoomResList?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		
		Room_ResPageData pageData = new Room_ResPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;		
	}

	public Admin_Question get_Question(int parseInt) 
	{
		Connection conn = JDBCTemplate.getConnection();
		AdminDao dao = new AdminDao();
		
		Admin_Question q = dao.get_Question(conn,parseInt);
		
		JDBCTemplate.close(conn);		
		return q;
	}

	public void get_Room() 
	{
		Connection conn = JDBCTemplate.getConnection();
		AdminDao dao = new AdminDao();
		
		dao.get_Room(conn);		
		JDBCTemplate.close(conn);	
		
	}

	public int sendAnswer(int q_no, String a_content) 
	{
		Connection conn = JDBCTemplate.getConnection();
		AdminDao dao = new AdminDao();
		
		int result = dao.sendAnswer(conn,q_no, a_content);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public Answer get_Answer(String msg) 
	{
		Connection conn = JDBCTemplate.getConnection();
		Answer a = new AdminDao().get_Answer(conn,msg);
		JDBCTemplate.close(conn);		
		return a;
	}

	public int updateAnswer(int q_no, String a_content) 
	{
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().updateAnswer(conn,q_no,a_content);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public Room_Res get_RoomRes(String rNo) 
	{
		Connection conn = JDBCTemplate.getConnection();
		Room_Res r = new AdminDao().get_RoomRes(conn, rNo);
		
		JDBCTemplate.close(conn);
		return r;
	}

	public int updateRoom_Res(Room_Res r) 
	{
		Connection conn = JDBCTemplate.getConnection();		
		int result = new AdminDao().updateRoom_Res(conn,r);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public Dining_ResPageData get_DiningList(int reqPage) 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;
		
		ArrayList<Dining_Res> list = new AdminDao().get_DiningList(conn,start,end);		
		
		int totalCount = new AdminDao().selectTotalCount_DiningResList(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminDiningList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminDiningList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminDiningList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminDiningList?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		
		Dining_ResPageData pageData = new Dining_ResPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;		
	}

	public Dining_Res get_Dining_Res(String dNum) 
	{
		Connection conn = JDBCTemplate.getConnection();
		Dining_Res d = new AdminDao().get_DiningRes(conn, dNum);
		
		JDBCTemplate.close(conn);
		return d;
	}

	public int update_DiningRes(Dining_Res r) 
	{
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().update_DiningRes(conn,r);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public Lf_ResPageData get_LfResList(int reqPage) 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;
		
		ArrayList<Lf_Res> list = new AdminDao().get_LfResList(conn,start,end);
		
		int totalCount = new AdminDao().selectTotalCount_LfResList(conn);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{///adminLfList?reqPage=1
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminLfList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminLfList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminLfList?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminLfList?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		
		Lf_ResPageData pageData = new Lf_ResPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;		
	}

	public Lf_Res get_Lf_Res(String lNum) 
	{
		Connection conn = JDBCTemplate.getConnection();
		Lf_Res l = new AdminDao().get_Lf_Res(conn, lNum);
		
		JDBCTemplate.close(conn);
		return l;
	}

	public int update_LfRes(Lf_Res r) 
	{		
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().update_LfRes(conn,r);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public MemberPageData get_MemberList(int reqPage, String dataType, String data) 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;		
		MemberPageData pageData = null;
		
		if(dataType.equals("List"))
		{
			pageData = get_MemberList_Normal(reqPage,dataType, data);
		}
		else
		{
			pageData = get_MemberList_Search(reqPage,dataType, data);
		}
		
		return pageData;	
	}
	
	private MemberPageData get_MemberList_Search(int reqPage, String dataType, String data) 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;		
		
		ArrayList<Admin_Member> list = new AdminDao().get_MemberList_forSearch(conn,start,end,dataType,data);
		
		int totalCount = new AdminDao().selectTotalCount_MemberList_forSearch(conn,dataType,data);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{///adminLfList?reqPage=1
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage="+(pageNo-1)+"&dataType="+dataType+"&data="+data+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data="+data+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data="+data+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data="+data+"'>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		
		MemberPageData pageData = new MemberPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;
	}

	public MemberPageData get_MemberList_Normal(int reqPage, String dataType, String data) 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		int numPerPage = 10;
		int end = reqPage * numPerPage; //1*10
		int start  = end - numPerPage + 1;		
		
		ArrayList<Admin_Member> list = new AdminDao().get_MemberList(conn,start,end);
		
		int totalCount = new AdminDao().selectTotalCount_MemberList(conn);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0)
		{
			totalPage = totalCount/numPerPage;
		}
		else
		{
			totalPage = (totalCount/numPerPage)+1;
		}
		
		int pageNaviSize = 5;
		int pageNo= ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class = 'pagination pagination-lg'>";
		//이전버튼		
		if(pageNo != 1)
		{///adminLfList?reqPage=1
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage="+(pageNo-1)+"&dataType="+dataType+"&data=''>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자
		for(int i = 0; i < pageNaviSize; ++i)
		{
			if(pageNo == reqPage)
			{
				pageNavi += "<li class = 'page-item active'>";
				pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data=''>";
				pageNavi += pageNo + "</a></li>";
			}
			else
			{
				pageNavi += "<li class = 'page-item'>";
				pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data=''>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
					
			if(pageNo > totalPage)
				break;
		}
				
		//다음버튼
		if(pageNo <= totalPage)
		{
			pageNavi += "<li class = 'page-item'>";
			pageNavi += "<a class = 'page-link' href = '/adminMemberList?reqPage=" + pageNo+"&dataType="+dataType+"&data=''>";
			pageNavi += "&gt;</a></li>";
		}
				
		pageNavi += "</ul>";
		
		MemberPageData pageData = new MemberPageData(list, pageNavi, start);		
		JDBCTemplate.close(conn);
		
		return pageData;	
	}

	public Admin_Member get_Member(int mNo) 
	{		
		Connection conn = JDBCTemplate.getConnection();
		Admin_Member l = new AdminDao().get_Member(conn, mNo);
		
		JDBCTemplate.close(conn);
		return l;
	}

	public int update_Member(Admin_Member r) 
	{
		Connection conn = JDBCTemplate.getConnection();
		int result = new AdminDao().update_Member(conn, r);
		
		if(result == 0)
		{
			JDBCTemplate.rollback(conn);
		}
		else
		{		
			JDBCTemplate.commit(conn);
		}
		
		JDBCTemplate.close(conn);		
		return result;
	}

	public ArrayList<Admin_Member> get_MemberList_forSearch(String inputData, String data_type) 
	{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Admin_Member> list = new AdminDao().get_MemberList_forSearch(conn,inputData,data_type);
		
		JDBCTemplate.close(conn);		
		return list;
	}

	public ArrayList<Admin_MainData> Get_MainChartInfo() 
	{
		Connection conn = JDBCTemplate.getConnection();
		
		Date nowDate = new Date();
		SimpleDateFormat Data_format_yy = new SimpleDateFormat("YY");
		SimpleDateFormat Data_format_mm = new SimpleDateFormat("MM");
		SimpleDateFormat Data_format_dd = new SimpleDateFormat("dd");
		
		int year = Integer.parseInt(Data_format_yy.format(nowDate));
		int month = Integer.parseInt(Data_format_mm.format(nowDate));
		int day = Integer.parseInt(Data_format_dd.format(nowDate));
		
		ArrayList<String> DateList = new ArrayList<String>();
		ArrayList<Admin_MainData> list  = new ArrayList<Admin_MainData>();
		
		
		for(int i = -5; i < 2; ++i)
		{
			DateList.add(getDayAgoDate(i, year,month,day));			
		}
		
		//ArrayList<Integer> list = new AdminDao().Get_MainChartInfo(conn,DateList);
		list = new AdminDao().Get_MainChartInfo_Map(conn,DateList);
		return list;
	}
	
	private String getDayAgoDate(int ago, int year , int month , int day) 
	{

		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, day);
		cal.add(Calendar.DATE, ago);
		java.util.Date weekago = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd",
				Locale.getDefault());
		return formatter.format(weekago);
	}

	public int get_TodayCancel() 
	{
		
		Connection conn = JDBCTemplate.getConnection();
		Date date = new Date();
		SimpleDateFormat Data_format = new SimpleDateFormat("yy/MM/dd");
		String toDay = Data_format.format(date);		
		
		int result = new AdminDao().get_TodayCancel(conn,toDay);
		return result;
	}

	public int get_TodayProgress() 
	{
		Connection conn = JDBCTemplate.getConnection();
		Date date = new Date();
		SimpleDateFormat Data_format = new SimpleDateFormat("yy/MM/dd");
		String toDay = Data_format.format(date);		
		
		int result = new AdminDao().get_TodayProgress(conn,toDay);
		return result;
	}

	public int get_TodayVacancyRate() 
	{
		Connection conn = JDBCTemplate.getConnection();
		Date date = new Date();
		SimpleDateFormat Data_format = new SimpleDateFormat("yy/MM/dd");
		String toDay = Data_format.format(date);		
		
		int result = new AdminDao().get_TodayVacancyRate(conn,toDay);
		return result;
	}

	public int get_NowdayVacancyRate() 
	{
		Connection conn = JDBCTemplate.getConnection();
		Date date = new Date();
		SimpleDateFormat Data_format = new SimpleDateFormat("yy/MM/dd");
		String toDay = Data_format.format(date);		
		
		int result = new AdminDao().get_NowdayVacancyRate(conn,toDay);
		return result;
	}
}
