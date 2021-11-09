package notice.model.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class NoticeService {
	private SqlSession getSqlSession() {
		SqlSession session = null;
		String resource = "/mybatis-config.xml";	// 마이바티스 설정파일 경로
		try {
			InputStream is = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(is);
			session = factory.openSession(false);	// 오토커밋 해제를 위해 매개변수 false 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		return session;
	}

	public NoticePageData selectNoticeList(int reqPage) {
		SqlSession session = getSqlSession();
		// 한 페이지에 보여줄 게시물 수
		int numPerPage = 10;
		// 1 page -> 1 ~ 50		/		2 page -> 51 ~ 100
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// 한 페이지에 보여줄 게시물 목록 조회
		NoticeDao dao = new NoticeDao();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectNoticeList(session, map);
		// 페이지 네비게이션 제작
		int totalCount = dao.totalCount(session);
		// 전체페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		int pageNaviSize = 5;
		// 요청페이지가 가운데 올 수 있는 pageNo 설정
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
			if(totalPage - reqPage < (pageNaviSize - 1)) {
				pageNo = totalCount - (pageNaviSize - 1);
			}
		}
		// 페이지 네비 제작
		String pageNavi = "";
		// 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<a href='/noticeList?reqPage="+(reqPage - 1)+"'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for(int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/noticeList?reqPage="+(reqPage+1)+"'>[다음]</a>";
		}
		session.close();
		NoticePageData npd = new NoticePageData(list, pageNavi, start);
		return npd;
	}
}
