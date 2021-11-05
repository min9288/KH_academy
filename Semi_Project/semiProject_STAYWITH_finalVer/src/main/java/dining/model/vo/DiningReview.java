package dining.model.vo;

public class DiningReview {
	private int drNo;
	private String reviewWriter;
	private String reviewContent;
	private String reviewDate;
	private int star;
	private int diningNo;
	public DiningReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningReview(int drNo, String reviewWriter, String reviewContent, String reviewDate, int star,
			int diningNo) {
		super();
		this.drNo = drNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.star = star;
		this.diningNo = diningNo;
	}
	public int getDrNo() {
		return drNo;
	}
	public void setDrNo(int drNo) {
		this.drNo = drNo;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContentBr() {
		return reviewContent.replaceAll("\r\n", "<br>");
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
	public int getDiningNo() {
		return diningNo;
	}
	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}
	
}
