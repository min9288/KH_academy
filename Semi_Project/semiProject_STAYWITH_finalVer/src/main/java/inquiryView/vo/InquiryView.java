package inquiryView.vo;

public class InquiryView {
	private int qNo;
	private String qCategory;
	private String qType;
	private String qAbout;
	private String qTitle;
	private String resNo;
	private String filepath;
	private String usedDate;
	private String qContent;
	private String qName;
	private String email;
	private String phone;
	private String home;
	private String qAuto;
	private String filename;
	private int aCount;
	
	public InquiryView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InquiryView(int qNo, String qCategory, String qType, String qAbout, String qTitle, String resNo,
			String filepath, String usedDate, String qContent, String qName, String email, String phone, String home,
			String qAuto, String filename, int aCount) {
		super();
		this.qNo = qNo;
		this.qCategory = qCategory;
		this.qType = qType;
		this.qAbout = qAbout;
		this.qTitle = qTitle;
		this.resNo = resNo;
		this.filepath = filepath;
		this.usedDate = usedDate;
		this.qContent = qContent;
		this.qName = qName;
		this.email = email;
		this.phone = phone;
		this.home = home;
		this.qAuto = qAuto;
		this.filename = filename;
		this.aCount = aCount;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

	public String getqAbout() {
		return qAbout;
	}

	public void setqAbout(String qAbout) {
		this.qAbout = qAbout;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getUsedDate() {
		return usedDate;
	}

	public void setUsedDate(String usedDate) {
		this.usedDate = usedDate;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getqAuto() {
		return qAuto;
	}

	public void setqAuto(String qAuto) {
		this.qAuto = qAuto;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	
}