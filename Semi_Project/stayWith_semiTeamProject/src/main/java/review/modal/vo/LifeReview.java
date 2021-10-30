package review.modal.vo;

public class LifeReview {
	private int lfRNo;
	private String reviewWriter;
	private String reviewContent;
	private String reviewDate;
	private int star;
	private String resNo;
	private int lfNo;
	private String lfName;
	private String resDate;
	
	public LifeReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public LifeReview(int lfRNo, String reviewWriter, String reviewContent, String reviewDate, int star, String resNo,
			int lfNo, String lfName, String resDate) {
		super();
		this.lfRNo = lfRNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.star = star;
		this.resNo = resNo;
		this.lfNo = lfNo;
		this.lfName = lfName;
		this.resDate = resDate;
	}



	public String getLifeImg(){
		if(lfName.equals("실내골프장")) {
			return "img/review/실내골프장.jpg";
		}else if(lfName.equals("실내수영장")) {
			return "img/review/실내체육관.jpg";
		}else if(lfName.equals("실내체육관")) {
			return "img/review/실내체육관.jpg";
		}else if(lfName.equals("실내수영장")) {
			return "img/review/실내수영장.jpg";
		}else if(lfName.equals("실내사우나")) {
			return "img/review/실내사우나.jpg";
		}else if(lfName.equals("어번아일랜드")) {
			return "img/review/어반아일랜드.jpg";
		}else if(lfName.equals("어번 아일랜드")) {
			return "img/review/어반아일랜드.jpg";
		}else if(lfName.equals("카바나")) {
			return "img/review/카바나.jpg";
		}else {
			return null;
		}
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



	public String getLfName() {
		return lfName;
	}



	public void setLfName(String lfName) {
		this.lfName = lfName;
	}



	public String getResDate() {
		return resDate;
	}



	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	
	
}
