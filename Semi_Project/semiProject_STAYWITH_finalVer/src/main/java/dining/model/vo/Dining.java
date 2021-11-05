package dining.model.vo;

import java.util.ArrayList;

public class Dining {
	private int diningNo;
	private int diningType;
	private String diningName;
	private String diningInfo;
	private String diningLoc;
	private String diningIntro;
	private int seatCnt;
	private int roomCnt;
	private String thumbnailImg;
	private String detailedImg;
	private String tel;
	private ArrayList<DiningTime> timeList;
	private ArrayList<DiningReview> reviewList;
	public Dining() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dining(int diningNo, int diningType, String diningName, String diningInfo, String diningLoc,
			String diningIntro, int seatCnt, int roomCnt, String thumbnailImg, String detailedImg, ArrayList<DiningTime> timeList, String tel, ArrayList<DiningReview> reviewList) {
		super();
		this.diningNo = diningNo;
		this.diningType = diningType;
		this.diningName = diningName;
		this.diningInfo = diningInfo;
		this.diningLoc = diningLoc;
		this.diningIntro = diningIntro;
		this.seatCnt = seatCnt;
		this.roomCnt = roomCnt;
		this.thumbnailImg = thumbnailImg;
		this.detailedImg = detailedImg;
		this.timeList = timeList;
		this.tel = tel;
		this.reviewList = reviewList;
	}
	public Dining(int diningNo, int diningType, String diningName, String diningInfo, String diningLoc,
			String diningIntro, int seatCnt, int roomCnt, String thumbnailImg, String detailedImg) {
		super();
		this.diningNo = diningNo;
		this.diningType = diningType;
		this.diningName = diningName;
		this.diningInfo = diningInfo;
		this.diningLoc = diningLoc;
		this.diningIntro = diningIntro;
		this.seatCnt = seatCnt;
		this.roomCnt = roomCnt;
		this.thumbnailImg = thumbnailImg;
		this.detailedImg = detailedImg;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public ArrayList<DiningTime> getTimeList() {
		return timeList;
	}
	public void setTimeList(ArrayList<DiningTime> timeList) {
		this.timeList = timeList;
	}
	public int getDiningNo() {
		return diningNo;
	}
	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}
	public int getDiningType() {
		return diningType;
	}
	public void setDiningType(int diningType) {
		this.diningType = diningType;
	}
	public String getDiningName() {
		return diningName;
	}
	public void setDiningName(String diningName) {
		this.diningName = diningName;
	}
	public String getDiningInfoBr() {
		return diningInfo.replaceAll("<br>", "");
	}
	public String getDiningInfo() {
		return diningInfo;
	}
	public void setDiningInfo(String diningInfo) {
		this.diningInfo = diningInfo;
	}
	public String getDiningLoc() {
		return diningLoc;
	}
	public void setDiningLoc(String diningLoc) {
		this.diningLoc = diningLoc;
	}
	public String getDiningIntroBr() {
		return diningIntro.replaceAll("<br>", "");
	}
	public String getDiningIntro() {
		return diningIntro;
	}
	public void setDiningIntro(String diningIntro) {
		this.diningIntro = diningIntro;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	public int getRoomCnt() {
		return roomCnt;
	}
	public void setRoomCnt(int roomCnt) {
		this.roomCnt = roomCnt;
	}
	public String getThumbnailImg() {
		return thumbnailImg;
	}
	public void setThumbnailImg(String thumbnailImg) {
		this.thumbnailImg = thumbnailImg;
	}
	public String getDetailedImg() {
		return detailedImg;
	}
	public void setDetailedImg(String detailedImg) {
		this.detailedImg = detailedImg;
	}
	public ArrayList<DiningReview> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<DiningReview> reviewList) {
		this.reviewList = reviewList;
	}
	
}
