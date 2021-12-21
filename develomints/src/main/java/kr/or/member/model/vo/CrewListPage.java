package kr.or.member.model.vo;

import java.util.ArrayList; 

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CrewListPage {
	private ArrayList<CrewVO> crewList;
	private String pageNavi;
	private int start;
}
