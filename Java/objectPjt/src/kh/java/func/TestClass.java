package kh.java.func;

public class TestClass implements Cloneable{
	
	@Override
	public String toString() {
		return "TestClass ¿‘¥œ¥Ÿ!!!!";
	}
	public Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
}
