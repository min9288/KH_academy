package kr.or.gosu.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class GosuRequest {
	private int requestNo;
	private int requestWriterNo;
	private String requestContent1;
	private String requestContent2;
	private String requestContent3;
	private String requestContent4;
	private String requestContent5;
	private String requestContent6;
	private String requestContent7;
	private String requsetDate;
	private String requestWriterImg;
	private String requestWriterId;
	private String type;

	public String getRequestContent1Br(){
		return requestContent1.replaceAll(",", "<br>");
	}

	public String getRequestContent2Br(){
		return requestContent2.replaceAll(",", "<br>");
	}

	public String getRequestContent3Br(){
		return requestContent3.replaceAll(",", "<br>");
	}

	public String getRequestContent4Br(){
		return requestContent4.replaceAll(",", "<br>");
	}

	public String getRequestContent5Br(){
		return requestContent5.replaceAll(",", "<br>");
	}

	public String getRequestContent6Br(){
		return requestContent6.replaceAll(",", "<br>");
	}
	public String getRequestContent7Plus(){
		 if(requestContent7.length() >= 20){
			 return requestContent7.substring(0,20)+"...";
		};
		return requestContent7;
	}	

}
