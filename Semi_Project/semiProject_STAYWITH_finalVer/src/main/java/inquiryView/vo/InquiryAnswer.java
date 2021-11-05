package inquiryView.vo;

public class InquiryAnswer {
	private int aNo;
	private int qNo;
	private String aContent;
	private String aDate;
	public InquiryAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InquiryAnswer(int aNo, int qNo, String aContent, String aDate) {
		super();
		this.aNo = aNo;
		this.qNo = qNo;
		this.aContent = aContent;
		this.aDate = aDate;
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	
	
}
