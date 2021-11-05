package lifestyle.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import lifestyle.model.dao.LifestyleDao;
import lifestyle.model.vo.LfReview;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.LifestyleList;
import lifestyle.model.vo.LifestylePageData;
import lifestyle.model.vo.ResLifestyle;

public class LifestyleService {
	
	//라이프 스타일 새로 등록
	public int insertLifestyle(Lifestyle lf) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().insertLifestyle(conn,lf); 
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else{
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//라이프 스타일 조회
	public LifestylePageData selectLifestyle(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		LifestyleDao dao = new LifestyleDao();
		ArrayList<Lifestyle> list =dao.selectLifestyleList(conn,start,end);
		//네비 제작
		int totalCount = dao.selectTotalCount(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
		//이전
		if(pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += " <a class='page-link' href='/lifestyleList?reqPage="+pageNo+"'>&laquo;</a>";
			pageNavi += "</li>";
		}
		//숫자
		for(int i=0; i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi +="<li class='page-item active'>";
				pageNavi +=" <a class='page-link' href='/lifestyleList?reqPage="+pageNo+"'>"+pageNo+"</a>";
				pageNavi +="</li>";
			}else {
				pageNavi +="<li class='page-item'>";
				pageNavi +=" <a class='page-link' href='/lifestyleList?reqPage="+pageNo+"'>"+pageNo+"</a>";
				pageNavi +="</li>";
			}
			pageNo++;
				if(pageNo>totalPage) {
					break;
				}
		}
		//다음
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += " <a class='page-link' href='/lifestyleList?reqPage="+pageNo+"'>&laquo;</a>";
			pageNavi += "</li>";
		}
		pageNavi +="</ul>";
		
		LifestylePageData lpd = new LifestylePageData(list, pageNavi, start);
		JDBCTemplate.close(conn);
		return lpd;
	}
	//상세보기
	public LifestyleList selectOneLifestyle(int lfNo) {
		Connection conn = JDBCTemplate.getConnection();
		LifestyleList ll = new LifestyleList();
		//상세보기
		Lifestyle lf = new LifestyleDao().selectOneLifestyle(conn,lfNo);
		//서브네비 카테고리 
		ArrayList<Lifestyle> categoryList = new LifestyleDao().selectAllCategory(conn);
		//서브네비 타이틀
		ArrayList<Lifestyle> list = new LifestyleDao().selectAllLifestyle(conn);
		//리뷰 조회
		ArrayList<LfReview> lfReview = new LifestyleDao().selectLfReview(conn,lfNo);
		ll.setLf(lf);
		ll.setCategoryList(categoryList);
		ll.setList(list);
		ll.setLfReview(lfReview);
		JDBCTemplate.close(conn);
		return ll;
	}
	//전체 조회
	public LifestyleList selectAllLifestyle() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Lifestyle> list = new LifestyleDao().selectAllLifestyle(conn);
		ArrayList<Lifestyle> categoryList = new LifestyleDao().selectAllCategory(conn);
		LifestyleList ll = new LifestyleList();
		ll.setCategoryList(categoryList);
		ll.setList(list);
		
		JDBCTemplate.close(conn);
		return ll;
	}
	//수정하기 전 조회
	public Lifestyle selectOneLfContent(int lfNo) {
		Connection conn = JDBCTemplate.getConnection();
		Lifestyle lf = new LifestyleDao().selectOneLfContent(conn , lfNo);
		JDBCTemplate.close(conn);
		return lf;
	}
	//라이프스타일 수정
	public int updateLifestlye(Lifestyle lf) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().updateLifestyle(conn, lf);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//라이프스타일 삭제
	public int deleteLifestyle(int lfNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().deleteLifestyle(conn,lfNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//헤더에서 상세조회
	public Lifestyle selectOneLifestyle(String lfCategory) {
		Connection conn = JDBCTemplate.getConnection();
		Lifestyle lf = new LifestyleDao().selectOneLifestyle(conn, lfCategory);
		JDBCTemplate.close(conn);
		return lf;
	}
	//예약 등록하기
	public int insertResLifestyle(ResLifestyle rl) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().insertResLifestyle(conn, rl);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//예약 전체조회
	public ArrayList<ResLifestyle> selectResLifestyle(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ResLifestyle> list = new LifestyleDao().selectResLifestyle(conn,memberId);
		JDBCTemplate.close(conn);
		return list;
	}
	//수정 전 예약 조회
	public ResLifestyle selectOneResLifestyle(String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		ResLifestyle rl = new LifestyleDao().selectOneResLifestyle(conn,resNo);
		String date = rl.getResDate().substring(0,10);
		rl.setResDate(date);
		JDBCTemplate.close(conn);
		return rl;
	}
	//예약 수정
	public int updateResLifestyle(ResLifestyle rl) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().updateResLifestyle(conn, rl);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//취소 신청
	public int deleteRequestLf(String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().deleteRequestLf(conn,resNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//예약취소
	public int deleteResLf(String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LifestyleDao().deleteResLf(conn,resNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
		JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//예약 불가 날짜 조회
	public ArrayList<ResLifestyle> selectNoDate(int lfNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ResLifestyle> resList = new LifestyleDao().selectNoneDate(conn, lfNo);
		JDBCTemplate.close(conn);
		return resList;
	}

}
