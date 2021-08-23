package kr.or.iei.user.vo;

public class User {
	private int userCode;
	private String userId;
	private String userPw;
	private String userName;
	private int userAge;
	private String userPhone;
	
	public User() {
		super();
	}
	
	public User(String userPw, String userName, int userAge, String userPhone) {
		super();
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
		this.userPhone = userPhone;
	}
	
	public User(int userCode, String userId, String userPw, String userName, int userAge, String userPhone) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
		this.userPhone = userPhone;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	
	
}
