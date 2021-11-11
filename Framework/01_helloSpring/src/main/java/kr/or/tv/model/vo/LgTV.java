package kr.or.tv.model.vo;

public class LgTV implements TV{
	public void powerOn() {
		System.out.println("LgTV---전원 켬");
	}
	public void powerOff() {
		System.out.println("LgTV---전원 끔");
	}
	public void volumeUp() {
		System.out.println("LgTV---소리 키움");
	}
	public void volumeDown() {
		System.out.println("LgTV---소리 줄임");
	}
}
