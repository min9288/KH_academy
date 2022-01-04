package kr.or.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.notice.service.NoticeService;
import kr.or.notice.vo.Notice;
import kr.or.notice.vo.NoticePageData;
import kr.or.notice.vo.Rnum;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	@RequestMapping(value = "/noticeList.do")
	public String noticeList(int reqPage, Model model) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		model.addAttribute("list", npd.getFixlist());
		model.addAttribute("pageNavi", npd.getPageNavi());
		model.addAttribute("start", npd.getStart());
		model.addAttribute("totalCount", npd.getTotalCount());
		model.addAttribute("fixPage", npd.getFixPage());
		return "notice/noticeList";
	}

	@RequestMapping(value = "/nWriteFrm.do")
	public String nWriteFrm() {
		return "notice/nWriteFrm";
	}

	@RequestMapping(value = "/noticehome.do")
	public String nHome(Model model) {
		ArrayList<Notice> noticeList = service.noticeList();
		model.addAttribute("nlist",noticeList);
		return "notice/noticeHome";
	}

	@RequestMapping(value = "/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		//상세보기를위해 1개 글만 가지로 오기
		Notice n = service.selectOneNotice(noticeNo);
		System.out.println(noticeNo);
		//rnum구하기
		Rnum rn = service.selectRnum(noticeNo);
		System.out.println(rn.getRnum());
		//rnum으로 5개글만뽑아오기
		ArrayList<Rnum> rlist = service.selectRnumList(rn.getRnum());
		model.addAttribute("n", n);
		model.addAttribute("rnum",rn.getRnum());
		model.addAttribute("rlist",rlist);
		return "notice/noticeView";
	}

	@RequestMapping(value = "/insertNotice.do")
	public String insertNotive(Notice n, HttpServletRequest request, MultipartFile files, Model model) {
		if (!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			// 사용자가 올린 파일명
			String filename = files.getOriginalFilename();
			// 올린 파일명에서 확장자 앞까지 자르기
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			// 올린 파일명에서 확장자 부분 자르기
			String extention = filename.substring(filename.indexOf("."));

			// 실제 업로드할 파일명
			String filepath = null;
			// 중복 파일 뒤에 붙여줄 숫자
			int count = 0;
			// 중복된 파일이 없을 때까지 반복(파일명 중복시 숫자 붙이는 코드)
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				// 파일 경로안에 중복된 파일이 있는지 체크
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			// 중복처리가 끝나면 파일 업로드
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

			// 중복처리된 파일 이름 넣어주기
			n.setFilepath(filepath);
			n.setFilename(filename);

		}

		int result = service.insertNotice(n);

		if (result > 0) {
			model.addAttribute("title", "공지등록 성공");
			model.addAttribute("msg", "공지게시판을 확인해주세요.");
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "공지등록 실패");
			model.addAttribute("msg", "공지등록 실패");
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
			model.addAttribute("icon", "warning");
		}

		return "member/swalMsg";
	}

	
	@ResponseBody
	@RequestMapping(value="/fileDown.do")
	public void filedownload(int noticeNo, HttpServletRequest req, Model model, HttpServletResponse rep) throws IOException {
		Notice n = service.selectOneNotice(noticeNo); 
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		//파일경로 
		String file = savePath+n.getFilepath();
		System.out.println("다운로드 파일 전체 경로 : "+file); 
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		ServletOutputStream sos = rep.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
			
		String resFilename = "";
		boolean bool = req.getHeader("user-agent").indexOf("MSIE") != -1 || req.getHeader("user-agent").indexOf("Trident") != -1;
		System.out.println("IE 여부 : "+bool);
		if(bool) {
			resFilename = URLEncoder.encode(n.getFilename(), "utf-8");
			resFilename = resFilename.replaceAll("////", "%20"); // 파일명에 "//" 가 있으면 %20으로 바꾸는 구문
		}else {
			resFilename = new String(n.getFilename().getBytes("utf-8"),"ISO-8859-1");
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
  
	 

	@ResponseBody
	@RequestMapping(value = "/uploadImage.do")
	public String uploadImage(MultipartFile file, HttpServletRequest req) {
		/*
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot + "resources/upload/notice/";
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(fileRoot + savedFileName));
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
		
		System.out.println(fileRoot + savedFileName);
		return "/resources/upload/notice/" + savedFileName;
		*/
		
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/notice/");
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
		return "/resources/upload/notice/" + filepath;
	}

	@RequestMapping(value = "/deleteNoticeNo.do")
	public String deleteNotice(int noticeNo, Model model) {
		int result = service.deleteNoticeNo(noticeNo);
		if (result > 0) {
			model.addAttribute("title", "삭제 완료!");
			model.addAttribute("msg", "공지사항 게시판으로 이동합니다.");
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "삭제 실패");
			model.addAttribute("msg", "삭제실패~ 에러발생~~개발자 문의바람~~");
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}

	@RequestMapping(value = "/updateNoticeFrm.do")
	public String updateNoticeFrm(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/nUpdateFrm";
	}

	@RequestMapping(value = "updateNoticeNo.do")
	public String updateNoticeNo(int status, String oldFilename, String oldFilepath, Notice n, Model model,
			HttpServletRequest request, MultipartFile upFile) {
		if (!upFile.isEmpty()) {
			// 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");

			// 사용자가 올린 파일명
			String filename = upFile.getOriginalFilename();
			System.out.println(filename);
			// 올린 파일명에서 확장자 앞까지 자르기
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			// 올린 파일명에서 확장자 부분 자르기
			String extention = filename.substring(filename.indexOf("."));

			// 실제 업로드할 파일명
			String filepath = null;
			// 중복 파일 뒤에 붙여줄 숫자
			int count = 0;
			// 중복된 파일이 없을 때까지 반복(파일명 중복시 숫자 붙이는 코드)
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				// 파일 경로안에 중복된 파일이 있는지 체크
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			// 중복처리가 끝나면 파일 업로드
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = upFile.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			n.setFilename(filename);
			n.setFilepath(filepath);

			// status의 상태에 따라 처리
			if (status == 2) {
				File delFile = new File(savePath + "/" + oldFilepath);
				delFile.delete();
			} else if (oldFilename != null) {
				n.setFilename(oldFilename);
				n.setFilepath(oldFilepath);
			}

		}
		int result = service.updateNoticeNo(n);
		if (result > 0) {
			model.addAttribute("title", "수정 완료!");
			model.addAttribute("msg", "공지사항 게시판으로 이동합니다.");
			model.addAttribute("loc", "/noticeView.do?noticeNo=" + n.getNoticeNo());
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "삭제 실패");
			model.addAttribute("msg", "삭제실패~ 에러발생~~개발자 문의바람~~");
			model.addAttribute("loc", "/noticeView.do?noticeNo=" + n.getNoticeNo());
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
}
