package lifestyle.model.vo;

import java.util.Date;

public class ResLifestyle {
	private String resNo;
	private int lfNo;
	private String memberId;
	private int resPeople;
	private String resDate;
	private String resTime;
	private int status;
	private int price;
	public ResLifestyle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResLifestyle(String resNo, int lfNo, String memberId, int resPeople, String resDate, String resTime,
			int status, int price) {
		super();
		this.resNo = resNo;
		this.lfNo = lfNo;
		this.memberId = memberId;
		this.resPeople = resPeople;
		this.resDate = resDate;
		this.resTime = resTime;
		this.status = status;
		this.price = price;
	}
	
	public ResLifestyle(String resDate) {
		super();
		this.resDate = resDate;
	}
	public String getResNo() {
		return resNo;
	}
	public void setResNo(String resNo) {
		this.resNo = resNo;
	}
	public int getLfNo() {
		return lfNo;
	}
	public void setLfNo(int lfNo) {
		this.lfNo = lfNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getResPeople() {
		return resPeople;
	}
	public void setResPeople(int resPeople) {
		this.resPeople = resPeople;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
