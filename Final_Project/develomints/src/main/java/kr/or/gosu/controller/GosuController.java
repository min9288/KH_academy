package kr.or.gosu.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.gosu.service.GosuService;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuListPageData;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuNoticeListPageData;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuRequestCostListPageData;
import kr.or.gosu.vo.GosuRequestCount;
import kr.or.gosu.vo.GosuRequestListPageData;
import kr.or.gosu.vo.GosuRequestProject;
import kr.or.gosu.vo.GosuRequestProjectSub;
import kr.or.gosu.vo.GosuRequestReview;
import kr.or.gosu.vo.GosuReview;
import kr.or.gosu.vo.GosuTalk;
import kr.or.member.model.vo.Member;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class GosuController {

	@Autowired
	private GosuService service;

	@RequestMapping(value = "/gosuMain.do")
	public String gosuMain(Model model, @SessionAttribute(required = false) Member m) {

		ArrayList<Gosu> g = service.selectGosuList();
		ArrayList<GosuNotice> gNoticeList = service.selectGosuNoticeList2();
		ArrayList<Gosu> newGosu = service.selectNewGosuList();
		int gosuCount = service.selectGosuCount();
		if (m != null) {
			ArrayList<GosuFeedback> gf = service.selectGosuFeedbackList(m.getMemberId());
			ArrayList<GosuFeedback> gf2 = service.selectGosuFeedbackList2(m.getMemberId());
			if (m.getMemberType() == 1) {
				ArrayList<GosuRequestProjectSub> grpsList = service.selectGosuRequestProjectSubList(m.getMemberNo());
				int costCount = service.selectGosuRequestCostListCount(m.getMemberId());
				model.addAttribute("grpsList", grpsList);
				model.addAttribute("costCount",costCount);
			} else if (m.getMemberType() == 2) {
				ArrayList<GosuRequestProjectSub> grpsList = service.selectGosuRequestProjectSubList2(m.getMemberNo());
				int requestCount = service.selectGosuRequestListCount(m.getMemberNo());
				model.addAttribute("grpsList", grpsList);
				model.addAttribute("requestCount",requestCount);
			}
			model.addAttribute("gosuTalkList", gf);
			model.addAttribute("gosuTalkList2", gf2);
		}
		model.addAttribute("gList", g);
		model.addAttribute("gNoticeList", gNoticeList);
		model.addAttribute("newGosuList", newGosu);
		model.addAttribute("gosuCount", gosuCount);

		return "gosu/gosuMain";
	}

	@RequestMapping(value = "/gosuList.do")
	public String gosuList(int reqPage, Model model) {
		GosuListPageData glpd = service.selectGosuList(reqPage);
		model.addAttribute("gList", glpd.getList());
		model.addAttribute("gList2", glpd.getList2());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());
		return "gosu/gosuList";
	}

	@RequestMapping(value = "/gosuContent.do")
	public String gosuContent(int gNo, Model model) {
		Gosu gosu = service.selectGosuOne(gNo);
		ArrayList<GosuProject> gprList = service.selectGosuProject(gNo);
		ArrayList<GosuPhoto> gptList = service.selectGosuPhoto(gNo);
		ArrayList<GosuReview> grList = service.selectGosuReviewList(gosu.getGgsouNo());
		if (!grList.isEmpty()) {

			GosuReview grAVG = service.selectReviewCountAVG(gosu.getGgsouNo());
			model.addAttribute("grAVG", grAVG);

		}
		ArrayList<GosuRequestReview> grrList = service.selectGosuRequestReviewList(gosu.getGgsouNo());
		if (!grrList.isEmpty()) {
			int grrCount = service.selectGrrCount(gosu.getGgsouNo());
			model.addAttribute("grrCount", grrCount);

		}
		ArrayList<GosuNotice> gnList = service.selectGosuNoticeListSelf(gosu.getGosuId());		
		model.addAttribute("gosu", gosu);
		model.addAttribute("gprojectList", gprList);
		model.addAttribute("gphotoList", gptList);
		model.addAttribute("greviewList", grList);
		model.addAttribute("grrList", grrList);
		model.addAttribute("gnList", gnList);
		return "gosu/gosuContent";
	}

	@ResponseBody
	@RequestMapping(value = "/gosuSummerImage.do")
	public String boardSummer(MultipartFile file, HttpServletRequest request) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuSn/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.indexOf("."));
		String extension = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extension;
			} else {
				filepath = onlyFilename + "_" + count + extension;
			}
			File checkFile = new File(savePath + filepath);
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/resources/upload/gosu/gosuSn/" + filepath;
	}

	@RequestMapping(value = "/gosuWriteFrm.do")
	public String gosuWriteFrm() {
		return "gosu/gosuWriteFrm";
	}

	@RequestMapping(value = "/gosuWrite.do")
	public String gosuWrite(Gosu g, MultipartFile[] photoFilepath, String[] gprojectContent, String[] gprojectTitle,
			String[] gprojectFilepath, HttpServletRequest request, Model model) {

		ArrayList<GosuPhoto> photoList = new ArrayList<GosuPhoto>();
		ArrayList<GosuProject> projectList = new ArrayList<GosuProject>();
		for (int i = 0; i < gprojectContent.length; i++) {
			GosuProject gp = new GosuProject();
			gp.setGprojectContent(gprojectContent[i]);
			gp.setGprojectTitle(gprojectTitle[i]);
			gp.setGprojectFilepath(gprojectFilepath[i]);
			projectList.add(gp);
		}
		if (photoFilepath[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuPhoto/");
			for (MultipartFile file : photoFilepath) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;// test.txt
					} else {
						filepath = onlyFilename + "_" + count + extention;// test_2.txt,test_3.txt
					}
					File checkFile = new File(savePath + filepath); // java.io.File
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				GosuPhoto gphoto = new GosuPhoto();
				gphoto.setPhotoFilepath("/resources/upload/gosu/gosuPhoto/" + filepath);

				photoList.add(gphoto);

			}
		}
		int result = service.insertGosu(g, photoList, projectList);
		if (result == -1 || result != projectList.size()) {
			model.addAttribute("title", "등록 실패");
			model.addAttribute("msg", "입력 정보를 확인해주세요.");
			model.addAttribute("icon", "error");
		} else {
			model.addAttribute("title", "등록 성공");
			model.addAttribute("msg", "");
			model.addAttribute("icon", "success");
		}

		model.addAttribute("loc", "/gosuMain.do");
		return "member/swalMsg";
	}

	@ResponseBody
	@RequestMapping(value = "/gpAjax.do")
	public GosuProject gpAjax(int pNo) {
		GosuProject gpr = service.selectGProject(pNo);
		return gpr;
	}

	@ResponseBody
	@RequestMapping(value = "/gProjectAjax.do", produces = "application/json;charset=utf-8")
	public Object gProjectAjax(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
			String gprojectTitle, String gprojectContent) {
		// Iterator<String> itr = req.getFileNames();
		// MultipartFile files = req.getFile(itr.next());
		// 파일이 여러개일경우 위와같이 사용 할 수 있다
		// 단일 파일일 경우 html의 name에 설정된 이름으로 파일을 가져올 수 있다.

		String path = request.getSession().getServletContext().getRealPath("/resources/upload/gosuProject/");

		MultipartFile file = req.getFile("gprojectFilepath");
		String filename = file.getOriginalFilename();

		String onlyFilename = filename.substring(0, filename.indexOf("."));// test
		String extention = filename.substring(filename.indexOf("."));// .txt
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extention;// test.txt
			} else {
				filepath = onlyFilename + "_" + count + extention;// test_2.txt,test_3.txt
			}
			File checkFile = new File(path + filepath); // java.io.File
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {

			FileOutputStream fos = new FileOutputStream(new File(path + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		GosuProject g = new GosuProject();
		g.setGprojectContent(gprojectTitle);
		g.setGprojectTitle(gprojectContent);
		g.setGprojectFilepath("/resources/upload/gosuProject/" + filepath);
		Gson gson = new Gson();
		return gson.toJson(g);
	}

	@RequestMapping(value = "/gosuSituation.do")
	public String gosuSituation(@SessionAttribute Member m, Model model) {
		ArrayList<GosuFeedback> gf = service.selectGosuFeedbackList(m.getMemberId());
		ArrayList<GosuFeedback> gf2 = service.selectGosuFeedbackList2(m.getMemberId());
		if (m.getMemberType() == 1) {
			ArrayList<GosuRequestProjectSub> grpsList = service.selectGosuRequestProjectSubList(m.getMemberNo());
			model.addAttribute("grpsList", grpsList);
	
		} else if (m.getMemberType() == 2) {
			ArrayList<GosuRequestProjectSub> grpsList = service.selectGosuRequestProjectSubList2(m.getMemberNo());
			model.addAttribute("grpsList", grpsList);
			
			int ggosuNo = service.selectMyGgosuNo(m.getMemberNo());
			model.addAttribute("ggosuNoEmpty",ggosuNo);
			ArrayList<GosuReview> grList2 = service.selectGosuReviewList(ggosuNo);
			if (!grList2.isEmpty()) {
				GosuReview grAVG = service.selectReviewCountAVG(ggosuNo);
				model.addAttribute("grAVG", grAVG);
				model.addAttribute("greviewList",grList2);
			}
			ArrayList<GosuRequestReview> grrList2 = service.selectGosuRequestReviewList2(m.getMemberNo());
			if (!grrList2.isEmpty()) {
				int grrCount = service.selectGrrCount2(m.getMemberNo());
				model.addAttribute("grrCount", grrCount);
				model.addAttribute("grrList2",grrList2);
			}
		}
		ArrayList<GosuReview> grList = service.selectMemberReviewList(m.getMemberId());
		ArrayList<GosuRequestReview> grrList = service.selectMemberRequestReviewList(m.getMemberId());
		
		model.addAttribute("gosuTalkList", gf);
		model.addAttribute("gosuTalkList2", gf2);
		model.addAttribute("grList", grList);
		model.addAttribute("grrList", grrList);
		return "gosu/gosuSituation";
	}

	@RequestMapping(value = "/gosuFeedback.do")
	public String gosuFeedback(int ggNo, Model model) {
		Gosu gosu = service.selectGosuOne(ggNo);
		model.addAttribute("gosu", gosu);
		return "gosu/gosuFeedback";
	}
	@ResponseBody
	@RequestMapping(value = "/gosuFeedbackInsert.do")
	public int gosuFeedbackInsert(int ggsouNo, String gosuFeedbackTitle, String gosuFeedbackContent, String memberId,
			Model model) {
		GosuFeedback gf = new GosuFeedback();
		gf.setFeedbackContent(gosuFeedbackContent);
		gf.setMemberId(memberId);
		gf.setFeedbackTitle(gosuFeedbackTitle);
		gf.setGgosuNo(ggsouNo);
		int result = service.insertGosuFeedback(gf);

		return gf.getFeedbackNo();
	}

	@ResponseBody
	@RequestMapping(value = "/talkStopAjax.do")
	public int talkStopAjax(int feedbackNo, Model model) {
		int result = service.talkStop(feedbackNo);
		return result;
	}

	@RequestMapping(value = "/gosuTalk.do")
	public String gosuTalk(int fbNo, Model model) {
		GosuFeedback gf = service.selectFeedbackOne(fbNo);
		ArrayList<GosuTalk> gtList = service.selectGosuTalk(fbNo);
		GosuReview gr = new GosuReview();
		gr.setGgosuNo(gf.getGgosuNo());
		gr.setWriter(gf.getMemberId());
		GosuReview greview = service.selectGosuReviewOne(gr);
		model.addAttribute("gfOne", gf);
		model.addAttribute("gtList", gtList);
		model.addAttribute("greview", greview);
		return "gosu/gosuTalk";
	}

	@ResponseBody
	@RequestMapping(value = "/reviewSendAjax.do")
	public int reviewSendAjax(int reviewNum, int ggosuNo, String writer, String reviewContent, Model model) {
		GosuReview gr = new GosuReview();
		gr.setGgosuNo(ggosuNo);
		gr.setReviewContent(reviewContent);
		gr.setReviewNum(reviewNum);
		gr.setWriter(writer);
		int result = service.insetReviewOne(gr);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/talkBtnAjax.do")
	public int gosuTalkInsert(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
			String talkContent, String writer, @RequestParam(required = false, defaultValue = "0") int feedbackNo,
			Model model) {
		GosuTalk gt = new GosuTalk();
		gt.setFeedbackNo(feedbackNo);
		gt.setTalkContent(talkContent);
		gt.setWriter(writer);
		MultipartFile files = req.getFile("talkFile");
		if (files == null) {

		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuTalk/");
			String filename = files.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count = 0;
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
				gt.setFilepath("/resources/upload/gosu/gosuTalk/" + filepath);
				gt.setFilename(filename);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int result = service.insertGosuTalk(gt);

		return result;
	}

	@RequestMapping(value = "/gosuNoticeList.do")
	public String gosuNoticeLsit(int reqPage, Model model) {
		GosuNoticeListPageData glpd = service.selectGosuNoticeList(reqPage);
		model.addAttribute("gNoticeList", glpd.getList());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());

		return "gosu/gosuNoticeList";
	}

	@RequestMapping(value = "/gosuNoticeWriteFrm.do")
	public String gosuNoticeWriteFrm() {
		return "gosu/gosuNoticeWriteFrm";
	}

	@RequestMapping(value = "/gosuNoticeWrite.do")
	public String gosuNoticeWrite(MultipartFile files, HttpServletRequest request, GosuNotice gNotice, Model model) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuNotice/");
		String filename = files.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.indexOf("."));
		String extention = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extention;
			} else {
				filepath = onlyFilename + "_" + count + extention;
			}
			File checkFile = new File(savePath + filepath);
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}

		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = files.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		gNotice.setGnoticePhoto("/resources/upload/gosu/gosuNotice/" + filepath);
		int result = service.insertGosuNotice(gNotice);

		if (result == -1) {
			model.addAttribute("title", "등록 실패");
			model.addAttribute("msg", "입력하신 내용을 확인해주세요.");
			model.addAttribute("icon", "error");
		} else {
			model.addAttribute("title", "등록 성공");
			model.addAttribute("msg", "");
			model.addAttribute("icon", "success");
		}
		model.addAttribute("loc", "/gosuNoticeList.do?reqPage=1");

		return "member/swalMsg";
	}

	@RequestMapping(value = "/gosuRequest.do")
	public String gosuRequest(Model model) {
		GosuRequestCount grc = service.selectGosuCountRequestCount();
		model.addAttribute("countGosu", grc.getCountGosu());
		model.addAttribute("countRequest", grc.getCountRequest());
		return "gosu/gosuRequest";
	}

	@RequestMapping(value = "/gosuRequestdo.do")
	public String gosuRequestDo(GosuRequest gr, Model model, @SessionAttribute(required = false) Member m) {
		int result = service.insertGosuRequest(gr);

		if (result > 0) {
			model.addAttribute("title", "성공");
			model.addAttribute("msg", "");
			model.addAttribute("icon", "success");

		} else {

			model.addAttribute("title", "실패");
			model.addAttribute("icon", "error");
			model.addAttribute("msg", "관리자에게 문의해주세요");
		}
		model.addAttribute("loc", "/gosuRequestCostList.do?reqPage=1");
		return "member/swalMsg";

	}

	@RequestMapping(value = "/gosuRequestList.do")
	public String gosuRequestList(int reqPage, Model model) {
		GosuRequestListPageData glpd = service.selectMemberRequestList(reqPage);
		model.addAttribute("memberRequestList", glpd.getList());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());
		return "gosu/gosuRequestList";
	}

	@RequestMapping(value = "/gosuRequestContent.do")
	public String gosuRequestContent(int mrn, @SessionAttribute(required = false) Member m, Model model) {
		GosuRequest gr = service.selectGosuRequestContent(mrn);

		GosuRequestCost grc = new GosuRequestCost();
		grc.setRequestNo(gr.getRequestNo());
		grc.setGosuNo(m.getMemberNo());
		GosuRequestCost grc2 = service.selectRequestNoGosuNo(grc);
		model.addAttribute("grOne", gr);
		model.addAttribute("grcOne", grc2);
		return "gosu/gosuRequestContent";
	}

	@RequestMapping(value = "/gosuRequestListGosuNo.do")
	public String gosuRequestListGosuNo(int reqPage, int gosuNo, String type, Model model) {
		GosuRequestListPageData glpd = service.selectMemberRequestListGosuNoIN(reqPage, gosuNo, type);
		model.addAttribute("memberRequestList", glpd.getList());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());
		return "gosu/gosuRequestList";
	}

	@ResponseBody
	@RequestMapping(value = "/gosuRequestCostInsert.do")
	public int gosuRequestCostInsert(int requestNo, int gosuNo, int cost, String content, String memberId,
			Model model) {
		GosuRequestCost grc = new GosuRequestCost();
		grc.setCost(cost);
		grc.setCostContent(content);
		grc.setGosuNo(gosuNo);
		grc.setRequestNo(requestNo);
		grc.setMemberId(memberId);
		int result = service.gosuRequestCostInsert(grc);
		return result;
	}

	@RequestMapping(value = "/gosuRequestCostList.do")
	public String gosuRequestCostList(int reqPage, @SessionAttribute(required = false) Member m, Model model) {
		GosuRequestCostListPageData glpd = service.selectGosuRequestCostList(reqPage, m.getMemberId());
		model.addAttribute("memberRequestCostList", glpd.getList());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());
		return "gosu/gosuRequestCostList";
	}

	@ResponseBody
	@RequestMapping(value = "/selectGosuRequestCost.do")
	public GosuRequestCost selectGosuRequestCost(int costNo, Model model) {
		GosuRequestCost gpc = service.selectGosuRequestCost(costNo);
		return gpc;
	}

	@ResponseBody
	@RequestMapping(value = "/gosuRequestProjectSubAjax.do")
	public int gosuRequestProjectSubAjax(int requestNo, int costNo, Model model) {

		GosuRequestProjectSub grps = new GosuRequestProjectSub();
		grps.setCostNo(costNo);
		grps.setRequestNo(requestNo);
		int result = service.insertGosuRequestProjectSub(grps);
		return result;
	}

	@RequestMapping(value = "/gosuProject.do")
	public String gosuProject(int rpsNo, Model model) {
		GosuRequestProjectSub grps = service.selectGosuRequestProjectSub(rpsNo);
		ArrayList<GosuRequestProject> grp = service.selectGosuRequestProjectOne(rpsNo);
		GosuRequestReview grr2 = new GosuRequestReview();
		grr2.setMemberId(grps.getRequestWriterId());
		grr2.setRequestProjectSubNo(grps.getRequestProjectSubNo());
		GosuRequestReview grr = service.selectGosuRequestReviewOne(grr2);
		model.addAttribute("grrOne", grr);

		model.addAttribute("grplist", grp);
		model.addAttribute("grpsOne", grps);
		return "gosu/gosuProject";
	}

	@ResponseBody
	@RequestMapping(value = "/talkBtnProjectAjax.do")
	public int talkBtnProjectAjax(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
			String talkContent, int writerNo,
			@RequestParam(required = false, defaultValue = "0") int requestProjectSubNo, Model model) {
	
		GosuRequestProject grp = new GosuRequestProject();
		grp.setMemberNo(writerNo);
		grp.setRequestProjectSubNo(requestProjectSubNo);
		grp.setRequestProjectContent(talkContent);
		MultipartFile files = req.getFile("talkFile");
		if (files == null) {

		} else {
			String savePath = request.getSession().getServletContext()
					.getRealPath("/resources/upload/gosu/gosuRequestProject/");
			String filename = files.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count = 0;
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
				grp.setFilename(filename);
				grp.setFilepath("/resources/upload/gosu/gosuRequestProject/" + filepath);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int result = service.insertGosuRequestProject(grp);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/talkStopAjax2.do")
	public int talkStopAjax2(int requestProjectSubNo, Model model) {
		int result = service.talkStop2(requestProjectSubNo);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/requestReviewAjax.do")
	public int requestReviewAjax(int requestProjectSubNo, String requestMemberId, String requestReviewContent,
			Model model) {
		GosuRequestReview grr = new GosuRequestReview();
		
		grr.setRequestProjectSubNo(requestProjectSubNo);
		grr.setMemberId(requestMemberId);
		grr.setRequestReviewContent(requestReviewContent);
		int result = service.insertRequestReviewAjax(grr);
		return result;
	}

	@RequestMapping(value = "/noticeContentUpdateFrm.do")
	public String noticeContentUpdateFrm(int gnn, Model model) {

		GosuNotice gNotice = service.selectGosuNoticeOne(gnn);
		model.addAttribute("gNotice", gNotice);
		return "gosu/gosuNoticeUpdateFrm";
	}

	@RequestMapping(value = "/gosuNoticeUpdate.do")
	public String gosuNoticeUpdate(MultipartFile files, HttpServletRequest request, GosuNotice gNotice, Model model) {
		if (files.isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext()
					.getRealPath("/resources/upload/gosu/gosuNotice/");
			String filename = files.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count = 0;
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			gNotice.setGnoticePhoto("/resources/upload/gosu/gosuNotice/" + filepath);
		}
		int result = service.gosuNoticeUpdate(gNotice);

		if (result == -1) {

			model.addAttribute("title", "등록 실패");
			model.addAttribute("icon", "error");
			model.addAttribute("msg", "입력 정보를 확인해주세요.");
		} else {
			model.addAttribute("title", "등록 성공");
			model.addAttribute("msg", "");
			model.addAttribute("icon", "success");
		}
		model.addAttribute("loc", "/gosuNoticeContent.do?gnn=" + gNotice.getGnoticeNo());
		return "member/swalMsg";
	}

	@RequestMapping(value = "/noticeContentdelete.do")
	public String noticeContentdelete(int gnn, Model model) {
		int result = service.noticeContentdelete(gnn);

		if (result == -1) {
			model.addAttribute("title", "삭제 실패");
			model.addAttribute("icon", "error");
			model.addAttribute("msg", "입력 정보를 확인해주세요.");
		} else {
			model.addAttribute("title", "삭제 성공");

			model.addAttribute("msg", "");
			model.addAttribute("icon", "success");
		}
		model.addAttribute("loc", "/gosuNoticeList.do?reqPage=1");
		return "member/swalMsg";
	}

	@RequestMapping(value = "/gosuList2.do")
	public String gosuList2(int reqPage, String keyword, String type, Model model) {
		GosuListPageData glpd = service.selectGosuList2(reqPage, keyword, type);
		model.addAttribute("gList", glpd.getList());
		model.addAttribute("gList2", glpd.getList2());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());
		return "gosu/gosuList";
	}

	@RequestMapping(value = "/gosuNoticeList2.do")
	public String gosuNoticeList2(int reqPage, String keyword, String type, Model model) {
		GosuNoticeListPageData glpd = service.selectGosuNoticeList2(reqPage, keyword, type);
		model.addAttribute("gNoticeList", glpd.getList());
		model.addAttribute("pageNavi", glpd.getPageNavi());
		model.addAttribute("start", glpd.getStart());

		return "gosu/gosuNoticeList";
	}

	@RequestMapping(value = "/fileDownload.do")
	public void fileDownload(String filePath, String fileName, HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		try {
			String path = req.getSession().getServletContext().getRealPath(filePath); // 경로에 접근할 때 역슬래시('\') 사용
		
			File file = new File(path);
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로
																								// 쓰이는지를 알려주는 헤더
			FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기
			OutputStream out = response.getOutputStream();

			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을
																	// 파일이 없음
				out.write(buffer, 0, read);
			}

		} catch (Exception e) {
			throw new Exception("download error");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/gNoticeCommentAjax.do")
	public int gNoticeCommentAjax(int boardNo, int boardType, int commentType, String memberId, String commentContent) {
		Comment cmt = new Comment();
		cmt.setBoardNo(boardNo);
		cmt.setBoardType(boardType);
		cmt.setCommentType(commentType);
		cmt.setMemberId(memberId);
		cmt.setCommentContent(commentContent);
		int result = service.insertGosuNoticeComment(cmt);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/gNoticeCommentReAjax.do")
	public int gNoticeCommentReAjax(Comment cmt) {
		int result = service.insertGosuNoticeCommentRe(cmt);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/gNoticeCommentUpdateAjax.do")
	public int gNoticeCommentUpdateAjax(Comment cmt) {
		int result = service.gNoticeCommentUpdateAjax(cmt);
		return result;

	}

	@ResponseBody
	@RequestMapping(value = "/gNoticeCommentDeleteAjax.do")
	public int gNoticeCommentDeleteAjax(int commentNo) {
		int result = service.gNoticeCommentDeleteAjax(commentNo);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/gosuMemberRequestAjax.do")
	public GosuRequest gosuMemberRequestAjax(int costNo, @SessionAttribute(required = false) Member m) {
	
		GosuRequestCost grc = new GosuRequestCost();
		grc.setCostNo(costNo);
		grc.setMemberId(m.getMemberId());
		GosuRequest grcOne = service.gosuMemberRequestAjax(grc);
		return grcOne;
	}
	@ResponseBody
	@RequestMapping(value = "/gosuMemberRequestAjax2.do")
	public GosuRequest gosuMemberRequestAjax2(int costNo,String memberId) {
	
		GosuRequestCost grc = new GosuRequestCost();
		grc.setCostNo(costNo);
		grc.setMemberId(memberId);
		GosuRequest grcOne = service.gosuMemberRequestAjax(grc);
		return grcOne;
	}
	//댓글등록
	@RequestMapping(value="/insertGNComment.do")
	public String insertGNComment(Comment cm, Model model) {
		int result = service.insertGNComment(cm);
		if(result>0) {
			return "redirect:/gosuNoticeContent.do?gnn="+cm.getBoardNo();
		}else {
			model.addAttribute("msg","댓글등록 실패");
			model.addAttribute("loc","/gosuNoticeContent.do?gnn="+cm.getBoardNo());
			return "common/msg";
		}
		
	}
	@RequestMapping(value="/reportGNComment.do")
	public String reportComment(Report rp, Model model, int contestNo) {
		int result = service.reportContestComment(rp);
		if(result>0) {
			model.addAttribute("title","댓글 신고 성공");
			model.addAttribute("msg","해당 댓글을 신고하였습니다.");
			model.addAttribute("icon","success");
		
		}else {
			model.addAttribute("title","댓글 신고 실패");
			model.addAttribute("msg","해당 댓글 신고에 실패하였습니다. 관리자에게 문의해주세요.");
			model.addAttribute("icon","error");
		}
		model.addAttribute("loc","/gosuNoticeContent.do?gnn="+contestNo);
		return "member/swalMsg";
		
	}
	
	@RequestMapping(value = "/gosuNoticeContent.do")
	public String gosuNoticeContent(int gnn, Model model) {
		GosuNotice gNotice = service.selectGosuNoticeOne(gnn);
		Gosu gosuWriteList = service.selectgosuWriteList(gNotice.getWriteId());
		ArrayList<Comment> commentList = service.selectGosuNoticeCommentList(gnn);
		model.addAttribute("gNotice", gNotice);
		model.addAttribute("gosuWriteList", gosuWriteList);
		model.addAttribute("commentList", commentList);

		return "gosu/gosuNoticeContent";
	}

	
	@RequestMapping(value = "/develomintIntro.do")
	public String develomintIntro() {
		return "gosu/develomintIntro";
	}
		@RequestMapping(value = "/gosuIntro.do")
	public String gosuIntro() {
		return "gosu/gosuIntro";
	}
}
