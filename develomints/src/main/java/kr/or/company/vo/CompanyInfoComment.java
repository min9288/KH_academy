package kr.or.company.vo;

import java.util.ArrayList;

import kr.or.comment.vo.Comment;
import lombok.Data;

@Data
public class CompanyInfoComment {
	
	private CompanyInfo CompanyInfo;
	private ArrayList<Comment> commentList;
}

