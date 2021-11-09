package notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import notice.model.vo.Notice;

public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(SqlSession session, HashMap<String, Object> map) {
		List<Notice> list = session.selectList("notice.selectList", map);
		return (ArrayList<Notice>)list;
	}

	public int totalCount(SqlSession session) {
		return session.selectOne("notice.totalCount");
	}

}
