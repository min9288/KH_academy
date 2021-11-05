package lifestyle.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import lifestyle.model.vo.LfReview;
import lifestyle.model.vo.Lifestyle;
import lifestyle.model.vo.ResLifestyle;

public class LifestyleDao {
	//새로운 라이프스타일 등록
	public int insertLifestyle(Connection conn, Lifestyle lf) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into lifestyle values(lf_seq.nextval,?,?,?,1,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lf.getLfCategory());
			pstmt.setString(2, lf.getLfTitle());
			pstmt.setString(3, lf.getLfContent());
			pstmt.setString(4, lf.getFilepath());
			pstmt.setString(5, lf.getFilename());
			pstmt.setString(6, lf.getThumbnail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//라이프 스타일 조회
	public ArrayList<Lifestyle> selectLifestyleList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Lifestyle> list = new ArrayList<Lifestyle>();
		String query = "select * from(select rownum as rnum,l.* from (select * from lifestyle) l) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Lifestyle lf = new Lifestyle();
				lf.setLfNo(rset.getInt("lf_no"));
				lf.setLfContent(rset.getString("lf_content"));
				lf.setLfCategory(rset.getString("lf_category"));
				lf.setLfTitle(rset.getString("lf_title"));
				list.add(lf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	//전체 라이프스타일 조회
	public int selectTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from lifestyle";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return result;
	}
	//상세보기
	public Lifestyle selectOneLifestyle(Connection conn, int lfNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Lifestyle lf = null;
		String query = "select * from lifestyle where lf_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, lfNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				lf = new Lifestyle();
				lf.setLfContent(rset.getString("lf_content"));
				lf.setLfCategory(rset.getString("lf_category"));
				lf.setLfNo(rset.getInt("lf_no"));
				lf.setLfStatus(rset.getInt("lf_status"));
				lf.setLfTitle(rset.getString("lf_title"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return lf;
	}
	//전체 조회
	public ArrayList<Lifestyle> selectAllLifestyle(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Lifestyle> list =new ArrayList<Lifestyle>();
		String query = "select * from lifestyle order by lf_title";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Lifestyle lf = new Lifestyle();
				lf.setLfCategory(rset.getString("lf_category"));
				lf.setLfContent(rset.getString("lf_content"));
				lf.setLfNo(rset.getInt("lf_no"));
				lf.setLfStatus(rset.getInt("lf_status"));
				lf.setLfTitle(rset.getString("lf_title"));
				lf.setFilename(rset.getString("filename"));
				lf.setFilepath(rset.getString("filepath"));
				lf.setThumbnail(rset.getString("thumbnail"));
				list.add(lf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	//카테고리 중복 제거 조회
	public ArrayList<Lifestyle> selectAllCategory(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Lifestyle> categoryList = new ArrayList<Lifestyle>();
		String quety = "select distinct lf_category from lifestyle order by 1 desc";
		try {
			pstmt = conn.prepareStatement(quety);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Lifestyle lf = new Lifestyle();
				lf.setLfCategory(rset.getString("lf_category"));
				categoryList.add(lf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return categoryList;
	}
	//수정하기 전 조회
	public Lifestyle selectOneLfContent(Connection conn, int lfNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Lifestyle lf = null;
		String query = "select * from lifestyle where lf_no=?";
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, lfNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				lf = new Lifestyle();
				lf.setLfCategory(rset.getString("lf_category"));
				lf.setLfContent(rset.getString("lf_content"));
				lf.setLfTitle(rset.getString("lf_title"));
				lf.setLfNo(rset.getInt("lf_no"));
				lf.setLfStatus(rset.getInt("lf_status"));
				lf.setThumbnail(rset.getString("thumbnail"));
				lf.setFilename(rset.getString("filename"));
				lf.setFilepath(rset.getString("filepath"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(conn);
		}
		return lf;
	}
	//라이프 스타일 수정하기
	public int updateLifestyle(Connection conn, Lifestyle lf) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update lifestyle set lf_category=?, lf_title=?, lf_content=?,filename=?, filepath=?, thumbnail=? where lf_no=?";
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, lf.getLfCategory());
			pstmt.setString(2, lf.getLfTitle());
			pstmt.setString(3, lf.getLfContent());
			pstmt.setString(4, lf.getFilename());
			pstmt.setString(5, lf.getFilepath());
			pstmt.setString(6, lf.getThumbnail());
			pstmt.setInt(7, lf.getLfNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//라이프스타일 삭제하기
	public int deleteLifestyle(Connection conn, int lfNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="delete from lifestyle where lf_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, lfNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//헤더에서 상세조회
	public Lifestyle selectOneLifestyle(Connection conn, String lfCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Lifestyle lf = null;
		String query = "select lf_no from (select lf_no,lf_category, lf_title  from lifestyle where lf_category = ? order by lf_title) a where rownum =1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lfCategory);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				lf = new Lifestyle();
				lf.setLfNo(rset.getInt("lf_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return lf;
	}
	//상세보기 - 리뷰보기
	public ArrayList<LfReview> selectLfReview(Connection conn, int lfNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LfReview> list = new ArrayList<LfReview>();
		String query = "select * from life_review where lf_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, lfNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				LfReview lfR = new LfReview();
				lfR.setLfNo(rset.getInt("lf_no"));
				lfR.setResNo(rset.getString("res_no"));
				lfR.setLifeName(rset.getString("life_name"));
				lfR.setResDate(rset.getString("res_date"));
				lfR.setLfRNo(rset.getInt("lf_r_no"));
				lfR.setReviewContent(rset.getString("review_content"));
				lfR.setReviewDate(rset.getString("review_date"));
				lfR.setReviewWriter(rset.getString("review_writer"));
				lfR.setStar(rset.getInt("star"));
				list.add(lfR);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	//예약 등록하기
	public int insertResLifestyle(Connection conn, ResLifestyle rl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into lf_res values('LF'||LF_RES_SEQ.NEXTVAL,?,?,?,?,?,1,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rl.getLfNo());
			pstmt.setString(2, rl.getMemberId());
			pstmt.setInt(3, rl.getResPeople());
			pstmt.setString(4, rl.getResDate());
			pstmt.setString(5, rl.getResTime());
			pstmt.setInt(6, rl.getPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//본인 예약 전체조회
	public ArrayList<ResLifestyle> selectResLifestyle(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ResLifestyle> list = null;
		String query = "select * from lf_res where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ResLifestyle rl = new ResLifestyle();
				rl.setLfNo(rset.getInt("lf_no")); 
				rl.setMemberId(rset.getString("member_id"));
				rl.setPrice(rset.getInt("price"));
				rl.setResDate(rset.getString("res_date"));
				rl.setResNo(rset.getString("res_no"));
				rl.setResPeople(rset.getInt("res_people"));
				rl.setResTime(rset.getString("res_time"));
				rl.setStatus(rset.getInt("status"));
				list.add(rl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	//수정 전 예약 조회
	public ResLifestyle selectOneResLifestyle(Connection conn, String resNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from lf_res where res_no=?";
		ResLifestyle rl = new ResLifestyle();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, resNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rl.setLfNo(rset.getInt("lf_no")); 
				rl.setMemberId(rset.getString("member_id"));
				rl.setPrice(rset.getInt("price"));
				rl.setResDate(rset.getString("res_date"));
				rl.setResNo(rset.getString("res_no"));
				rl.setResPeople(rset.getInt("res_people"));
				rl.setResTime(rset.getString("res_time"));
				rl.setStatus(rset.getInt("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rl;
	}
	//예약 수정
	public int updateResLifestyle(Connection conn, ResLifestyle rl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update lf_res set res_people=?,res_date=?,res_time=?,price=? where res_no=?";
		System.out.println(query);
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, rl.getResPeople());
			pstmt.setString(2, rl.getResDate());
			pstmt.setString(3, rl.getResTime());
			pstmt.setInt(4, rl.getPrice());
			pstmt.setString(5, rl.getResNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//취소신청
	public int deleteRequestLf(Connection conn, String resNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String query ="update lf_res set status=3 where res_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//예약취소
	public int deleteResLf(Connection conn, String resNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String query ="update lf_res set status=4 where res_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//예약 불가 날짜 조회
	public ArrayList<ResLifestyle> selectNoneDate(Connection conn, int lfNo) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<ResLifestyle> resList = new ArrayList<ResLifestyle>();
		String query = "select to_char(res_date,'YYYY-MM-DD') as res_date from (select res_date,lf_no,decode(sum(res_people),30,'1','2')as count_status from lf_res where status=1  and res_date>sysdate group by res_date,lf_no) where lf_no=? and count_status = 1";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, lfNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ResLifestyle rl = new ResLifestyle();
				rl.setResDate(rset.getString("res_date"));				
				resList.add(rl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return resList;
	}

}
