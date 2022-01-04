package kr.or.share.model.vo;

import java.util.ArrayList;

import kr.or.comment.vo.Comment;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShareViewData {
	private ArrayList<Comment> list;
	private Share s;
}
