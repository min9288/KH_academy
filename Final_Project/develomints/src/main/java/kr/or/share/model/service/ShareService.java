package kr.or.share.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.member.model.vo.GosuNoticePage;
import kr.or.member.model.vo.Member;
import kr.or.share.model.dao.ShareDao;
import kr.or.share.model.vo.Like;
import kr.or.share.model.vo.Share;
import kr.or.share.model.vo.ShareBoardPage;
import kr.or.share.model.vo.ShareViewData;

@Service
public class ShareService {
	@Autowired
	private ShareDao dao;
	
	@Transactional
	public int insertShareBoard(Share s) {
		int result = 0;
		result += dao.insertBoard(s);
		result += dao.plusPoints(s);
		return result;
	}
	
	public ShareBoardPage shareBoardList(int reqPage, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		
		map.put("start", start);
		map.put("end",end);
		map.put("type", type);
		
		ArrayList<Share> list = dao.shareBoardList(map);
		
		int totalCount = dao.shareTotalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class=\"page-item\">";
			pageNavi += "<a class=\"page-link\" href='/shareList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page-item active\">";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&raquo;</a></li>";
		}
		pageNavi += "</ul>";
		
		ShareBoardPage sbp = new ShareBoardPage(list, start, pageNavi);
		return sbp;
	}
	
	//검색하는거 구현중!
	public ShareBoardPage shareBoardList(int reqPage, int type, int category, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		
		map.put("start", start);
		map.put("end",end);
		map.put("type", type);
		map.put("search", search);
		map.put("category",category);
		
		ArrayList<Share> list = dao.searchBoard(map);
		
		
		int totalCount = dao.shareTotalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class=\"page-item\">";
			pageNavi += "<a class=\"page-link\" href='/shareList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page-item active\">";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&raquo;</a></li>";
		}
		pageNavi += "</ul>";
		
		ShareBoardPage sbp = new ShareBoardPage(list, start, pageNavi);
		return sbp;
	}

	public ShareViewData shareBoardView(int boardNo) {
		int result = dao.updateReadCount(boardNo);
		Share s = dao.selectBoardView(boardNo);
		ArrayList<Comment> list = dao.selectBoardComment(boardNo);
		ShareViewData svd = new ShareViewData(list, s);
		return svd;
	}
	
	@Transactional
	public int insertCommentShare(Comment c) {
		return dao.insertCommentShare(c);
	}
	
	@Transactional
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	public Share selectOneBoard(int boardNo) {
		return dao.selectBoardView(boardNo);
	}
	@Transactional
	public int updateShareBoard(Share s) {
		return dao.updateBoard(s);
	}
	
	@Transactional
	public int insertRecomment(Comment c) {
		return dao.insertRecomment(c);
	}
	@Transactional
	public int deleteComment(Comment c) {
		return dao.deleteComment(c);
	}
	@Transactional
	public int updateComment(Comment c) {
		return dao.updateComment(c);
	}
	@Transactional
	public int shareReport(Report rp) {
		return dao.shareReport(rp);
	}
	
	@Transactional
	public int shareLike(Like lk) {
		Like likeChk = dao.shareLike(lk);
		int result = 0;
		if(likeChk == null) {
			//좋아요 안눌렀을때
			result = dao.addLike(lk);
			result += 1;
			int points = dao.plusLikePoints(lk);
			//좋아요 눌리면 return값 2
		}else {
			//좋아요 이미 눌렀을때
			result = dao.removeLike(lk);
			//좋아요 지워지면 return 값 1
			int points = dao.minusLikePoints(lk);
		}
		return result;
	}

	public int isLike(Like lk) {
		Like likeChk = dao.shareLike(lk);
		if(likeChk == null) {
			return 0;
		}else {
			return 1;
		}
	}

}
