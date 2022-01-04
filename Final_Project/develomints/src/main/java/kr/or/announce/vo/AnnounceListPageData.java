package kr.or.announce.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AnnounceListPageData {
	private ArrayList<AnnounceList> list;
	private String pageNavi;
	private int start;
	private int count;
}
