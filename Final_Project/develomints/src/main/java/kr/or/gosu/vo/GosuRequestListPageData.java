package kr.or.gosu.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GosuRequestListPageData {
	private ArrayList<GosuRequest> list;
	private String pageNavi;
	private int start;
}
