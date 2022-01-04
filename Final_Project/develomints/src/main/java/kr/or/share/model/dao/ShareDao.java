package kr.or.share.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.share.model.vo.Like;
import kr.or.share.model.vo.Share;

@Repository
public class ShareDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertBoard(Share s) {
		return sqlSession.insert("share.insertShare",s);
	}

	public int plusPoints(Share s) {
		return sqlSession.update("share.plusPoints",s);
	}

	public ArrayList<Share> shareBoardList(HashMap<String, Object> map) {
		List<Share> list = sqlSession.selectList("share.shareList",map); 
		return (ArrayList<Share>)list;
	}

	public int shareTotalCount() {
		return sqlSession.selectOne("share.shareCount");
	}

	public ArrayList<Share> searchBoard(HashMap<String, Object> map) {
		List<Share> list = sqlSession.selectList("share.searchBoard",map); 
		return (ArrayList<Share>)list;
	}

	public Share selectBoardView(int boardNo) {
		return sqlSession.selectOne("share.shareBoardView",boardNo);
	}

	public ArrayList<Comment> selectBoardComment(int boardNo) {
		List<Comment> list = sqlSession.selectList("share.shareComments",boardNo);
		return (ArrayList<Comment>)list;
	}

	public int updateReadCount(int boardNo) {
		return sqlSession.update("share.updateCount",boardNo);
	}

	public int insertCommentShare(Comment c) {
		return sqlSession.insert("share.insertComment",c);
	}

	public int deleteBoard(int boardNo) {
		return sqlSession.delete("share.deleteBoard",boardNo);
	}

	public int updateBoard(Share s) {
		return sqlSession.update("share.updateBoard",s);
	}

	public int insertRecomment(Comment c) {
		return sqlSession.insert("share.insertRecomment",c);
	}

	public int deleteComment(Comment c) {
		return sqlSession.delete("share.deleteComment",c);
	}

	public int updateComment(Comment c) {
		return sqlSession.update("share.updateComment",c);
	}

	public int shareReport(Report rp) {
		return sqlSession.insert("share.shareReport",rp);
	}

	public Like shareLike(Like lk) {
		return sqlSession.selectOne("share.shareCheck",lk);
	}

	public int addLike(Like lk) {
		return sqlSession.insert("share.addLike",lk);
	}

	public int removeLike(Like lk) {
		return sqlSession.delete("share.deleteLike",lk);
	}

	public int plusLikePoints(Like lk) {
		return sqlSession.update("share.addLikePoints",lk);
	}

	public int minusLikePoints(Like lk) {
		return sqlSession.update("share.minusLikePoints",lk);
	}
}
