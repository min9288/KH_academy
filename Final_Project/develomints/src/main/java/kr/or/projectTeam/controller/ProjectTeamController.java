package kr.or.projectTeam.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.comment.vo.Report;
import kr.or.member.model.vo.Member;
import kr.or.projectTeam.model.service.ProjectTeamService;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectReview;
import kr.or.projectTeam.model.vo.ProjectTask;
import kr.or.projectTeam.model.vo.ProjectTaskViewData;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamApplicantViewData;
import kr.or.projectTeam.model.vo.ProjectTeamApplyPageData;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.projectTeam.model.vo.ProjectTeamMember;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeViewData;
import kr.or.projectTeam.model.vo.Shortcuts;
import kr.or.projectTeam.model.vo.TaskShortcuts;
import kr.or.projectTeam.model.vo.projectDevLanguage;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class ProjectTeamController {
	@Autowired
	private ProjectTeamService service;
	
	DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date nowDate = new Date();
	String today = sdFormat.format(nowDate);
	
	@RequestMapping(value="/recruitTeamMember_mainPage.do")
	public String recruitTeamMember(Model model, int reqPage) {
		int result1 = service.updateStatus();
		if(result1 > 0) {
			int result2 = service.projectStartProcess();
		}
		projectTeamMainPageData ptmpd = service.selectAllrecruitProject(reqPage);
		model.addAttribute("list", ptmpd.getList());
		model.addAttribute("pageNavi", ptmpd.getPageNavi());
		model.addAttribute("start", ptmpd.getStart());
		model.addAttribute("pdLangList", ptmpd.getPdLangList());
		model.addAttribute("developLangList", ptmpd.getDevelopLangList());
		return "recruitCrue/recruitTeamMember_mainPage";
	}
	
	@RequestMapping(value="/recruitTeamMember_mainSelectPage.do")
	public String recruitTeamMember(Model model, int reqPage, int viewValue, int checkValue, String[] langValue) {
		
		if(langValue == null) {
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue);
			model.addAttribute("list", ptmpd.getList());
			model.addAttribute("pageNavi", ptmpd.getPageNavi());
			model.addAttribute("start", ptmpd.getStart());
			model.addAttribute("pdLangList", ptmpd.getPdLangList());
			model.addAttribute("developLangList", ptmpd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);
			model.addAttribute("checkValue", checkValue);
			model.addAttribute("selectLangList", langValue);
			return "recruitCrue/recruitTeamMember_mainPage";
		} else {
			ArrayList<String> langList = new ArrayList<String>(Arrays.asList(langValue));
			projectTeamMainPageData ptmpd = service.selectAllrecruitSelectProject(reqPage, viewValue, checkValue, langList);
			model.addAttribute("list", ptmpd.getList());
			model.addAttribute("pageNavi", ptmpd.getPageNavi());
			model.addAttribute("start", ptmpd.getStart());
			model.addAttribute("pdLangList", ptmpd.getPdLangList());
			model.addAttribute("developLangList", ptmpd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);
			model.addAttribute("checkValue", checkValue);
			model.addAttribute("selectLangList", langValue);
			return "recruitCrue/recruitTeamMember_mainPage";
		}
	}
	
	@RequestMapping(value="/recruitNotice_writeForm.do")
	public String recruitTeamMemberDatail(int memberNo, Model model) {
		ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
		if(memberNo > 0) {
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("dlList", dlList);
			return "recruitCrue/recruitNotice_writeForm";
		} else {
			model.addAttribute("title", "로그인 요청");
			model.addAttribute("msg", "로그인 후 작성이 가능합니다.");
			model.addAttribute("icon", "warning");	
		}
		model.addAttribute("loc","/");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/rUploadImage.do")
	@ResponseBody
	public String rUploadImage( MultipartFile file, HttpServletRequest request) {
		 /*
			* String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		*/
		// 내부경로로 저장
		String saveRoot = request.getSession().getServletContext().getRealPath("/resources/upload/projectTeam/editor/");
		
		String originalFileName = file.getOriginalFilename(); 	//오리지날 파일명
		String onlyFilename = originalFileName.substring(0,originalFileName.indexOf("."));
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		// 파일 확장자
		String savedFileName = null;	//저장될 파일 명
		int count=0;
		while(true) {
			if(count == 0 ) {
				savedFileName = onlyFilename+extension;
			}else {
				savedFileName = onlyFilename+"_"+count+extension;
			}
			File checkFile = new File(saveRoot+savedFileName);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(saveRoot + savedFileName));
			//업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/resources/upload/projectTeam/editor/"+savedFileName;
	}
	
	@RequestMapping(value="/writeRecruitTeam.do")
	public String writeRecruitTeam(HttpServletRequest request, Model model, ProjectTeam pt, int memberNo, String[] chk) {
		ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
		
		int result = service.writeRecruitTeam(pt, memberNo, langList);
		if(result > 0) {
			model.addAttribute("title", "등록 성공");
			model.addAttribute("msg", "모집공고 등록 완료되었습니다.");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "등록 실패");
			model.addAttribute("msg", "모집공고 작성 오류[고객센터에 문의 부탁드립니다.]");
			model.addAttribute("icon", "warning");
		}
		model.addAttribute("loc","/recruitTeamMember_mainPage.do?reqPage=1");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/selectOneNotice.do")
	public String selectOneNotice(Model model, Integer projectNo, Integer memberNo) {
		/*
		 * int result1 = service.updateStatus(); if(result1 > 0) { int result2 =
		 * service.projectStartProcess(); }
		 */
		if(memberNo == null) {
			memberNo = -1;
		}
		int entryNo = 0;
		int applyCheckValue = service.applyCheckValue(projectNo, memberNo);
		if(applyCheckValue > 0) {
			entryNo = service.searchEntryNo2(projectNo, memberNo);
		}
		ProjectTeamNoticeViewData ptnvd = service.selectOneNotice(projectNo, memberNo);
		model.addAttribute("commentList", ptnvd.getList());
		model.addAttribute("pt", ptnvd.getPt());
		model.addAttribute("pdLangList", ptnvd.getPdLangList());
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("applyCheckValue",applyCheckValue);
		if(entryNo > 0) {
			model.addAttribute("entryNo",entryNo);
		}
		return "recruitCrue/recruitTeamMember_detail";
	}
	
	@RequestMapping(value="/updateRecruitFrm.do")
	public String updateOneNoticeFrm(Model model, int projectNo, Integer memberNo) {
		ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
		if(memberNo == null) {
			memberNo = -1;
		}
		ProjectTeamNoticeViewData ptnvd = service.selectOneNotice(projectNo, memberNo);
		model.addAttribute("commentList", ptnvd.getList());
		model.addAttribute("pt", ptnvd.getPt());
		model.addAttribute("pdLangList", ptnvd.getPdLangList());
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("dlList", dlList);
		return "recruitCrue/recruitNoticeUpdateForm";
	}
	
	
	  @RequestMapping(value="/updateRecruitNotice.do") 
	  public String updateOneNotice(HttpServletRequest request, Model model, ProjectTeam pt, int memberNo, String[] chk, int projectNo) { 
		  ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
		  int result = service.updateRecruitTeam(pt, memberNo, langList, projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "수정성공!");
			  model.addAttribute("msg", "수정 완료되었습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "변경실패");
			  model.addAttribute("msg", "수정 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteRecruit.do") 
	  public String deleteOneNotice(Model model, int projectNo, int memberNo) { 
		  int result = service.deleteOneNotice(projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "삭제 성공");
			  model.addAttribute("msg", "삭제 완료되었습니다.");
			  model.addAttribute("loc","/recruitTeamMember_mainPage.do?reqPage=1");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "삭제 실패");
			  model.addAttribute("msg", "삭제 실패하였습니다.");
			  model.addAttribute("loc","/recruitTeamMember.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertComment.do") 
	  public String insertComment(Model model, String commentContent, int boardNo, String memberId, int memberNo, int boardType, int checkMemberNo) {
		  int entryNo = 0;
		  int result = 0;
		  if(boardType == 3) {
			  result = service.insertComment(commentContent, boardNo, memberId, boardType); 
		  }else {
				  entryNo = service.searchEntryNo(boardNo, memberNo);
				  result = service.insertComment(commentContent, boardNo, memberId, boardType, entryNo);
					/*
					 * if(checkMemberNo != memberNo) { } else { result =
					 * service.insertComment(commentContent, boardNo, memberId, boardType); }
					 */
		  }
		  if(result > 0) { 
			  model.addAttribute("title", "댓글 등록 성공");
			  model.addAttribute("msg", "댓글 등록 완료되었습니다.");
			  if(boardType == 3) {
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  } else {
				  entryNo = service.searchEntryNo(boardNo, memberNo);
				  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+boardNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
			  }
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "댓글 등록 실패");
			  model.addAttribute("msg", "댓글 등록 실패하였습니다.");
			  if(boardType == 3) {
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  } else {
				  entryNo = service.searchEntryNo(boardNo, memberNo);
				  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+boardNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
			  }
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/deleteComment.do") 
	  public int deleteComment(Model model, int commentNo) {
		  int result = service.deleteComment(commentNo); 
		  return result; 
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/updateComment.do") 
	  public int updateComment(Model model, int commentNo, String commentContent) {
		  int result = service.updateComment(commentNo, commentContent); 
		  return result; 
	  }
	  
	  @RequestMapping(value="/reCommentInsert.do")   
	  public String reCommentInsert(Model model, String commentContent, int boardNo, String memberId, int memberNo, int commentNo, int boardType) {
		  int result = 0;
		  if(boardType == 3) {
			  result = service.reCommentInsert(commentContent, boardNo, memberId, commentNo, boardType); 
		  } else {
			  int entryNo = service.searchEntryNo(boardNo, memberNo);
			  result = service.reCommentInsert(commentContent, boardNo, memberId, commentNo, boardType, entryNo); 
		  }
		  if(result > 0) { 
			  model.addAttribute("title", "대댓글 등록 성공");
			  model.addAttribute("msg", "대댓글 등록 완료되었습니다.");
			  if(boardType == 3) {
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  } else {
				  int entryNo = service.searchEntryNo(boardNo, memberNo);
				  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+boardNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
			  }
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "대댓글 등록 실패");
			  model.addAttribute("msg", "대댓글 등록 실패하였습니다.");
			  if(boardType == 3) {
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+boardNo+"&memberNo="+memberNo);
			  } else {
				  int entryNo = service.searchEntryNo(boardNo, memberNo);
				  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+boardNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
			  }
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertDibCount.do")   
	  public String insertDibCount(Model model, int projectNo, int memberNo) {
		  int result = service.insertDibCount(projectNo, memberNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "찜 하기 성공");
			  model.addAttribute("msg", "해당 게시물을 찜했습니다!");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "찜 하기 실패");
			  model.addAttribute("msg", "찜 하기에 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteDibCount.do")   
	  public String deleteDibCount(Model model, int projectNo, int memberNo) {
		  int result = service.deleteDibCount(projectNo, memberNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "찜 취소");
			  model.addAttribute("msg", "해당 게시물에 찜한 내역을 취소했습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "찜 취소 실패");
			  model.addAttribute("msg", "찜 취소하는 것에 실패하였습니다.");
			  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/insertApplyProjectFrm.do")
		public String insertApplyProjectFrm(int memberNo, Model model, int projectNo, int writeReviewCheck) {
			ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
			if(memberNo > 0) {
				model.addAttribute("memberNo", memberNo);
				model.addAttribute("dlList", dlList);
				model.addAttribute("projectNo", projectNo);
				return "recruitCrue/applyTeam_writeForm";
			} else {
				model.addAttribute("title", "비회원 서비스 이용 불가");
				model.addAttribute("msg", "로그인 후 이용이 가능합니다.");
				model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				model.addAttribute("icon", "warning");
				return "member/swalMsg";
			}
		}
	  
	  @RequestMapping(value="/insertApplyProject.do")
		public String insertApplyProject(HttpServletRequest request, Model model, ProjectEntry pta, int memberNo, String[] chk, int projectNo) {
			ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
			
			int result = service.insertApplyProject(pta, langList, projectNo);
			if(result > 0) { 
				  model.addAttribute("title", "지원 성공");
				  model.addAttribute("msg", "성공적으로 프로젝트 지원에 성공하였습니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원 실패");
				  model.addAttribute("msg", "프로젝트 지원에 실패하였습니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		}
	  
	  @RequestMapping(value="/manageEntry.do")
		public String manageEntry(Model model, int reqPage, int viewValue, int memberNo, int projectNo) {
			
			ProjectTeamApplyPageData ptapd = service.selectAllManageEntry(reqPage, viewValue, projectNo);
			model.addAttribute("entryList", ptapd.getEntryList());
			model.addAttribute("pageNavi", ptapd.getPageNavi());
			model.addAttribute("start", ptapd.getStart());
			model.addAttribute("udLangList", ptapd.getUdLangList());
			model.addAttribute("developLangList", ptapd.getDevelopLangList());
			model.addAttribute("viewValue", viewValue);			
			model.addAttribute("availableNum", ptapd.getEntryList().get(0).getAvailableNum());
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("projectNo", projectNo);
			return "recruitCrue/manageEntry";
			
		}
	  
	  @RequestMapping(value="/selectTeamMember.do")
		public String selectMember(Model model, int entryNo, int memberNo, int projectNo) {
			int result = service.selectMember(entryNo, memberNo);
			if(result > 0) { 
				  model.addAttribute("title", "최종 선발대기 등록 성공");
				  model.addAttribute("msg", "선택하신 지원자분을 최종 선발대기인원으로 등록하였습니다.");
				  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "선발대기 등록 실패");
				  model.addAttribute("msg", "최종 선발대기인원으로 등록하는데 실패하였습니다.");
				  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		}
	  
	  @RequestMapping(value="/closeRecruitTeam.do")
	  public String closeRecruitTeam(Model model, int projectNo, int memberNo) {
		  int result = service.closeRecruitTeam(projectNo, memberNo);
			if(result > 0) { 
				  model.addAttribute("title", "모집 마감 완료");
				  model.addAttribute("msg", "모집 마감되었고 지금부터 프로젝트가 시작됩니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "모집 마감 실패");
				  model.addAttribute("msg", "모집 마감에 실패하였습니다.");
				  model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteTeamMember.do")
	  public String deleteTeamMember(Model model, int projectNo, int memberNo, int entryNo) {
		  int result = service.deleteTeamMember(entryNo);
			if(result > 0) { 
				  model.addAttribute("title", "지원자 탈락 완료");
				  model.addAttribute("msg", "해당 지원자는 탈락되었습니다. ");
				  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원자 탈락 완료");
				  model.addAttribute("msg", "지원자 탈락 과정에 오류가 발생되었습니다.");
				  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
	  }
	 
	  @RequestMapping(value="/manageFinalEntryFrm.do")
		public String manageFinalEntryFrm(Model model, int projectNo, int memberNo, int viewValue) {
		  	ProjectTeamApplyPageData ptapd = service.manageFinalEntryFrm(projectNo, viewValue);
			model.addAttribute("entryList", ptapd.getEntryList());
			model.addAttribute("udLangList", ptapd.getUdLangList());
			model.addAttribute("developLangList", ptapd.getDevelopLangList());
			model.addAttribute("availableNum", ptapd.getEntryList().get(0).getAvailableNum());
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("projectNo", projectNo);
			model.addAttribute("viewValue", viewValue);	
			return "recruitCrue/manageFinalEntry";
		}
	  
	  @RequestMapping(value="/selectFinalTeamMember.do")
	  public String selectFinalTeamMember(Model model, int projectNo, int memberNo, int entryNo, int viewValue, int pageTransValue) {
		  int result = service.insertFinalTeamMember(entryNo, projectNo, memberNo);
			if(result > 0) { 
				  model.addAttribute("title", "지원자 최종 선발");
				  model.addAttribute("msg", "해당 지원자는 프로젝트 팀원으로 최종 선발되었습니다.");
				  if(pageTransValue - 1 == 0) {
					  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  } else {
					  model.addAttribute("loc","/manageFinalEntryFrm.do?memberNo="+memberNo+"&projectNo="+projectNo+"&viewValue=1");
				  }
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원자 최종 선발 실패");
				  model.addAttribute("msg", "지원자 최종 선발 과정에 오류가 발생되었습니다.");
				  if(pageTransValue - 1 == 0) {
					  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  } else {
					  model.addAttribute("loc","/manageFinalEntryFrm.do?memberNo="+memberNo+"&projectNo="+projectNo+"&viewValue=1");
				  }
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/returnTeamMember.do")
	  public String returnTeamMember(Model model, int projectNo, int memberNo, int entryNo, int viewValue, int pageTransValue) {
		  int result = service.returnTeamMember(entryNo);
			if(result > 0) { 
				  model.addAttribute("title", "지원 대기로 전환");
				  model.addAttribute("msg", "해당 지원자는 지원자 관리에서 다시 확인해볼 수 있습니다.");
				  if(pageTransValue - 1 == 0) {
					  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  } else {
					  model.addAttribute("loc","/manageFinalEntryFrm.do?memberNo="+memberNo+"&projectNo="+projectNo+"&viewValue=1");
				  }
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원자 전환 실패");
				  model.addAttribute("msg", "지원자 전환 과정에서 오류가 발생되었습니다.");
				  if(pageTransValue - 1 == 0) {
					  model.addAttribute("loc","/manageEntry.do?memberNo="+memberNo+"&projectNo="+projectNo+"&reqPage=1&viewValue=1");
				  } else {
					  model.addAttribute("loc","/manageFinalEntryFrm.do?memberNo="+memberNo+"&projectNo="+projectNo+"&viewValue=1");
				  }
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/selectOneApplicant.do")
		public String selectOneApplicant(Model model, int projectNo, int memberNo, int entryNo) {
			ProjectTeamApplicantViewData ptavd = service.selectOneApplicant(entryNo);
			model.addAttribute("commentList", ptavd.getCommentList());
			model.addAttribute("pe", ptavd.getPe());
			model.addAttribute("udlList", ptavd.getUdlList());
			model.addAttribute("entryNo", entryNo);
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("projectNo", projectNo);
			return "recruitCrue/applicant_detail";
		}
	  
	  @RequestMapping(value="/cancelApplyProject.do")
		public String cancelApplyProject(Model model, int entryNo, int memberNo, int projectNo, int applicantNo) {
			int result = service.cancelApplyProject(entryNo, applicantNo, projectNo);
			if(result > 0) { 
				  model.addAttribute("title", "지원 취소");
				  model.addAttribute("msg", "프로젝트 지원이 취소되었습니다.");
				  model.addAttribute("loc","/recruitTeamMember_mainPage.do?reqPage=1");
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "지원 취소 실패");
				  model.addAttribute("msg", "시스템 문제로 인해 지원 취소과정에 오류가 발생하였습니다. ");
				  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+projectNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		}
	  
	  @RequestMapping(value="/updateProjectApplyFrm.do")
		public String updateProjectApplyFrm(Model model, int projectNo, int memberNo, int entryNo) {
			ProjectTeamApplicantViewData ptavd = service.selectOneApplicant(entryNo);
			ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
			model.addAttribute("dlList", dlList);
			model.addAttribute("commentList", ptavd.getCommentList());
			model.addAttribute("pe", ptavd.getPe());
			model.addAttribute("udlList", ptavd.getUdlList());
			model.addAttribute("entryNo", entryNo);
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("projectNo", projectNo);
			return "recruitCrue/applyTeamUpdateForm";
		}
	  
	  @RequestMapping(value="/updateApplyForm.do") 
	  public String updateApplyForm(HttpServletRequest request, Model model, ProjectEntry pe, String[] chk, int projectNo, int entryNo, int sessionMemberNo) { 
		  ArrayList<String> langList = new ArrayList<String>(Arrays.asList(chk));
		  int result = service.updateApplyForm(pe, langList, projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "수정 성공!");
			  model.addAttribute("msg", "수정 완료되었습니다.");
			  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+projectNo+"&memberNo="+sessionMemberNo+"&entryNo="+entryNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "수정 실패");
			  model.addAttribute("msg", "수정 실패하였습니다.");
			  model.addAttribute("loc","/selectOneApplicant.do?projectNo="+projectNo+"&memberNo="+sessionMemberNo+"&entryNo="+entryNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/enterMyProject.do") 
	  public String enterMyProject(Model model, int projectNo, int memberNo ) {
		  	ProjectTeam pt = service.projectInfo(projectNo, memberNo);
		  	ArrayList<ProjectTeamMember> memberList = service.memberInfoList(projectNo, memberNo);
		  	ProjectTask recentTask = service.recentTask(projectNo);
		  	ProjectTask toDoTask = service.toDoTask(projectNo);
		  	ArrayList<projectDevLanguage> pdLangList = service.selectAllprojectLangList();
		  	ArrayList<DevelopLanguage> dlList = service.selectAllDevelopLang();
		  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
		  	
		  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
		  	for(int i = 0; i < allPtk.size(); i++) {
		  		int compare = today.compareTo(allPtk.get(i).getStartDate());
		  		if(compare <= 0 && allPtk.get(i).getProcessSort() == 1) {
		  			int updateResult = service.taskDateUpdate(allPtk.get(i));
		  			if(updateResult < 0) {
		  				model.addAttribute("title", "과업 업데이트 실패");
		  			  model.addAttribute("loc","enterMyProject.do?projectNo="+projectNo+"&memberNo="+memberNo);
		  			  model.addAttribute("icon", "warning");
		  			  return "member/swalMsg";
		  			}
		  		}
		  	}
		  	
		  	model.addAttribute("pt", pt);
			model.addAttribute("memberList", memberList);
			model.addAttribute("recentTask", recentTask);
			model.addAttribute("toDoTask", toDoTask);
			model.addAttribute("pdLangList", pdLangList);
			model.addAttribute("dlList", dlList);
			model.addAttribute("scList", scList);
			return "recruitCrue/projectManageOutline";
	  }
	  
	  @RequestMapping(value="/addShortcut.do")
	  public String addShortcut(Model model, String shortcutAddr, String shortcutName, Integer projectNo, int memberNo ) {
		  int result = service.addShortcut(shortcutAddr, shortcutName, projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "바로가기 추가 성공!");
			  model.addAttribute("msg", "등록하신 링크로 바로가기가 추가되었습니다.");
			  model.addAttribute("loc","enterMyProject.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "바로가기 추가 실패");
			  model.addAttribute("msg", "시스템 오류로 추가 실패하였습니다.");
			  model.addAttribute("loc","enterMyProject.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/deleteShortcut.do")
	  public String deleteShortcut(Model model, int shortcutNo, Integer projectNo, int memberNo ) {
		  int result = service.deleteShortcut(shortcutNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "바로가기 삭제 성공!");
			  model.addAttribute("msg", "등록하신 링크로 바로가기가 삭제되었습니다.");
			  model.addAttribute("loc","enterMyProject.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "바로가기 삭제 실패");
			  model.addAttribute("msg", "시스템 오류로 삭제 실패하였습니다.");
			  model.addAttribute("loc","enterMyProject.do?projectNo="+projectNo+"&memberNo="+memberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
	  @RequestMapping(value="/endProject.do")
	  public String endProject(Model model, Integer[] memberNo, Integer[] teamMemberNo, Integer[] reviewPoint, String[] reviewContent, int backMemberNo, int backProjectNo, String sessionMemberId, String projectReader) {
		  int result = 0;
		  ArrayList<ProjectReview> reviewlist = new ArrayList<ProjectReview>();
		  for(int i=0;i<teamMemberNo.length;i++) {
			  ProjectReview pr = new ProjectReview();
			  pr.setProjectNo(backProjectNo);
			  pr.setReviewContent(reviewContent[i]);
			  pr.setReviewPoint(reviewPoint[i]);
			  pr.setTeamMemberNo(teamMemberNo[i]);
			  pr.setReviewWriter(backMemberNo);
			  pr.setMemberNo(memberNo[i]);
			  reviewlist.add(pr);
		  }
		  if(sessionMemberId.equals(projectReader)) {
			  result = service.endProject(reviewlist, backProjectNo, backMemberNo);
			  if(result > 0) { 
				  model.addAttribute("title", "프로젝트 종료");
				  model.addAttribute("msg", "그 동안 진심으로 고생많으셨습니다..!");
				  model.addAttribute("loc","/enterMyProject.do?projectNo="+backProjectNo+"&memberNo="+backMemberNo);
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "프로젝트 종료 실패");
				  model.addAttribute("msg", "시스템 오류로 종료 실패하였습니다.");
				  model.addAttribute("loc","/enterMyProject.do?projectNo="+backProjectNo+"&memberNo="+backMemberNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		  } else {
			  result = service.insertReview(reviewlist, backProjectNo, backMemberNo);
			  if(result > 0) { 
				  model.addAttribute("title", "리뷰 등록 성공!");
				  model.addAttribute("msg", "그 동안 진심으로 고생많으셨습니다..!");
				  model.addAttribute("loc","/enterMyProject.do?projectNo="+backProjectNo+"&memberNo="+backMemberNo);
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "리뷰 등록 실패");
				  model.addAttribute("msg", "시스템 오류로 종료 실패하였습니다.");
				  model.addAttribute("loc","/enterMyProject.do?projectNo="+backProjectNo+"&memberNo="+backMemberNo);
				  model.addAttribute("icon", "warning");
			  }
			  return "member/swalMsg"; 
		  }
		   
	  }
	
	  @RequestMapping(value="/updateProjectOutline.do")
	  public String updateProjectOutline(Model model, String[] chk, ProjectTeam pt, String crueRoll, int sessionMemberNo, int projectNo) {
		  ArrayList<String> langList = new ArrayList<String>();
		  if(chk != null) {
			  langList = new ArrayList<String>(Arrays.asList(chk));
		  }
		  int result = service.updateProjectOutline(langList, pt, crueRoll, sessionMemberNo, projectNo); 
		  if(result > 0) { 
			  model.addAttribute("title", "프로젝트 수정 성공!");
			  model.addAttribute("msg", "변경하신 프로젝트 내용이 반영되었습니다.");
			  model.addAttribute("loc","/enterMyProject.do?projectNo="+projectNo+"&memberNo="+sessionMemberNo);
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "프로젝트 수정 실패");
			  model.addAttribute("msg", "시스템 오류로 수정 실패하였습니다.");
			  model.addAttribute("loc","/enterMyProject.do?projectNo="+projectNo+"&memberNo="+sessionMemberNo);
			  model.addAttribute("icon", "warning");
		  }
		  return "member/swalMsg"; 
	  }
	  
		/*
		 * @RequestMapping(value="/enterProjectTask.do") public String
		 * enterProjectTask(Model model, int projectNo) { ArrayList<ProjectTask> ptk =
		 * service.projectTaskList(projectNo); model.addAttribute("ptk", ptk);
		 * model.addAttribute("projectNo", projectNo); return
		 * "recruitCrue/projectManageTask"; }
		 */
	  
	  @RequestMapping(value="/enterProjectTaskM.do")
		public String enterProjectTaskM(Model model, int projectNo, int reqPage) {
		  	ProjectTaskViewData ptvd = service.enterProjectTaskM(projectNo, reqPage);
		  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
		  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
		  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
		  	
		  	model.addAttribute("ptk", ptvd.getTasklist());
		  	model.addAttribute("ptkk", ptvd.getTasklist());
			model.addAttribute("projectNo", projectNo);
			model.addAttribute("pageNavi", ptvd.getPageNavi());
			model.addAttribute("start", ptvd.getStart());
			model.addAttribute("ptm", ptvd.getPtmList());
			model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
			model.addAttribute("scList", scList);
			model.addAttribute("allPtk", allPtk);
			model.addAttribute("allPtkk", allPtk);
			model.addAttribute("tscList", tscList);
			return "recruitCrue/projectManageTaskM";
		}
	  
	  @RequestMapping(value="/addIssue.do")
	  public String addIssue(Model model, int projectNo, int memberNo, int taskType, String issueTitle, String taskStartDate) {
		   int compare = today.compareTo(taskStartDate);
		   if(compare > 0) {
			   	model.addAttribute("title", "이슈 등록 실패");
				model.addAttribute("msg", "시작일은 오늘날짜 이전으로 설정할 수 없습니다. ");
				model.addAttribute("icon", "warning");
				if(taskType == 1) {
					  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
			  } else if(taskType == 2) {
					  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
			  } else if(taskType == 3) {
					  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
			  }
		   } else if (compare == 0) {
			   int result = service.addIssueToday(projectNo, memberNo, taskType, issueTitle, taskStartDate); 
			     if(result > 0) { 
					  model.addAttribute("title", "이슈 등록 성공!");
					  model.addAttribute("msg", "이슈가 등록 되었습니다.");
					  model.addAttribute("icon", "success");
				  } else {
					  model.addAttribute("title", "이슈 등록 실패");
					  model.addAttribute("msg", "시스템 오류로 등록 실패하였습니다.");
					  model.addAttribute("icon", "warning");
				  }
				  if(taskType == 1) {
						  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
				  } else if(taskType == 2) {
						  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
				  } else if(taskType == 3) {
						  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
				  }
		   } else {
			   int result = service.addIssue(projectNo, memberNo, taskType, issueTitle, taskStartDate); 
			  if(result > 0) { 
				  model.addAttribute("title", "이슈 등록 성공!");
				  model.addAttribute("msg", "이슈가 등록 되었습니다.");
				  model.addAttribute("icon", "success");
			  } else {
				  model.addAttribute("title", "이슈 등록 실패");
				  model.addAttribute("msg", "시스템 오류로 등록 실패하였습니다.");
				  model.addAttribute("icon", "warning");
			  }
			  if(taskType == 1) {
				  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
			  } else if(taskType == 2) {
				  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
			  } else if(taskType == 3) {
				  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
			  } 
		   }
		   return "member/swalMsg"; 
		 }
	  
	@RequestMapping(value="/updateIssue.do")
	  public String updateIssue(Model model, String taskNo, int projectNo,int taskType, String modalcontent, String selectCharUser, int selectPriority, int selectProcessSort) {
		int result = service.updateIssue(taskNo, projectNo, taskType, modalcontent, selectCharUser, selectPriority, selectProcessSort);
		  if(result > 0) { 
			  model.addAttribute("title", "프로젝트 변경 성공!");
			  model.addAttribute("msg", "변경하신 프로젝트 내용이 반영되었습니다.");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "프로젝트 변경 실패");
			  model.addAttribute("msg", "시스템 오류로 수정 실패하였습니다.");
			  model.addAttribute("icon", "warning");
		  }
		  if(taskType == 1) {
			  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 2) {
			  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 3) {
			  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
		  } else {
			  model.addAttribute("loc","/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage=1");
		  }
		  return "member/swalMsg"; 
	  }
	
	@ResponseBody
	@RequestMapping(value="/connectIssue.do")
	  public String connectIssue(Model model, String taskNo, String connectIssue) {
		int result = service.connectIssue(taskNo, connectIssue);
		String realResult = "-1";
		if(result > 0) {
			realResult = taskNo;
		}
		  return realResult; 
	}
	
	@RequestMapping(value="/deleteConnectIssue.do")
	  public String deleteConnectIssue(Model model, String taskNo, int projectNo,int taskType) {
		int result = service.deleteConnectIssue(taskNo);
		  if(result > 0) { 
			  model.addAttribute("title", "이슈 삭제");
			  model.addAttribute("msg", "해당 링크된 이슈는 삭제되었습니다.");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "이슈 삭제 실패");
			  model.addAttribute("msg", "시스템 오류로 삭제 실패하였습니다.");
			  model.addAttribute("icon", "warning");
		  }
		  if(taskType == 1) {
			  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 2) {
			  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 3) {
			  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
		  } else {
			  model.addAttribute("loc","/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage=1");
		  }
		  return "member/swalMsg"; 
	  }
	
	@RequestMapping(value="/connectLink.do")
	  public String connectLink(Model model, String taskNo, int projectNo, int taskType, String shortcutName, String shortcutAddr) {
		int result = service.connectLink(taskNo, shortcutName, shortcutAddr, projectNo);
		  if(result > 0) { 
			  model.addAttribute("title", "링크 추가");
			  model.addAttribute("msg", "링크가 추가 되었습니다.");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "링크 등록 실패");
			  model.addAttribute("msg", "링크 추가 실패하였습니다.");
			  model.addAttribute("icon", "warning");
		  }
		  if(taskType == 1) {
			  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 2) {
			  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 3) {
			  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
		  } else {
			  model.addAttribute("loc","/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage=1");
		  }
		  return "member/swalMsg"; 
	  }
	
	@RequestMapping(value="/deleteConnectLink.do")
	  public String deleteConnectLink(Model model, int taskShortcutNo, int projectNo, int taskType) {
		int result = service.deleteConnectLink(taskShortcutNo);
		  if(result > 0) { 
			  model.addAttribute("title", "링크 삭제");
			  model.addAttribute("msg", "해당 링크된 링크는 삭제되었습니다.");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "링크 삭제 실패");
			  model.addAttribute("msg", "시스템 오류로 삭제 실패하였습니다.");
			  model.addAttribute("icon", "warning");
		  }
		  if(taskType == 1) {
			  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 2) {
			  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 3) {
			  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
		  } else {
			  model.addAttribute("loc","/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage=1");
		  }
		  return "member/swalMsg"; 
	  }
	
	@RequestMapping(value="/deleteTask.do")
	  public String deleteTask(Model model, String taskNo, int projectNo, int taskType) {
		int result = service.deleteTask(taskNo);
		  if(result > 0) { 
			  model.addAttribute("title", "과업 삭제");
			  model.addAttribute("msg", "해당 과업은 삭제되었습니다.");
			  model.addAttribute("icon", "success");
		  } else {
			  model.addAttribute("title", "과업 삭제 실패");
			  model.addAttribute("msg", "시스템 오류로 삭제 실패하였습니다.");
			  model.addAttribute("icon", "warning");
		  }
		  if(taskType == 1) {
			  model.addAttribute("loc","/enterProjectTaskM.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 2) {
			  model.addAttribute("loc","/enterProjectTaskT.do?projectNo="+projectNo+"&reqPage=1");
		  } else if(taskType == 3) {
			  model.addAttribute("loc","/enterProjectTaskB.do?projectNo="+projectNo+"&reqPage=1");
		  } else {
			  model.addAttribute("loc","/enterProjectTaskH.do?projectNo="+projectNo+"&reqPage=1");
		  }
		  return "member/swalMsg"; 
	  }
	
	@RequestMapping(value="/enterTaskMSelect.do")
	public String enterTaskMSelect(Model model, int reqPage, int viewValue, int checkValue, int projectNo, int teamMemberNo) {
		
		ProjectTaskViewData ptvd = service.enterProjectTaskSelectM(projectNo, reqPage, viewValue, checkValue, teamMemberNo);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("tscList", tscList);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("viewValue", viewValue);
		model.addAttribute("checkValue", checkValue);
		return "recruitCrue/projectManageTaskM";
	}
	
	@RequestMapping(value="/enterProjectTaskT.do")
	public String enterProjectTaskT(Model model, int projectNo, int reqPage) {
	  	ProjectTaskViewData ptvd = service.enterProjectTaskT(projectNo, reqPage);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("tscList", tscList);
		return "recruitCrue/projectManageTaskT";
	}
	
	@RequestMapping(value="/enterTaskTSelect.do")
	public String enterTaskTSelect(Model model, int reqPage, int viewValue, int checkValue, int projectNo, int teamMemberNo) {
		
		ProjectTaskViewData ptvd = service.enterProjectTaskSelectT(projectNo, reqPage, viewValue, checkValue, teamMemberNo);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("tscList", tscList);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("viewValue", viewValue);
		model.addAttribute("checkValue", checkValue);
		return "recruitCrue/projectManageTaskT";
	}
	
	@RequestMapping(value="/enterProjectTaskB.do")
	public String enterProjectTaskB(Model model, int projectNo, int reqPage) {
	  	ProjectTaskViewData ptvd = service.enterProjectTaskB(projectNo, reqPage);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("tscList", tscList);
		return "recruitCrue/projectManageTaskB";
	}
	
	@RequestMapping(value="/enterTaskBSelect.do")
	public String enterTaskBSelect(Model model, int reqPage, int viewValue, int checkValue, int projectNo, int teamMemberNo) {
		
		ProjectTaskViewData ptvd = service.enterProjectTaskSelectB(projectNo, reqPage, viewValue, checkValue, teamMemberNo);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("tscList", tscList);
		model.addAttribute("viewValue", viewValue);
		model.addAttribute("checkValue", checkValue);
		return "recruitCrue/projectManageTaskB";
	}
	
	@RequestMapping(value="/enterProjectTaskH.do")
	public String enterProjectTaskH(Model model, int projectNo, int reqPage) {
	  	ProjectTaskViewData ptvd = service.enterProjectTaskH(projectNo, reqPage);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("tscList", tscList);
		return "recruitCrue/projectManageTaskH";
	}
	
	@RequestMapping(value="/enterTaskHSelect.do")
	public String enterTaskHSelect(Model model, int reqPage, int checkValue, int projectNo, int teamMemberNo) {
		
		ProjectTaskViewData ptvd = service.enterProjectTaskSelectH(projectNo, reqPage, checkValue, teamMemberNo);
	  	ArrayList<ProjectTask> allPtk = service.projectTaskList(projectNo);
	  	ArrayList<Shortcuts> scList = service.shortcutList(projectNo);
	  	ArrayList<TaskShortcuts> tscList = service.taskShortcutList(projectNo);
	  	
	  	model.addAttribute("ptk", ptvd.getTasklist());
	  	model.addAttribute("ptkk", ptvd.getTasklist());
		model.addAttribute("projectNo", projectNo);
		model.addAttribute("pageNavi", ptvd.getPageNavi());
		model.addAttribute("start", ptvd.getStart());
		model.addAttribute("ptm", ptvd.getPtmList());
		model.addAttribute("ptmGet0", ptvd.getPtmList().get(0));
		model.addAttribute("scList", scList);
		model.addAttribute("allPtkk", allPtk);
		model.addAttribute("allPtk", allPtk);
		model.addAttribute("tscList", tscList);
		model.addAttribute("checkValue", checkValue);
		return "recruitCrue/projectManageTaskH";
	}
	
	//댓글신고
		@RequestMapping(value="/reportProjectNoticeComment.do")
		public String reportComment(Report rp, Model model, int projectNo, int memberNo, int boardType, int applicantMemberNo) {
			int result = service.reportProjectNoticeComment(rp);
			if(result>0) {
				model.addAttribute("title","댓글 신고 성공");
				model.addAttribute("msg","해당 댓글을 신고하였습니다.");
				model.addAttribute("icon","success");
			
			}else {
				model.addAttribute("title","댓글 신고 실패");
				model.addAttribute("msg","해당 댓글 신고에 실패하였습니다. 관리자에게 문의해주세요.");
				model.addAttribute("icon","error");
			}
			if(boardType == 1) {
				model.addAttribute("loc","/selectOneNotice.do?projectNo="+projectNo+"&memberNo="+memberNo);
			} else {
				int entryNo = service.searchEntryNo(projectNo, applicantMemberNo);
				model.addAttribute("loc","/selectOneApplicant.do?projectNo="+projectNo+"&memberNo="+memberNo+"&entryNo="+entryNo);
			}
			return "member/swalMsg";
			
		}
  
	  
}
