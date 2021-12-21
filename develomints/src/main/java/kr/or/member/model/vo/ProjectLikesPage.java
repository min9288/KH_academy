package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectLikesPage {
	private ArrayList<ProjectLikes> list;
	private String pageNavi;
	private int start;
}
