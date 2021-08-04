package kh.java.func;

public class Tv {
	// 크기, 채널, 전원, 볼륨
	// 전역변수는 지역변수와 달리 초기화 필요없음
	private int size, ch, vol; // 초기값 0
	private boolean power; 	   // 초기값 false
	
	// 기본 생성자
	public Tv() {
		
	}
	
	public Tv(int size, boolean power, int ch, int vol) {
		this.size = size;
		this.power = power;
		this.ch = ch;
		this.vol = vol;
	}
	
	public Tv(int size) {
		this.size = size;
	}
	
	
	// getter 만드는 방법
	// 접근제어지시자 : public
	// 반환형 : 대상 변수의 자료형과 동일
	// 메소드이름 : get 변수명 -> 카멜표기법
	// 매게변수 : 없음
	// 소스코드 : return 변수명;
	
	public int getVol() {
		return vol;
	}
	
	// setter 만드는 방법
	// 접근제어지시자 : public
	// 반환형 : void
	// 메소드 이름 : set 변수명 -> 카멜표기법
	// 매개변수 : 대상 변수 자료형과 동일한 변수 1개
	// 소스코드 : 전역변수 = 매개변수;
	public void setVol(int vol) {
		// 전역변수 = 지역변수
		this.vol = vol;
		
	}
	
	public int getSize() {
		return size;
	}
	public boolean getPower() {
		return power;	
	}
	public void setPower(boolean power) {
		this.power = power;
	}
	public int getCh() {
		return ch;
	}
	public int setCh(int Ch) {
		this.ch = ch;
		return ch;
	}
	
	
	
	
	
	
	
	
	
	public void tv_size() {
		
	}
	public void tv_channel_UP() {
		++ch;
		System.out.println("현재 채널 : "+ch);
	}
	public void tv_channel_DOWN() {
		--ch;
		System.out.println("현재 채널 : "+ch);
	}
	public void tv_volume_UP() {
		if (vol < 100 ) {
		++vol;
		}
		System.out.println("현재 음량 : "+vol);
	}
	public void tv_volume_DOWN() {
		if (vol != 0) {
		--vol;
		}
		System.out.println("현재 음량 : "+vol);
	}
	public void tv_power() {
		power = !power;
		if(power) {
			System.out.println("전원이 켜졌습니다.");
		}else {
			System.out.println("전원이 꺼졌습니다.");
		}
	}
}
