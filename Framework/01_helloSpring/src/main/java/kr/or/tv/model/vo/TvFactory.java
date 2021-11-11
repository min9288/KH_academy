package kr.or.tv.model.vo;

public class TvFactory {
	public TV getTV(String brand) {
		if(brand.equals("samsung")) {
			return new SamsungTV();
		} else if(brand.equals("lg")) {
			return new LgTV();
		}
		return null;
	}
}
