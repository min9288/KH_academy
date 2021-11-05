package dining.model.vo;

import java.util.ArrayList;

public class DiningRes {
	private String resNo;
	private int diningNo;
	private String diningName;
	private String memberId;
	private int adtCnt;
	private int kidCnt;
	private String rDate;
	private String resTime;
	private int timeType;
	private int seatType;
	private int resStatus;
	private ArrayList<ResInfo> resInfo;
	public DiningRes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningRes(String resNo, int diningNo, String memberId, int adtCnt, int kidCnt, String rDate,
			String resTime, int timeType, int seatType, int resStatus, ArrayList<ResInfo> resInfo, String diningName) {
		super();
		this.resNo = resNo;
		this.diningNo = diningNo;
		this.memberId = memberId;
		this.adtCnt = adtCnt;
		this.kidCnt = kidCnt;
		this.rDate = rDate;
		this.resTime = resTime;
		this.timeType = timeType;
		this.seatType = seatType;
		this.resStatus = resStatus;
		this.resInfo = resInfo;
		this.diningName = diningName;
	}
	public String getResNo() {
		return resNo;
	}
	public void setResNo(String resNo) {
		this.resNo = resNo;
	}
	public int getDiningNo() {
		return diningNo;
	}
	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getAdtCnt() {
		return adtCnt;
	}
	public void setAdtCnt(int adtCnt) {
		this.adtCnt = adtCnt;
	}
	public int getKidCnt() {
		return kidCnt;
	}
	public void setKidCnt(int kidCnt) {
		this.kidCnt = kidCnt;
	}
	
	public String getRDate() {
		return rDate;
	}
	public void setRDate(String resDate) {
		this.rDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public int getTimeType() {
		return timeType;
	}
	public void setTimeType(int timeType) {
		this.timeType = timeType;
	}
	public int getSeatType() {
		return seatType;
	}
	public void setSeatType(int seatType) {
		this.seatType = seatType;
	}
	public int getResStatus() {
		return resStatus;
	}
	public void setResStatus(int resStatus) {
		this.resStatus = resStatus;
	}
	public ArrayList<ResInfo> getResInfo() {
		return resInfo;
	}
	public void setResInfo(ArrayList<ResInfo> resInfo) {
		this.resInfo = resInfo;
	}
	public String getDiningName() {
		return diningName;
	}
	public void setDiningName(String diningName) {
		this.diningName = diningName;
	}
	
}
