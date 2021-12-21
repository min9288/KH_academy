package kr.or.gosu.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class GosuProject {
	private int gprojectNo;
	private int ggsouNo;
	private String gprojectTitle;
	private String gprojectContent;
	private String gprojectFilepath;
	
	public String getGprojectContentBr(){
		return gprojectContent.replaceAll("\r\n", "<br>");
	}

	public String getGprojectTitleBr(){
		return gprojectTitle.replaceAll("\r\n", "<br>");
	}

}
