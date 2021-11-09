package member.model.vo;

public class PwSearchVo {
	private String memberId;
	private String phone;
	public PwSearchVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PwSearchVo(String memberId, String phone) {
		super();
		this.memberId = memberId;
		this.phone = phone;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
