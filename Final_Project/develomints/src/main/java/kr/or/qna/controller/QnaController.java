package kr.or.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.ResultMap;
import org.omg.PortableInterceptor.NON_EXISTENT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import com.sun.xml.internal.ws.api.message.Attachment;

import kr.or.member.model.vo.Member;
import kr.or.notice.vo.Notice;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.service.QnaService;
import kr.or.qna.vo.Faq;
import kr.or.qna.vo.NonQna;
import kr.or.qna.vo.Qna;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	/*
	 * @RequestMapping(value="/n_counsel.do") public String n_counsel() { return
	 * "qna/n_counsel"; }
	 */
	
	@RequestMapping(value="/n_counsel.do")
	public String tocounsel() {
		return "qna/counsel";
	}
	
	@RequestMapping(value="/faq.do")
	public String tofaq(int category, Model model) {
		if(category >= 7) {
			model.addAttribute("category", category);
		}
		ArrayList<Faq> list = service.selectFaqlist(category);
		model.addAttribute("list", list);
		return "faq/faq";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileupload.do")
	public String uploadImage(MultipartFile file, HttpServletRequest req) {
		/*
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot + "resources/upload/notice/";
		String originalFileName = file.getOriginalFilename(); // ???????????? ?????????
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // ?????? ?????????

		String savedFileName = UUID.randomUUID() + extension; // ????????? ?????? ???
		try {
			FileOutputStream fos = new FileOutputStream(new File(fileRoot + savedFileName));
			// ????????? ??????????????? ?????? ???????????????
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// ?????? ?????????
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
		
		System.out.println(fileRoot + savedFileName);
		return "/resources/upload/notice/" + savedFileName;
		*/
		
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/qna/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.indexOf("."));
		String extension = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count=0;
		while(true) {
			if(count == 0 ) {
				filepath = onlyFilename+extension;
			}else {
				filepath = onlyFilename+"_"+count+extension;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			// ????????? ??????????????? ?????? ???????????????
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// ?????? ?????????
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
		return "/resources/upload/qna/" + filepath;
	}
	
	//??????????????????
	@RequestMapping(value="/counsel_save1.do")
	public String insertCounsel(NonQna nq, HttpServletRequest request, Model model) {
		int result = service.insertCounselNonQna(nq);
		if(result>0) {
			model.addAttribute("title", "1:1 Q&A ?????? ??????!");
			model.addAttribute("msg", "????????? ????????? ?????? ???????????? ??????????????? ?????????.");
			model.addAttribute("loc", "/n_counsel.do");
			model.addAttribute("icon", "success");	
		}else {
			model.addAttribute("title", "1:1 Q&A ?????? ??????");
			model.addAttribute("msg", "?????????????????? ?????????????????????.");
			model.addAttribute("loc", "/n_counsel.do");
			model.addAttribute("icon", "warning");
		}
		//model.addAttribute("loc","/n_counsel.do");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/counsel_save2.do")
	public String insertCounsel2(@SessionAttribute Member m, Qna q, HttpServletRequest request, MultipartFile[] Filedata, Model model) {
		ArrayList<ProjectTeamFileVO> list = new ArrayList<ProjectTeamFileVO>();
		//MultipartFile[]????????? ????????? ???????????? ???????????? ????????? ????????? 1??? ??????
		//????????? ????????? ????????? ??????????????? ???????????? ???????????? ???????????? ?????? ??????
		if(!Filedata[0].isEmpty()) {	
			//????????? ???????????? ?????? ??????
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/qna/");
			//???????????? ???????????? ????????????(???????????????)
			for(MultipartFile file : Filedata) {
				//?????????????????????
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.indexOf("."));//test
				String extention = filename.substring(filename.indexOf("."));//.txt
				//?????? ???????????? ???????????? ????????? ??????
				String filepath = null;
				int count = 0;
				while(true) {
					if(count ==0) {
						filepath = onlyFilename+extention;//test.txt
					}else {
						filepath = onlyFilename+"_"+count+extention;	//test_3.txt
					}
					File checkFile = new File(savePath+filepath);		//java.io.File
					if(!checkFile.exists()) {//???????????????????????? ==>true??? ??????
						break;
					}
					count++;
				}//---------------------------------------------------------------------------------
				//????????? ??????????????? ????????? ???????????????
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					//????????? ??????????????? ?????? ???????????????
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					//?????? ?????????
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
				ProjectTeamFileVO ptfv = new ProjectTeamFileVO();
				ptfv.setFileName(filename);
				ptfv.setFilePath(filepath);
				list.add(ptfv);
			}
		}
		int result = service.insertCounselQna(m,q, list);
		if(result == -1||result != list.size()) {
			model.addAttribute("title", "1:1 Q&A ?????? ??????");
			model.addAttribute("msg", "?????? ???????????? ?????????????????????. ???????????? ??????????????????");
			model.addAttribute("loc", "/n_counsel.do");
			model.addAttribute("icon", "warning");
		}else {
			model.addAttribute("title", "1:1 Q&A ?????? ??????!");
			model.addAttribute("msg", "??????????????? ?????????????????????. ??????????????????.");
			model.addAttribute("loc", "/n_counsel.do");
			model.addAttribute("icon", "success");
		}
		//model.addAttribute("loc","/");
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/myCounsel.do")
	public String myCounsel(@SessionAttribute Member m, Model model) {
		ArrayList<Qna> list = service.myCounselOne(m.getMemberId());
		model.addAttribute("list",list);
		return "qna/counselUser";
	}
	
	/*
	 * @RequestMapping(value="/adminCounsel.do") public String adminCounsel(Model
	 * model) { ArrayList<Qna> adlist = service.counselList();
	 * model.addAttribute("adlist",adlist); return "qna/counselAdmin"; }
	 */
	
	@RequestMapping(value="/adminCounsel.do")
	public String adminCounsel(Model model, int type) {
		if(type==1) {
			ArrayList<Qna> adlist = service.counselList();
			model.addAttribute("type",type);
			model.addAttribute("adlist",adlist);
		}else if(type==2) {
			ArrayList<NonQna> adlist = service.counselList2();
			model.addAttribute("type",type);
			model.addAttribute("adlist",adlist);
		}
		return "qna/counselAdmin";
	}
	
	@RequestMapping(value="/updateCounsel.do")
	public String updateCounsel(int num, int type, String qnaAnswer, Model model) {
		int result = service.updateCounsel(qnaAnswer, type, num);
		if(result>0) {
			model.addAttribute("title", "????????????!");
			model.addAttribute("msg", "??????????????? ?????????????????????.");
			model.addAttribute("loc", "/adminCounsel.do?type="+type);
			model.addAttribute("icon", "success");
		}else {
			model.addAttribute("title", "????????????");
			model.addAttribute("msg", "?????????????????? ?????????????????????.");
			model.addAttribute("loc", "adminCounsel.do?type="+type);
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/searhBox.do")
	public String searchBox(Model model, int type, int category, int state) {
		if(type==1) {
			ArrayList<Qna> list = service.searchBox1(category,state);
			model.addAttribute("type",type);
			model.addAttribute("adlist",list);
		}else if(type==2) {
			ArrayList<NonQna> list = service.searchBox2(category,state);
			model.addAttribute("type",type);
			model.addAttribute("adlist",list);
		}
		return "qna/counselAdmin";
	}
	
	@RequestMapping(value="/faqlist.do")
	public String faqlistBox(int category, Model model) {
		ArrayList<Faq> list = service.selectFaqlist(category);
		model.addAttribute("category",category);
		model.addAttribute("list",list);
		return "qna/faqlist";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectOnefileList.do")
	public ArrayList<ProjectTeamFileVO> selectOnefileList(int qnaNo){
		ArrayList<ProjectTeamFileVO> filelist = service.selectOnefileList(qnaNo); 
		return filelist;
	}
	
	@RequestMapping(value="/nonMember_CounselList.do")
	public String  nonMemberCounselList(Model model) {
		ArrayList<NonQna> adlist = service.counselList2();
		model.addAttribute("adlist",adlist);
		return "qna/nonMemberCounsel";
	}
	
	@RequestMapping(value="/searhBoxUser.do")
	public String UserSearchBox(Model model, int category, int state, String memberId) {
		ArrayList<Qna> list = service.userSearchbox(category, state, memberId);
		model.addAttribute("list",list);
		return "qna/counselUser";
	}
	
	@RequestMapping(value="/deleteMyQna.do")
	public String deleteQna(int qnaNo, Model model) {
		int result = service.deleteQna(qnaNo);
		if(result>0) {
			model.addAttribute("title", "????????????!");
			model.addAttribute("msg", "??? ???????????? ???????????? ?????? ?????????????????????.");
			model.addAttribute("loc", "/myCounsel.do");
			model.addAttribute("icon", "success");
		}else {
			model.addAttribute("title", "????????????");
			model.addAttribute("msg", "??????????????? ???????????????.");
			model.addAttribute("loc", "/myCounsel.do");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/searchPw.do")
	public String searchPw(Model model, int nonQnaNo, String qnaPw) {
		NonQna nq = service.searchPw(nonQnaNo,qnaPw);
		if(nq != null) {
			model.addAttribute("nq",nq);
			return "qna/nonMember_field";
		}else {
			model.addAttribute("title", "???????????? ?????? ??????");
			model.addAttribute("msg", "?????? ????????? ?????? ??????????????????.");
			model.addAttribute("loc", "/nonMember_CounselList.do");
			model.addAttribute("icon", "error");
			return "member/swalMsg";
		}
	}
	
	@RequestMapping(value="/nonSearhBox.do")
	public String nonSearchBox(int category, String keyword, Model model) {
		ArrayList<NonQna> adlist = service.nonSearchList(category, keyword);
		model.addAttribute("adlist",adlist);
		return "qna/nonMemberCounsel";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardFileDownload.do")
	public void filedownload(int fileNo, HttpServletRequest req, Model model, HttpServletResponse rep) throws IOException {
		ProjectTeamFileVO ptfv = service.boardFileDown(fileNo); 
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/qna/");
		//???????????? 
		String file = savePath+ptfv.getFilePath();
		System.out.println("???????????? ?????? ?????? ?????? : "+file); 
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		ServletOutputStream sos = rep.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
			
		String resFilename = "";
		boolean bool = req.getHeader("user-agent").indexOf("MSIE") != -1 || req.getHeader("user-agent").indexOf("Trident") != -1;
		System.out.println("IE ?????? : "+bool);
		if(bool) {
			resFilename = URLEncoder.encode(ptfv.getFileName(), "utf-8");
			resFilename = resFilename.replaceAll("////", "%20"); // ???????????? "//" ??? ????????? %20?????? ????????? ??????
		}else {
			resFilename = new String(ptfv.getFileName().getBytes("utf-8"),"ISO-8859-1");
		}
		rep.setContentType("application/octet-stream");
		rep.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		bis.close();
		bos.close();
  	} 
	
}
