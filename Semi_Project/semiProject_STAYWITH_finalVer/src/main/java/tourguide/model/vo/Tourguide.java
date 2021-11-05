package tourguide.model.vo;

public class Tourguide {
	private int tgNo;
	private String tgTitle;
	private String tgContent;
	private String tgLocation;
	private String tgPhone;
	private String filepath;
	private int  tgSort;

	public Tourguide() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tourguide(int tgNo, String tgTitle, String tgContent, String tgLocation, String tgPhone, String filepath,
			int tgSort) {
		super();
		this.tgNo = tgNo;
		this.tgTitle = tgTitle;
		this.tgContent = tgContent;
		this.tgLocation = tgLocation;
		this.tgPhone = tgPhone;
		this.filepath = filepath;
		this.tgSort = tgSort;
	}
	public String getTgContentBr() {
		return tgContent.replaceAll("\r\n", "<br>");
	}
	public int getTgNo() {
		return tgNo;
	}
	public void setTgNo(int tgNo) {
		this.tgNo = tgNo;
	}
	public String getTgTitle() {
		return tgTitle;
	}
	public void setTgTitle(String tgTitle) {
		this.tgTitle = tgTitle;
	}
	public String getTgContent() {
		return tgContent;
	}
	public void setTgContent(String tgContent) {
		this.tgContent = tgContent;
	}
	public String getTgLocation() {
		return tgLocation;
	}
	public void setTgLocation(String tgLocation) {
		this.tgLocation = tgLocation;
	}
	public String getTgPhone() {
		return tgPhone;
	}
	public void setTgPhone(String tgPhone) {
		this.tgPhone = tgPhone;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getTgSort() {
		return tgSort;
	}
	public void setTgSort(int tgSort) {
		this.tgSort = tgSort;
	}
	
}
