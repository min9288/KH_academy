package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import faq.model.dao.FaqDao;
import faq.model.vo.Faq;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class FaqService {

	public int insertFaq(Faq f) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new FaqDao().insertFaq(conn,f);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Faq> selectFaqList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Faq> list= new FaqDao().selectFaqList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int deleteFaq(String qna, String content) {
		Connection conn= JDBCTemplate.getConnection();
		int result = new FaqDao().deleteFaq(conn,qna,content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
