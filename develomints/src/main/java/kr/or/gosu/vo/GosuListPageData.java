package kr.or.gosu.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GosuListPageData {
	private ArrayList<Gosu> list;
	private String pageNavi;
	private int start;
	private ArrayList<Gosu> list2;
}
