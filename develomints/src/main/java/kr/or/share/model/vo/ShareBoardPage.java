package kr.or.share.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShareBoardPage {
	ArrayList<Share> list;
	private int start;
	private String pageNavi;
}
