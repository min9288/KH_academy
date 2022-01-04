package kr.or.member.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ProjectPageVO {
	private int rnum;
	private int projectNo;
	private String recruitTitle;
	private String endDate;
	private int entryCount;
	private int projectStatus;
}
