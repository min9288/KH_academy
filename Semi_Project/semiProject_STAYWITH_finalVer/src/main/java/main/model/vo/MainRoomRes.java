package main.model.vo;

public class MainRoomRes {
	private String checkin;
	private String checkout;
	private int adult;
	private int kid;
	public MainRoomRes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainRoomRes(String checkin, String checkout, int adult, int kid) {
		super();
		this.checkin = checkin;
		this.checkout = checkout;
		this.adult = adult;
		this.kid = kid;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	
}
