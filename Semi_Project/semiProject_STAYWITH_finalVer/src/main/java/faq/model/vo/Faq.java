package faq.model.vo;

public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private int faqSort;
	public Faq() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Faq(int faqNo, String faqTitle, String faqContent, int faqSort) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqSort = faqSort;
	}

	public String getFaqContentBr() {
		return faqContent.replaceAll("\r\n", "<br>");
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public int getFaqSort() {
		return faqSort;
	}
	public void setFaqSort(int faqSort) {
		this.faqSort = faqSort;
	}
	
}
