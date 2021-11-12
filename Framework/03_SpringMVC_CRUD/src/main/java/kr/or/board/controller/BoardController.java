package kr.or.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.FileVO;


@Controller
public class BoardController {
	@Autowired	
	private BoardService service;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model) {
		ArrayList<Board> list = service.selectBoardList();
		model.addAttribute("list", list);
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWriteFrm1.do")
	public String boardFrm1() {
		return "board/boardWriteFrm1";
	}
	
	@RequestMapping(value="/boardWrite1.do")
	public String boardWrite1(Board b) {
		int result = service.insertBoard1(b);
		// 작성 성공 시 게시물목록, 실패는 게시글 작성
		if(result > 0) {
			return "redirect:/boardList.do";
		}else {
			return "board/boardWriteFrm1";
		}
	}
	
	@RequestMapping(value="/boardView.do")
	public String boardView(Model model, int boardNo) {
		Board b = service.selectBoard(boardNo);
		model.addAttribute("b", b);
		return "board/boardView";
	}
	
	@RequestMapping(value="/boardWriteFrm2.do")
	public String boardWriteFrm2() {
		return "board/boardWriteFrm2";
	}
	
	@RequestMapping(value="/boardWrite2.do")
	public String boardWrite2(Board b, MultipartFile[] files, HttpServletRequest request) {
		// 파일목록을 저장할 List
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		// MultipartFile[] 배열은 파일을 첨부하지 않더라도 무조건 길이가 1인 배열
		// 배열의 첫번째 파일이 비어있는지 체크하는 방식으로 파일첨부 여부 확인
		System.out.println(files.length);
		if(files[0].isEmpty()) {
			// 첨부파일이 없는 경우
		}else {
			// 첨부파일이 있는 경우
			// MultipartFile을 이용해서 파일업로드 작업을 수행해야함
			// request....getRealPath -> /webapp/폴더
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			// 반복문을 이용해서 파일 처리(파일업로드)
			for(MultipartFile file : files) {
				// 유저가 올린 파일명이 이미 업로드폴더에 존재하면 덮어쓰기가 되어 이전파일이 삭제
				// 파일명 중복처리
				// 사용자가 올린 파일명
				String filename = file.getOriginalFilename();
				// test.txt -> test_1.txt, test_2.txt
				// test.txt -> test		.txt -> 파일명을 확장자 기준으로 나눔
				String onlyFilename = filename.substring(0, filename.indexOf(".")); // test
				String extention = filename.substring(filename.indexOf("."));	// .txt
				// 실제 업로드할 파일명을 저장할 변수
				String filepath = null;
				// 파일명 중복 시 숫자를 붙이는 코드
				int count = 0;
				while(true) {
					if(count == 0) {
						filepath = onlyFilename + extention; // test.txt
					}else {
						filepath = onlyFilename + "_" + count + extention;	// test_3.txt
					}
					File checkFile = new File(savePath + filepath); // java.io.File
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				// 파일명 중복처리가 끝나면 파일 업로드
				try {
					// 중복처리가 끝난 파일명(filepath)으로 파일을 업로드
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도 증가를 위한 보조스트림
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일 업로드
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				FileVO fv = new FileVO();
				fv.setFilename(filename);
				fv.setFilepath(filepath);
				list.add(fv);
			}
		}
		return "redirect:/";
	}
	
}
