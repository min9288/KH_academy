package dining.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import dining.model.dao.DiningDao;
import dining.model.vo.Dining;
import dining.model.vo.DiningData;
import dining.model.vo.DiningListData;
import dining.model.vo.DiningRes;
import dining.model.vo.DiningReview;
import dining.model.vo.DiningTime;
import dining.model.vo.ResInfo;

public class DiningService {

	public int insertDining(DiningData dd) {
		Connection conn = JDBCTemplate.getConnection();
		DiningDao dao = new DiningDao();
		int result = dao.insertDining(conn, dd.getD());
		if(result>0) {
			int diningNo = dao.selectDiningNo(conn, dd.getD().getThumbnailImg());
			if(dd.getD().getDiningType()==1) {
				int result1 = dao.insertDiningTime(conn, dd.getLunch(), diningNo);
				if(result1>0) {
					int result2 = dao.insertDiningTime(conn, dd.getDinner(), diningNo);
					if(result2>0) {
						JDBCTemplate.commit(conn);
					}else {
						JDBCTemplate.rollback(conn);
						result = result2;
					}
				}else {
					JDBCTemplate.rollback(conn);
					result = result1;
				}
			}else if(dd.getD().getDiningType()==2) {
				int result3 = dao.insertDiningTime(conn, dd.getBrunch(), diningNo);
				if(result3>0) {
					int result4 = dao.insertDiningTime(conn, dd.getAfter(), diningNo);
					if(result4>0) {
						int result5 = dao.insertDiningTime(conn, dd.getDay(), diningNo);
						if(result5>0) {
							JDBCTemplate.commit(conn);
						}else {
							JDBCTemplate.rollback(conn);
							result = result5;
						}
					}else {
						JDBCTemplate.rollback(conn);
						result = result4;
					}
				}else {
					JDBCTemplate.rollback(conn);
					result = result3;
				}
			}else if(dd.getD().getDiningType()==3){
				int result6 = dao.insertDiningTime(conn, dd.getDay(), diningNo);
				if(result6>0) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.rollback(conn);
					result = result6;
				}
			}
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public DiningListData selectDiningList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		//페이지당 게시글 수
		int numPerPage = 10;
		//글번호 시작, 끝
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		
		DiningDao dao = new DiningDao();
		ArrayList<Dining> list = dao.selectDiningList(conn, start, end);
		
		//총 다이닝 수 조회
		int totalCnt = dao.selectTotalCnt(conn);
		//총 페이지 수 계산
		int totalPage = (totalCnt % numPerPage == 0) ? (totalCnt / numPerPage) : (totalCnt / numPerPage + 1);
		//페이지 네비 길이
		int pageNaviSize = 5;
		//페이지 네비 시작번호
		int pageNo = ((reqPage-1)/pageNaviSize) * pageNaviSize +1;
		//페이지 네비게이션 태그 제작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		//이전 버튼
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/diningList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		//각 페이지 버튼
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link' href='/diningList?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/diningList?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/diningList?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		DiningListData dld = new DiningListData(list, pageNavi, start);
		JDBCTemplate.close(conn);
		return dld;
	}

	public int deleteDining(int diningNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiningDao().deleteDining(conn, diningNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Dining selectOneDining(int diningNo) {
		Connection conn = JDBCTemplate.getConnection();
		DiningDao dao = new DiningDao();
		Dining d = dao.selectOneDining(conn, diningNo);
		ArrayList<DiningTime> timeList = dao.selectTimeList(conn, diningNo);
		ArrayList<DiningReview> reviewList = dao.selectReviewList(conn, diningNo);
		d.setTimeList(timeList);
		d.setReviewList(reviewList);
		JDBCTemplate.close(conn);
		return d;
	}

	public int updateDining(Dining d) {
		Connection conn = JDBCTemplate.getConnection();
		DiningDao dao = new DiningDao();
		int result = dao.updateDining(conn, d);
		if(result>0) {
			int result1 = 0;
			for(DiningTime dt : d.getTimeList()) {
				result1 = dao.updateDiningTime(conn, dt);
				if(result1>0) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.rollback(conn);
					result = result1;
					break;
				}
			}		
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Dining> selectAllDining() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Dining> list = new DiningDao().selectAllDining(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int selectFirstDining(int diningType) {
		Connection conn = JDBCTemplate.getConnection();
		int diningNo = new DiningDao().selectFirstDining(conn, diningType);
		JDBCTemplate.close(conn);
		return diningNo;
	}

	public ArrayList<Dining> selectResvList() {
		Connection conn = JDBCTemplate.getConnection();
		DiningDao dao = new DiningDao();
		ArrayList<Dining> list = dao.selectResvList(conn);
		for(Dining d : list) {
			ArrayList<DiningTime> timeList = dao.selectTimeList(conn, d.getDiningNo());
			d.setTimeList(timeList);
		}
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<ResInfo> selectResInfoList(int diningNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ResInfo> list= new DiningDao().selectResInfoList(conn, diningNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public ResInfo selectResInfo(int diningNo, String date) {
		Connection conn = JDBCTemplate.getConnection();
		ResInfo r = new DiningDao().selectResInfo(conn, diningNo, date);
		JDBCTemplate.close(conn);
		return r;
	}

	public DiningTime selectDiningTime(int diningNo, int timeType) {
		Connection conn = JDBCTemplate.getConnection();
		DiningTime dt = new DiningDao().selectDiningTime(conn, diningNo, timeType);
		JDBCTemplate.close(conn);
		return dt;
	}

	public int insertDiningResv(DiningRes dr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiningDao().insertDiningResv(conn, dr);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public DiningRes selectDiningResv(String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		DiningRes dr = new DiningDao().selectDiningResv(conn, resNo);
		JDBCTemplate.close(conn);
		return dr;
	}

	public int updateDiningResv(DiningRes dr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiningDao().updateDiningResv(conn, dr);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int diningResvCancel(String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiningDao().diningResvCancel(conn, resNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean chkDiningNm(String diningName) {
		Connection conn = JDBCTemplate.getConnection();
		boolean result = new DiningDao().chkDiningNm(conn, diningName);
		JDBCTemplate.close(conn);
		return result;
	}

}
