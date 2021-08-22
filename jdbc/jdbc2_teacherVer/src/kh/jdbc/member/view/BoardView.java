package kh.jdbc.member.view;

import java.util.ArrayList;
import java.util.Scanner;

import kh.jdbc.member.vo.Board;
import kh.jdbc.member.vo.Member;

public class BoardView {
	private Scanner sc;

	public BoardView() {
		super();
		sc = new Scanner(System.in);
	}
	
public int boardMenu() {
		
		System.out.println("--------- KH 게시판 ---------");
		System.out.println("1. 게시물 목록 보기");
		System.out.println("2. 게시물 상세보기");
		System.out.println("3. 게시물 작성");
		System.out.println("4. 게시글 수정");
		System.out.println("5. 게시글 삭제");
		System.out.println("6. 이전 메뉴로 돌아가기");
		System.out.println("0. 메인메뉴로 돌아가기");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		
		return sel;
	}
	
	public void postingList(ArrayList<Board> list) {
		
		System.out.println("--------- KH 게시글 목록 ---------");
		System.out.println("글번호\t제목\t작성자\t조회수\t작성일");
		
		for(Board posting : list) {
			System.out.println(posting.getBoardNo()+"\t"+posting.getBoardTitle()+"\t"
					+posting.getBoardWriterString()+"\t"+posting.getReadCount()+"\t"+posting.getEnrollDate());
		}
	}
	
	public void selectOneBoard(Board b) {
		System.out.println("글 번호 : "+b.getBoardNo());
		System.out.println("제목 : "+b.getBoardTitle());
		System.out.println("내용 : "+b.getBoardContent());
		System.out.println("작성자 : "+b.getBoardWriterString());
		System.out.println("조회수 : "+b.getReadCount());
		System.out.println("작성일 : "+b.getEnrollDate());
	}

	public Board createPosting() {
		Board b = new Board();
		System.out.println("--------- KH 게시글 작성 ---------");
		System.out.print("제목 입력 : ");
		sc.nextLine();
		b.setBoardTitle(sc.nextLine());
		System.out.print("내용 입력 : ");
		b.setBoardContent(sc.nextLine());
		
		return b;
	}
	
	public Member updatePosting() {
		
		Member up = new Member();
		System.out.print("수정할 제목 입력 : ");
		sc.nextLine();
		up.setBoardTitle(sc.nextLine());
		System.out.print("수정할 내용 입력 : ");
		up.setBoardContent(sc.nextLine());
		
		return up;
	}
	
		public int getBoardNo(String str) {
		
		System.out.println(str + "글 번호 입력 : ");
		int postingNo = sc.nextInt();
		
		return postingNo;
	}
	
	public void emptyPosting() {
		System.out.println("등록된 게시글이 없습니다.");
	}
	
	public void failMsg(String str) {
		System.out.println(str+"에 실패 하였습니다.");
	}
	
	public void successMsg(String str) {
		System.out.println(str+"에 실패 하였습니다.");
	}
	
}
