package kr.or.member.model.vo;

import java.util.ArrayList;

import kr.or.share.model.vo.Share;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardPage {
	private ArrayList<Share> list;
	private String pageNavi;
	private int start;
}
