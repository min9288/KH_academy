package lifestyle.model.vo;

public class LfReview {
	private int lfRNo;
	private String reviewWriter;
	private String reviewContent;
	private String reviewDate;
	private int star;
	private String resNo;
	private int lfNo;
	private String lifeName;
	private String resDate;
	public LfReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LfReview(int lfRNo, String reviewWriter, String reviewContent, String reviewDate, int star, String resNo, int lfNo, String lifeName,
			String resDate) {
		super();
		this.lfRNo = lfRNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.star = star;
		this.resNo = resNo;
		this.lfNo = lfNo;
		this.lifeName = lifeName;
		this.resDate = resDate;
	}
	public int getLfRNo() {
		return lfRNo;
	}
	public void setLfRNo(int lfRNo) {
		this.lfRNo = lfRNo;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
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
	public String getLifeName() {
		return lifeName;
	}
	public void setLifeName(String lifeName) {
		this.lifeName = lifeName;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	
}
