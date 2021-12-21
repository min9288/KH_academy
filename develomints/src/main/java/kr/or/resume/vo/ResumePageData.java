package kr.or.resume.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ResumePageData {
	private ArrayList<Resume> list;
	private String pageNavi;
	private int start;
}