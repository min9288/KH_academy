package kr.or.gosu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuRequestCount;
import kr.or.gosu.vo.GosuRequestProject;
import kr.or.gosu.vo.GosuRequestProjectSub;
import kr.or.gosu.vo.GosuRequestReview;
import kr.or.gosu.vo.GosuReview;
import kr.or.gosu.vo.GosuTalk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
@Repository
public class GosuDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertGosu(Gosu g) {
		
		return sqlSession.insert("gosu.insertGosu",g);
	}

	public int insertGPhoto(GosuPhoto gph) {
		return sqlSession.insert("gosu.insertGPhoto",gph);
	}

	public int insertGProject(GosuProject gpr) {
		return sqlSession.insert("gosu.insertGProject",gpr);
	}

	public ArrayList<Gosu> selectGosuList() {
		List<Gosu> list = sqlSession.selectList("gosu.gosuList");
		return (ArrayList<Gosu>)list;
	}

	public String selectGosuId(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuId",gosuNo);
	}

	public String selectGosuImg(int gosuNo) {
		return sqlSession.selectOne("gosu.getGosuImg",gosuNo);
	}

	public Gosu selectGosuOne(int ggosuNo) {
		return sqlSession.selectOne("gosu.selectGosuOne",ggosuNo);
	}

	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		List<GosuProject> list = sqlSession.selectList("gosu.selectGosuProjectList",gNo);
		return (ArrayList<GosuProject>)list;
	}

	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		List<GosuPhoto> list = sqlSession.selectList("gosu.selectGosuPhotoList",gNo);
		return (ArrayList<GosuPhoto>)list;
	}

	public int insertGosuNotice(GosuNotice gNotice) {
		return sqlSession.insert("gosu.insertGosuNotice",gNotice);
	}

	public GosuNotice selectGosuNoticeOne(int gnoticeNo) {
		return sqlSession.selectOne("gosu.selectGosuNoticeOne",gnoticeNo);
	}

	

	public String selectGosuImg(String writeId) {
		return sqlSession.selectOne("gosu.getGosuImg2",writeId);
	}

	public int selectGosuCount() {
		return sqlSession.selectOne("gosu.selectGosuCount");
	}

	public GosuProject selectGProject(int pNo) {
		return sqlSession.selectOne("gosu.selectGProject",pNo);
	}

	public int insertGosuFeedback(GosuFeedback gf) {
		return sqlSession.insert("gosu.insertGosuFeedback",gf);
	}

	public GosuFeedback selectFeedbackOne(int fbNo) {
		return sqlSession.selectOne("gosu.selectFeedbackOne",fbNo);
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList(String memberId) {
		List<GosuFeedback> list = sqlSession.selectList("gosu.selectGosuFeedbackList",memberId);
		return (ArrayList<GosuFeedback>)list;
	}

	public String selectGosuId2(int ggosuNo) {
		return sqlSession.selectOne("gosu.getGosuId2",ggosuNo);
	}

	public int insertGosuTalk(GosuTalk gt) {
		return sqlSession.insert("gosu.insertGosuTalk",gt);
	}

	public int updateFeedbackNum(int feedbackNo) {
		return sqlSession.update("gosu.updateFeedbackNum",feedbackNo);
	}

	public ArrayList<GosuTalk> selectGosuTalk(int fbNo) {
		List<GosuTalk> list = sqlSession.selectList("gosu.selectGosuTalkList",fbNo);
		return (ArrayList<GosuTalk>)list;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList2(String memberId) {
		List<GosuFeedback> list = sqlSession.selectList("gosu.selectGosuFeedbackList2",memberId);
		return (ArrayList<GosuFeedback>)list;
	}

	public int talkStop(int feedbackNo) {
		return sqlSession.update("gosu.talkStop",feedbackNo);
	}

	public String selectMemberId(int feedbackNo) {
		return sqlSession.selectOne("gosu.selectMemberId",feedbackNo);
	}

	public Gosu selectgosuWriteList(String gosuId) {
		return sqlSession.selectOne("gosu.selectgosuWriteList",gosuId);
	}

	public int insertGosuRequest(GosuRequest gr) {
		return sqlSession.insert("gosu.insertGosuRequest",gr);
	}


	public GosuRequest selectGosuRequestContent(int mrn) {
		return sqlSession.selectOne("gosu.selectGosuRequestContent",mrn);
	}

	public int gosuRequestCostInsert(GosuRequestCost grc) {
		return sqlSession.insert("gosu.gosuRequestCostInsert",grc);
	}

	public GosuRequestCost selectRequestNoGosuNo(GosuRequestCost grc) {
		return sqlSession.selectOne("gosu.selectRequestNoGosuNo",grc);
	}

	public GosuRequestCost selectGosuRequestCost(int costNo) {
		return sqlSession.selectOne("gosu.selectGosuRequestCost",costNo);
	}

	public int selectRequestCount() {
		return sqlSession.selectOne("gosu.selectRequestCount");
	}

	public int insertGosuRequestProjectSub(GosuRequestProjectSub grps) {
		return sqlSession.insert("gosu.insertGosuRequestProjectSub",grps);
	}

	public ArrayList<GosuRequestProject> selectGosuRequestProjectOne(int rpsNo) {
		List<GosuRequestProject> list = sqlSession.selectList("gosu.selectGosuRequestProjectOne",rpsNo);
		return (ArrayList<GosuRequestProject>)list;
	}

	public GosuRequestProjectSub selectGosuRequestProjectSub(int rpsNo) {
		return sqlSession.selectOne("gosu.selectGosuRequestProjectSub",rpsNo);
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList(int memberNo) {
		List<GosuRequestProjectSub> list = sqlSession.selectList("gosu.selectGosuRequestProjectSubList",memberNo);
		return (ArrayList<GosuRequestProjectSub>)list;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList2(int memberNo) {
		List<GosuRequestProjectSub> list = sqlSession.selectList("gosu.selectGosuRequestProjectSubList2",memberNo);
		return (ArrayList<GosuRequestProjectSub>)list;
	}

	public int insertGosuRequestProject(GosuRequestProject grp) {
		return sqlSession.insert("gosu.insertGosuRequestProject",grp);
	}

	public int talkStop2(int requestProjectSubNo) {
		return sqlSession.update("gosu.talkStop2",requestProjectSubNo);
	}

	public int insetReviewOne(GosuReview greview) {
		return sqlSession.insert("gosu.insetReviewOne",greview);
	}

	public GosuReview selectGosuReviewOne(GosuReview gr) {
		return sqlSession.selectOne("gosu.selectGosuReviewOne",gr);
	}

	public ArrayList<GosuReview> selectGosuReviewList(int ggsouNo) {
		List<GosuReview> list = sqlSession.selectList("gosu.selectGosuReviewList",ggsouNo);
		return (ArrayList<GosuReview>)list;
	}


	public int selectReviewCount(int ggsouNo) {
		return sqlSession.selectOne("gosu.selectReviewCount",ggsouNo);
	}

	public Double selectReviewAvg(int ggsouNo) {
		return sqlSession.selectOne("gosu.selectReviewAvg",ggsouNo);
	}

	public int insertRequestReviewAjax(GosuRequestReview grr) {
		return sqlSession.insert("gosu.insertRequestReviewAjax",grr);
	}

	public GosuRequestReview GosuRequestReview(GosuRequestReview grr2) {
		
		return sqlSession.selectOne("gosu.GosuRequestReview",grr2);
	}

	public int gosuNoticeUpdate(GosuNotice gNotice) {
		return sqlSession.update("gosu.gosuNoticeUpdate",gNotice);
	}

	public int noticeContentdelete(int gnn) {
		return sqlSession.delete("gosu.noticeContentdelete",gnn);
	}

	public ArrayList<GosuRequestReview> selectGosuRequestReviewList(int ggsouNo) {
		List<GosuRequestReview> list = sqlSession.selectList("gosu.selectGosuRequestReviewList",ggsouNo);
		return (ArrayList<GosuRequestReview>)list;
	}

	public int selectGrrCount(int ggsouNo) {
		return sqlSession.selectOne("gosu.selectGrrCount",ggsouNo);
	}

	public ArrayList<GosuReview> selectMemberReviewList(String memberId) {
		List<GosuReview> list = sqlSession.selectList("gosu.selectMemberReviewList",memberId);
		return (ArrayList<GosuReview>)list;
	}

	public ArrayList<GosuRequestReview> selectMemberRequestReviewList(String memberId) {
		List<GosuRequestReview> list = sqlSession.selectList("gosu.selectMemberRequestReviewList",memberId);
		return (ArrayList<GosuRequestReview>)list;
	}

	public int selectGosuListTotalCount() {
		return sqlSession.selectOne("gosu.selectGosuListTotalCount");
	}

	public ArrayList<Gosu> selectGosuList(Map<String, Object> map) {
		List<Gosu> list = sqlSession.selectList("gosu.selectGosuListMap",map);
		return (ArrayList<Gosu>)list;
	}

	public ArrayList<GosuNotice> selectGosuNoticeList(Map<String, Object> map) {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeList",map);
		return (ArrayList<GosuNotice>)list;
	}

	public ArrayList<GosuNotice> selectGosuNoticeList2() {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeList2");
		return (ArrayList<GosuNotice>)list;
	}

	public ArrayList<Gosu> selectNewGosuList() {
		List<Gosu> list = sqlSession.selectList("gosu.selectNewGosuList");
		return (ArrayList<Gosu>)list;
	}

	public int selectGosuNoticeListTotalCount() {
		return sqlSession.selectOne("gosu.selectGosuNoticeListTotalCount");
	}

	public ArrayList<GosuRequest> selectMemberRequestList(Map<String, Object> map) {
		List<GosuRequest> list = sqlSession.selectList("gosu.selectMemberRequestList",map);
		return (ArrayList<GosuRequest>)list;
	}

	public ArrayList<GosuRequestCost> selectGosuRequestCostList(Map<String, Object> map) {
		List<GosuRequestCost> list = sqlSession.selectList("gosu.selectGosuRequestCostList",map);
		return (ArrayList<GosuRequestCost>)list;
	}

	public int selectRequestCostCount(String memberId) {
		return sqlSession.selectOne("gosu.selectRequestCostCount",memberId);
	}

	public ArrayList<Gosu> selectGosuListKeyword(Map<String, Object> map) {
		List<Gosu> list = sqlSession.selectList("gosu.selectGosuListKeyword",map);
		return (ArrayList<Gosu>)list;
	}

	public int selectGosuListTotalCountKeyword(Map<String, Object> map) {
		return sqlSession.selectOne("gosu.selectGosuListTotalCountKeyword",map);
	}

	public ArrayList<GosuNotice> selectGosuNoticeListKeyword(Map<String, Object> map) {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeListKeyword",map);
		return (ArrayList<GosuNotice>)list;
	}

	public int selectGosuNoticeListTotalCountKeyword(Map<String, Object> map) {
		return sqlSession.selectOne("gosu.selectGosuNoticeListTotalCountKeyword",map);
	}

	public int insertGosuNoticeComment(Comment cmt) {
		return sqlSession.insert("gosu.insertGosuNoticeComment",cmt);
	}

	public ArrayList<Comment> selectGosuNoticeCommentList(int gnn) {
		List<Comment> list = sqlSession.selectList("gosu.selectGosuNoticeCommentList",gnn);
		return (ArrayList<Comment>)list;
	}

	public int insertGosuNoticeCommentRe(Comment cmt) {
		return sqlSession.insert("gosu.insertGosuNoticeCommentRe",cmt);
	}

	public int gNoticeCommentUpdateAjax(Comment cmt) {
		return sqlSession.insert("gosu.gNoticeCommentUpdateAjax",cmt);
	}

	public int gNoticeCommentDeleteAjax(int commentNo) {
		return sqlSession.delete("gosu.gNoticeCommentDeleteAjax",commentNo);
	}

	public ArrayList<GosuRequest> selectMemberRequestListGosuNoIN(Map<String, Object> map) {
		List<GosuRequest> list = sqlSession.selectList("gosu.selectMemberRequestListGosuNoIN",map);
		return (ArrayList<GosuRequest>)list;
	}

	public int selectRequestCountGosuNoIN(Map<String, Object> map) {
		return sqlSession.selectOne("gosu.selectRequestCountGosuNoIN",map);
	}

	public GosuRequest gosuMemberRequestAjax(GosuRequestCost grc) {
		return sqlSession.selectOne("gosu.gosuMemberRequestAjax",grc);
	}

	public ArrayList<Gosu> selectGosuListAll() {
		List<Gosu> list = sqlSession.selectList("gosu.selectGosuListAll");
		return (ArrayList<Gosu>)list;
	}

	public int selectGosuRequestCostListCount(String memberId) {
		return sqlSession.selectOne("gosu.selectGosuRequestCostListCount",memberId);
	}

	public int selectGosuRequestListCount(int memberNo) {
		return sqlSession.selectOne("gosu.selectGosuRequestListCount",memberNo);
	}

	public int insertGNComment(Comment cm) {
		return sqlSession.insert("gosu.insertGNComment",cm);
	}

	public int reportContestComment(Report rp) {
		return sqlSession.insert("gosu.reportContestComment",rp);
	}

	public ArrayList<GosuNotice> selectGosuNoticeListSelf(String gosuId) {
		List<GosuNotice> list = sqlSession.selectList("gosu.selectGosuNoticeListSelf",gosuId);
		return (ArrayList<GosuNotice>)list;
	}

	public int selectMyGgosuNo(int memberNo) {
		return sqlSession.selectOne("gosu.selectMyGgosuNo",memberNo);
	}

	public ArrayList<GosuRequestReview> selectGosuRequestReviewList2(int memberNo) {
		List<GosuRequestReview> list = sqlSession.selectList("gosu.selectGosuRequestReviewList2",memberNo);
		return (ArrayList<GosuRequestReview>)list;
	}

	public int selectGrrCount2(int memberNo) {
		return sqlSession.selectOne("gosu.selectGrrCount2",memberNo);
	}


}
