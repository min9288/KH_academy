package lifestyle.model.vo;

public class Lifestyle {
	private int lfNo;
	private String lfCategory;
	private String lfTitle;
	private String lfContent;
	private int lfStatus;
	private String filepath;
	private String filename;
	private String thumbnail;
	public Lifestyle() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Lifestyle(int lfNo, String lfCategory, String lfTitle, String lfContent, int lfStatus, String filepath,
			String filename, String thumbnail) {
		super();
		this.lfNo = lfNo;
		this.lfCategory = lfCategory;
		this.lfTitle = lfTitle;
		this.lfContent = lfContent;
		this.lfStatus = lfStatus;
		this.filepath = filepath;
		this.filename = filename;
		this.thumbnail = thumbnail;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getLfNo() {
		return lfNo;
	}
	public void setLfNo(int lfNo) {
		this.lfNo = lfNo;
	}
	public String getLfCategory() {
		return lfCategory;
	}
	public void setLfCategory(String lfCategory) {
		this.lfCategory = lfCategory;
	}
	public String getLfTitle() {
		return lfTitle;
	}
	public void setLfTitle(String lfTitle) {
		this.lfTitle = lfTitle;
	}
	public String getLfContent() {
		return lfContent;
	}
	public void setLfContent(String lfContent) {
		this.lfContent = lfContent;
	}
	public int getLfStatus() {
		return lfStatus;
	}
	public void setLfStatus(int lfStatus) {
		this.lfStatus = lfStatus;
	}
	
	
}
