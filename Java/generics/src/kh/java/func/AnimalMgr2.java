package kh.java.func;

public class AnimalMgr2<T> {
	private T data;

	public AnimalMgr2() {
		super();
		
	}

	public AnimalMgr2(T data) {
		super();
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
