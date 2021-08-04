package kh.java.func;

public class GenericEx2<T, E> {
	private T data1;
	private E data2;
	private String data3;
	private int data4;
	
	public GenericEx2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GenericEx2(T data1, E data2, String data3, int data4) {
		super();
		this.data1 = data1;
		this.data2 = data2;
		this.data3 = data3;
		this.data4 = data4;
	}
	public T getData1() {
		return data1;
	}
	public void setData1(T data1) {
		this.data1 = data1;
	}
	public E getData2() {
		return data2;
	}
	public void setData2(E data2) {
		this.data2 = data2;
	}
	public String getData3() {
		return data3;
	}
	public void setData3(String data3) {
		this.data3 = data3;
	}
	public int getData4() {
		return data4;
	}
	public void setData4(int data4) {
		this.data4 = data4;
	}
	
	
}
