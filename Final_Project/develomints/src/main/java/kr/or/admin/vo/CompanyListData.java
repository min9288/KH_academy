package kr.or.admin.vo;

import java.util.ArrayList;

import kr.or.company.vo.Company;
import lombok.Data;

@Data
public class CompanyListData {
	
	private ArrayList<Company> companyList;
	private String pageNavi;
	private int start;
	
	
}
