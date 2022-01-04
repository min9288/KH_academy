package kr.or.projectTeam.model.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.comment.vo.Report;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectReview;
import kr.or.projectTeam.model.vo.ProjectTask;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamMember;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
import kr.or.projectTeam.model.vo.Shortcuts;
import kr.or.projectTeam.model.vo.TaskShortcuts;
import kr.or.projectTeam.model.vo.UseDevelopLanguage;
import kr.or.projectTeam.model.vo.projectDevLanguage;

@Repository
public class ProjectTeamDao {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProjectTeam> selectAllrecruitProject() {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectList");
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<ProjectTeam> selectAllprojectList(Map<String, Object> map) {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectList", map);
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<projectDevLanguage> selectAllprojectLangList() {
		List<projectDevLanguage> list = sqlSession.selectList("projectTeam.projectLangList");
		return (ArrayList<projectDevLanguage>) list;
	}

	public int selectTotalCount() {
		int result = sqlSession.selectOne("projectTeam.projectDefaultCount");
		return result;
	}

	public int selectCheckTotalCount(Map<String, Object> map) {
		int result = sqlSession.selectOne("projectTeam.projectCheckCount", map);
		return result;
	}

	public ArrayList<ProjectTeam> selectAllCheckprojectList(Map<String, Object> map) {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectCheckList", map);
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<DevelopLanguage> selectAllDevelopLangList() {
		List<DevelopLanguage> list = sqlSession.selectList("projectTeam.developLangList");
		return (ArrayList<DevelopLanguage>) list;
	}

	public int writeRecruitTeam(Map<String, Object> map) {
		int insertLangValue = 1;
		map.put("insertLangValue", insertLangValue);
		int result = 0;
		int tempResult = sqlSession.insert("projectTeam.writeRecruitTeam", map);
		if (tempResult > 0) {
			map.replace("insertLangValue", 2);
			result = sqlSession.insert("projectTeam.writeRecruitTeam", map);
		}
		return result;
	}

	public int updateReadCount(int projectNo) {
		return sqlSession.update("projectTeam.updateReadCount", projectNo);
	}

	public ProjectTeam selectOneNotice(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectOneNotice", map);
	}

	public ArrayList<ProjectTeamNoticeComment> selectCommentList(int projectNo) {
		List<ProjectTeamNoticeComment> list = sqlSession.selectList("projectTeam.selectCommentList", projectNo);
		return (ArrayList<ProjectTeamNoticeComment>) list;
	}

	public int updateRecruitTeam(Map<String, Object> map) {
		int result = 0;
		int tempResult = sqlSession.update("projectTeam.updateRecruitTeam", map);
		if (tempResult > 0) {
			int tempResult2 = sqlSession.delete("projectTeam.deleteLangList", map);
			if (tempResult2 > 0) {
				int insertLangValue = 2;
				map.put("insertLangValue", insertLangValue);
				result = sqlSession.insert("projectTeam.writeRecruitTeam", map);
			}
		}
		return result;
	}

	public int deleteOneNotice(int projectNo) {
		return sqlSession.delete("projectTeam.deleteOneNotice", projectNo);
	}

	public int updateStatus() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		return sqlSession.update("projectTeam.updateStatus", today);
	}

	public int insertComment(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertComment", map);
	}

	public int deleteComment(int commentNo) {
		return sqlSession.delete("projectTeam.deleteComment", commentNo);
	}

	public int updateComment(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateComment", map);
	}

	public int reCommentInsert(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.reCommentInsert", map);
	}

	public int insertDibCount(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertDibCount", map);
	}

	public int deleteDibCount(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.deleteDibCount", map);
	}

	public int insertApplyProject(Map<String, Object> map) {
		int insertLangValue = 1;
		map.put("insertLangValue", insertLangValue);
		int result = 0;
		int tempResult = sqlSession.insert("projectTeam.insertApplyProject", map);
		if (tempResult > 0) {
			map.replace("insertLangValue", 2);
			result = sqlSession.insert("projectTeam.insertApplyProject", map);
		}
		return result;
	}

	public ArrayList<ProjectEntry> selectAllManageEntry(Map<String, Object> map) {
		List<ProjectEntry> list = sqlSession.selectList("projectTeam.selectAllManageEntry", map);
		return (ArrayList<ProjectEntry>) list;
	}

	public ArrayList<UseDevelopLanguage> selectAllUseDevelopLangList() {
		List<UseDevelopLanguage> list = sqlSession.selectList("projectTeam.selectAllUseDevelopLangList");
		return (ArrayList<UseDevelopLanguage>) list;
	}

	public int selectentryTotalCount(int entryNo) {
		return sqlSession.selectOne("projectTeam.selectentryTotalCount");
	}

	public int selectMember(Map<String, Object> map) {
		return sqlSession.update("projectTeam.selectMember", map);
	}

	public ArrayList<Integer> selectFinalMember(int projectNo) {
		List<Integer> finalList = sqlSession.selectList("projectTeam.selectAllFinalEntry", projectNo);
		return (ArrayList<Integer>) finalList;
	}

	public int closeRecruitTeam(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertFinalTeamMember", map);
	}

	public int updateFinalRecruitTeam(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateFinalRecruitTeam", map);
	}

	public int updateFinalRecruitTeam2(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateFinalRecruitTeam2", map);
	}

	public int insertFinalTeamWriter(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertFinalTeamWriter", map);
	}

	public int deleteTeamMember(int entryNo) {
		return sqlSession.update("projectTeam.deleteTeamMember", entryNo);
	}

	public ArrayList<ProjectEntry> manageFinalEntryFrm(Map<String, Object> map) {
		List<ProjectEntry> finalMemberList = sqlSession.selectList("projectTeam.manageFinalEntryFrm", map);
		return (ArrayList<ProjectEntry>) finalMemberList;
	}

	public ArrayList<Integer> selectStartProjectList(String today) {
		List<Integer> startProjectList = sqlSession.selectList("projectTeam.selectStartProjectList", today);
		return (ArrayList<Integer>) startProjectList;
	}

	public ArrayList<Integer> startProjectMemberList(Map<String, Object> map) {
		List<Integer> startProjectMemberList = sqlSession.selectList("projectTeam.startProjectMemberList", map);
		return (ArrayList<Integer>) startProjectMemberList;
	}

	public int updateEntryResult(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateEntryResult", map);
	}


	public ArrayList<ProjectEntry> startProjectListFinal(Map<String, Object> map) {
		List<ProjectEntry> startProjectFinalList = sqlSession.selectList("projectTeam.startProjectListFinal", map);
		return (ArrayList<ProjectEntry>) startProjectFinalList;
	}

	public int insertTeamMember(ArrayList<ProjectEntry> startProjectListFinalList) {
		return sqlSession.insert("projectTeam.insertTeamMember", startProjectListFinalList);
	}

	public int insertFinalTeamMember2(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertFinalTeamMember2", map);
	}

	public int returnTeamMember(int entryNo) {
		return sqlSession.update("projectTeam.returnTeamMember", entryNo);
	}

	public int updateFinalTeamMember(int entryNo) {
		return sqlSession.update("projectTeam.updateFinalTeamMember", entryNo);
	}

	public ProjectEntry selectOneApplicant(int entryNo) {
		return sqlSession.selectOne("projectTeam.selectOneApplicant", entryNo);
	}

	public ArrayList<ProjectTeamNoticeComment> selectApplyCommentList(int entryNo) {
		List<ProjectTeamNoticeComment> list = sqlSession.selectList("projectTeam.selectApplyCommentList", entryNo);
		return (ArrayList<ProjectTeamNoticeComment>) list;
	}

	public int searchEntryNo(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.searchEntryNo", map);
	}

	public int cancelApplyProject(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.cancelApplyProject", map);
	}

	public int deleteUseLang(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.deleteUseLang", map);
	}

	public int updateApplyData(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateApplyData", map);
	}

	public int deleteApplyLangList(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.deleteApplyLangList", map);
	}

	public int insertApplyLangList(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertApplyLangList", map);
	}

	public int insertApplyComment(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertApplyComment", map);
	}

	public int applyCheckValue(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.applyCheckValue", map);
	}

	public int searchEntryNo2(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.searchEntryNo2", map);
	}

	public ProjectTeam projectInfo(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.projectInfo", map);
	}

	public ArrayList<ProjectTeamMember> memberInfoList(Map<String, Object> map) {
		List<ProjectTeamMember> list = sqlSession.selectList("projectTeam.memberInfoList", map);
		return (ArrayList<ProjectTeamMember>) list;
	}

	public ProjectTask recentTask(int projectNo) {
		return sqlSession.selectOne("projectTeam.ProjectTask", projectNo);
	}

	public ProjectTask toDoTask(int projectNo) {
		return sqlSession.selectOne("projectTeam.toDoTask", projectNo);
	}

	public int addShortcut(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.addShortcut", map);
	}

	public ArrayList<Shortcuts> shortcutList(int projectNo) {
		List<Shortcuts> list = sqlSession.selectList("projectTeam.shortcutList", projectNo);
		return (ArrayList<Shortcuts>) list;
	}

	public int deleteShortcut(int shortcutNo) {
		return sqlSession.delete("projectTeam.deleteShortcut", shortcutNo);
	}

	public int insertReview(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertReview", map);
	}

	public int reviewMemberPointUpdate(ProjectReview pr) {
		return sqlSession.update("projectTeam.reviewMemberPointUpdate", pr);
	}

	public int endProject(Map<String, Object> map) {
		return sqlSession.update("projectTeam.endProject", map);
	}

	public int updateProjectLangList1(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.deleteLangList", map);
	}

	public int updateProjectLangList2(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertProjectLangList", map);
	}

	public int projectUpdate(Map<String, Object> map) {
		return sqlSession.update("projectTeam.projectUpdate", map);
	}

	public int crueRollUpdate(Map<String, Object> map) {
		return sqlSession.update("projectTeam.crueRollUpdate", map);
	}

	public ArrayList<ProjectTask> projectTaskList(int projectNo) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.projectTaskList", projectNo);
		return (ArrayList<ProjectTask>) list;
	}

	public ArrayList<ProjectTask> selectAllTaskMList(int projectNo) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskMList", projectNo);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectTaskMTotalCount(int projectNo) {
		return sqlSession.selectOne("projectTeam.selectTaskMTotalCount", projectNo);
	}

	public ArrayList<ProjectTeamMember> selectTeamMember(int projectNo) {
		List<ProjectTeamMember> list = sqlSession.selectList("projectTeam.selectTeamMember", projectNo);
		return (ArrayList<ProjectTeamMember>) list;
	}

	public int addIssue(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.addIssue", map);
	}

	public int addIssueToday(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.addIssueToday", map);
	}
	
	public ArrayList<ProjectTeam> selectMainProjectList() {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.selectMainProjectList");
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<TaskShortcuts> taskShortcutList(int projectNo) {
		List<TaskShortcuts> list = sqlSession.selectList("projectTeam.taskShortcutList", projectNo);
		return (ArrayList<TaskShortcuts>) list;
	}

	public int taskDateUpdate(ProjectTask ptk) {
		return sqlSession.update("projectTeam.taskDateUpdate", ptk);
	}

	public int updateCompleteIssue(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateCompleteIssue", map);
	}

	public int updateIssue(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateIssue", map);
	}

	public int connectIssue(Map<String, Object> map) {
		return sqlSession.update("projectTeam.connectIssue", map);
	}

	public int deleteConnectIssue(String taskNo) {
		return sqlSession.update("projectTeam.deleteConnectIssue", taskNo);
	}

	public int connectLink(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.connectLink", map);
	}

	public int deleteConnectLink(int taskShortcutNo) {
		return sqlSession.delete("projectTeam.deleteConnectLink", taskShortcutNo);
	}

	public int deleteTask(String taskNo) {
		return sqlSession.delete("projectTeam.deleteTask", taskNo);
	}

	public ArrayList<ProjectTask> selectAllTaskMSelectList(Map<String, Object> map) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskMSelectList", map);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectCheckTotalSelectCount(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectCheckTotalSelectCount", map);
	}

	public ArrayList<ProjectTask> enterProjectTaskT(int projectNo) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskTList", projectNo);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectTaskTTotalCount(int projectNo) {
		return sqlSession.selectOne("projectTeam.selectTaskTTotalCount", projectNo);
	}

	public int selectCheckTotalCountT(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectCheckTotalCountT", map);
	}

	public ArrayList<ProjectTask> selectAllTaskTSelectList(Map<String, Object> map) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskTSelectList", map);
		return (ArrayList<ProjectTask>) list;
	}

	public ArrayList<ProjectTask> enterProjectTaskB(int projectNo) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.enterProjectTaskB", projectNo);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectTaskBTotalCount(int projectNo) {
		return sqlSession.selectOne("projectTeam.selectTaskBTotalCount", projectNo);
	}

	public ArrayList<ProjectTask> selectAllTaskBSelectList(Map<String, Object> map) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskBSelectList", map);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectCheckTotalCountB(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectCheckTotalCountB", map);
	}

	public ArrayList<ProjectTask> enterProjectTaskH(int projectNo) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.enterProjectTaskH", projectNo);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectTaskHTotalCount(int projectNo) {
		return sqlSession.selectOne("projectTeam.selectTaskHTotalCount", projectNo);
	}

	public ArrayList<ProjectTask> selectAllTaskHList(Map<String, Object> map) {
		List<ProjectTask> list = sqlSession.selectList("projectTeam.selectAllTaskHList", map);
		return (ArrayList<ProjectTask>) list;
	}

	public int selectCheckTotalCountH(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectCheckTotalCountH", map);
	}

	public int reportProjectNoticeComment(Report rp) {
		return sqlSession.insert("projectTeam.reportProjectNoticeComment",rp);
	}

	public int deleteZeroTeam(Integer projectNo) {
		return sqlSession.delete("projectTeam.deleteZeroTeam",projectNo);
	}

	

	
	
}
