package kh.java.func;

public class Tv {
	// ũ��, ä��, ����, ����
	// ���������� ���������� �޸� �ʱ�ȭ �ʿ����
	private int size, ch, vol; // �ʱⰪ 0
	private boolean power; 	   // �ʱⰪ false
	
	// �⺻ ������
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
	
	
	// getter ����� ���
	// �������������� : public
	// ��ȯ�� : ��� ������ �ڷ����� ����
	// �޼ҵ��̸� : get ������ -> ī��ǥ���
	// �ŰԺ��� : ����
	// �ҽ��ڵ� : return ������;
	
	public int getVol() {
		return vol;
	}
	
	// setter ����� ���
	// �������������� : public
	// ��ȯ�� : void
	// �޼ҵ� �̸� : set ������ -> ī��ǥ���
	// �Ű����� : ��� ���� �ڷ����� ������ ���� 1��
	// �ҽ��ڵ� : �������� = �Ű�����;
	public void setVol(int vol) {
		// �������� = ��������
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
		System.out.println("���� ä�� : "+ch);
	}
	public void tv_channel_DOWN() {
		--ch;
		System.out.println("���� ä�� : "+ch);
	}
	public void tv_volume_UP() {
		if (vol < 100 ) {
		++vol;
		}
		System.out.println("���� ���� : "+vol);
	}
	public void tv_volume_DOWN() {
		if (vol != 0) {
		--vol;
		}
		System.out.println("���� ���� : "+vol);
	}
	public void tv_power() {
		power = !power;
		if(power) {
			System.out.println("������ �������ϴ�.");
		}else {
			System.out.println("������ �������ϴ�.");
		}
	}
}
