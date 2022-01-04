package kr.or.announce.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AnnouncePageData {
	private ArrayList<Announce> list;
	private String pageNavi;
	private int start;
}
