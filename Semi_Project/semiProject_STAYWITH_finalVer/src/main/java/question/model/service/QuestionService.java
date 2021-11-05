package question.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import question.model.dao.QuestionDao;
import question.model.vo.Question;

public class QuestionService {
	//문의 등록
	public int insertQuestion(Question q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().insertQuestion(conn,q);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
