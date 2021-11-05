package review.modal.vo;

public class DiningReview {
	private int dRNo;
	private String reviewWriter;
	private String reviewContent;
	private String reviewDate;
	private int star;
	private String resNo;
	private int diningNo;
	private String diningName;
	private String resDate;
	private String diningImg;
	
	public DiningReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DiningReview(int dRNo, String reviewWriter, String reviewContent, String reviewDate, int star, String resNo,
			int diningNo, String diningName, String resDate, String diningImg) {
		super();
		this.dRNo = dRNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.star = star;
		this.resNo = resNo;
		this.diningNo = diningNo;
		this.diningName = diningName;
		this.resDate = resDate;
		this.diningImg = diningImg;
	}

	public int getdRNo() {
		return dRNo;
	}

	public void setdRNo(int dRNo) {
		this.dRNo = dRNo;
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

	public int getDiningNo() {
		return diningNo;
	}

	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}

	public String getDiningName() {
		return diningName;
	}

	public void setDiningName(String diningName) {
		this.diningName = diningName;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getDiningImg() {
		return diningImg;
	}

	public void setDiningImg(String diningImg) {
		this.diningImg = diningImg;
	}
	
	
	
}
