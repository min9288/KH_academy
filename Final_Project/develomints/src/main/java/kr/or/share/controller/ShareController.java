package kr.or.share.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
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

import kr.or.comment.vo.Comment;
import kr.or.comment.vo.Report;
import kr.or.notice.vo.Notice;
import kr.or.share.model.service.ShareService;
import kr.or.share.model.vo.Like;
import kr.or.share.model.vo.Share;
import kr.or.share.model.vo.ShareBoardPage;
import kr.or.share.model.vo.ShareViewData;

@Controller
public class ShareController {
	@Autowired
	private ShareService service;
	
	@RequestMapping(value="/shareList.do")
	public String shareList(Model model,int reqPage,int type) {
		ShareBoardPage sbp = service.shareBoardList(reqPage,type);
		model.addAttribute("list",sbp.getList());
		model.addAttribute("start",sbp.getStart());
		model.addAttribute("pageNavi",sbp.getPageNavi());
		model.addAttribute("type",type);
		return "share/shareList";
	}
	@RequestMapping(value="/shareSearch.do")
	public String shareSearch(Model model,int reqPage,int type,String search,int category) {
		ShareBoardPage sbp = service.shareBoardList(reqPage,type,category,search);
		model.addAttribute("list",sbp.getList());
		model.addAttribute("start",sbp.getStart());
		model.addAttribute("pageNavi",sbp.getPageNavi());
		model.addAttribute("type",type);
		return "share/shareList";		
	}
	@RequestMapping(value="/shareBoardView.do")
	public String shareBoardView(Model model,int boardNo) {
		ShareViewData svd = service.shareBoardView(boardNo);
		model.addAttribute("sv",svd.getS());
		model.addAttribute("list", svd.getList());
		return "share/shareView";
	}
	
	@RequestMapping(value="/shareWriteFrm.do")
	public String shareWriteFrm() {
		return "share/shareWriteFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardSummerImage.do")
	public String boardSummer(MultipartFile file, HttpServletRequest request) {
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
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
		return "/resources/upload/share/" + filepath;		
	}
	
	@RequestMapping(value="/insertShareBoard.do")
	public String insertShareBoard(Share s,HttpServletRequest request, MultipartFile files, Model model) {
		if (!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
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
			s.setFilepath(filepath);
			s.setFilename(filename);

		}

		int result = service.insertShareBoard(s);

		if (result > 1) {
			model.addAttribute("title", "등록성공");
			model.addAttribute("msg", "글 작성이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "변경실패");
			model.addAttribute("msg", "글 작성에 실패하셨습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/shareInsertComment.do")
	public String insertCommentShare(Comment c,Model model) {
		int result = service.insertCommentShare(c);
		if(result>0) {
			model.addAttribute("title", "등록성공");
			model.addAttribute("msg", "댓글 작성이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "success");			
		}else {
			model.addAttribute("title", "등록실패");
			model.addAttribute("msg", "댓글 작성에 실패하셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	
	@RequestMapping(value="/insertReComment.do")
	public String insertRecomment(Comment c,Model model) {
		int result = service.insertRecomment(c);
		if(result>0) {
			model.addAttribute("title", "등록성공");
			model.addAttribute("msg", "댓글 작성이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "success");			
		}else {
			model.addAttribute("title", "등록실패");
			model.addAttribute("msg", "댓글 작성에 실패하셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(int boardNo,Model model) {
		int result = service.deleteBoard(boardNo);
		if(result>0) {
			model.addAttribute("title", "삭제성공");
			model.addAttribute("msg", "게시물이 삭제되었습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "success");			
		}else {
			model.addAttribute("title", "등록실패");
			model.addAttribute("msg", "댓글 작성에 실패하셨습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	@RequestMapping(value="/updateBoardFrm.do")
	public String updateBoardFrm(int boardNo,Model model) {
		Share s = service.selectOneBoard(boardNo);
		model.addAttribute("s",s);
		return "share/updateBoardFrm";
	}
	@RequestMapping(value="/updateShareBoard.do")
	public String updateBoard(int status, String oldFilename, String oldFilepath,
		Share s,HttpServletRequest request, MultipartFile files, Model model) {
		if (!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
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
			s.setFilepath(filepath);
			s.setFilename(filename);
			// status의 상태에 따라 처리
			if (status == 2) {
				File delFile = new File(savePath + "/" + oldFilepath);
				delFile.delete();
			} else if (oldFilename != null) {
				s.setFilename(oldFilename);
				s.setFilepath(oldFilepath);
			}
		}

		int result = service.updateShareBoard(s);

		if (result > 0) {
			model.addAttribute("title", "수정성공");
			model.addAttribute("msg", "글 수정이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "변경실패");
			model.addAttribute("msg", "글 수정이 실패하셨습니다.");
			model.addAttribute("loc", "/shareList.do?reqPage=1&type=1");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	@ResponseBody
	@RequestMapping(value="/sharefileDown.do")
	public void filedownload(int boardNo,HttpServletRequest req, Model model, HttpServletResponse rep) throws IOException{
		Share s = service.selectOneBoard(boardNo);
		String savePath = req.getSession().getServletContext().getRealPath("/resources/upload/share/");
		//파일경로 
		String file = savePath+s.getFilepath();
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		ServletOutputStream sos = rep.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
			
		String resFilename = "";
		boolean bool = req.getHeader("user-agent").indexOf("MSIE") != -1 || req.getHeader("user-agent").indexOf("Trident") != -1;
		if(bool) {
			resFilename = URLEncoder.encode(s.getFilename(), "utf-8");
			resFilename = resFilename.replaceAll("////", "%20"); // 파일명에 "//" 가 있으면 %20으로 바꾸는 구문
		}else {
			resFilename = new String(s.getFilename().getBytes("utf-8"),"ISO-8859-1");
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
	@RequestMapping(value="/deleteShareComment.do")
	public String deleteComment(Comment c,Model model) {
		int result = service.deleteComment(c);
		if(result>0) {
			model.addAttribute("title", "삭제성공");
			model.addAttribute("msg", "댓글 삭제가 완료 되셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "success");			
		}else {
			model.addAttribute("title", "삭제실패");
			model.addAttribute("msg", "댓글 삭제에 실패하셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	@RequestMapping(value="/updateShareComment.do")
	public String updateShareComment(Comment c,Model model) {
		int result = service.updateComment(c);
		if(result>0) {
			model.addAttribute("title", "수정성공");
			model.addAttribute("msg", "댓글 수정이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "success");			
		}else {
			model.addAttribute("title", "수정실패");
			model.addAttribute("msg", "댓글 수정이 실패하셨습니다.");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+c.getBoardNo());
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";		
	}
	//댓글신고
	@RequestMapping(value="/reportShare.do")
	public String reportShare(Report rp,Model model, int boardNo) {
		int result = service.shareReport(rp);
		if(result>0) {
			model.addAttribute("title", "신고 완료");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+boardNo);
			model.addAttribute("icon", "success");				
		}else {
			model.addAttribute("title", "신고 실패");
			model.addAttribute("loc", "/shareBoardView.do?boardNo="+boardNo);
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
	@ResponseBody
	@RequestMapping(value="/shareLike.do")
	public int shareLike(Like lk) {
		int result = service.shareLike(lk);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/isLike.do")
	public int isLike(Like lk) {
		int result = service.isLike(lk);
		return result;
	}
}
