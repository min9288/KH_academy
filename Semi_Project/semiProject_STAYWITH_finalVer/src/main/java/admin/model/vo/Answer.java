package admin.model.vo;

public class Answer 
{
	private int a_No;
	private int q_No;
	
	private String a_Content;
	private String a_Date;	
	
	
	public Answer(int a_No, int q_No, String a_Content, String a_Date) {
		super();
		this.a_No = a_No;
		this.q_No = q_No;
		this.a_Content = a_Content;
		this.a_Date = a_Date;
	}
	
	public int getA_No() {
		return a_No;
	}
	public void setA_No(int a_No) {
		this.a_No = a_No;
	}
	public int getQ_No() {
		return q_No;
	}
	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}
	public String getA_Content() {
		return a_Content;
	}
	public void setA_Content(String a_Content) {
		this.a_Content = a_Content;
	}
	public String getA_Date() {
		return a_Date;
	}
	public void setA_Date(String a_Date) {
		this.a_Date = a_Date;
	}
}
