package com.room.bbc.dto;

public class UserJoinDto {
	private String userName;
	private String userId;
	private String userPw;
	private String userPwCheck;
	private String userEmail;
	private String userTel;
	private String userAddress;
	private String userAddressDetail;
	
	private String fieldCheckmessage;

	
	public UserJoinDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public UserJoinDto(String userName, String userId, String userPw, String userPwCheck, String userEmail,
			String userTel, String userAddress, String userAddressDetail, String fieldCheckmessage) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userPwCheck = userPwCheck;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userAddressDetail = userAddressDetail;
		this.fieldCheckmessage = fieldCheckmessage;
	}




	public UserJoinDto(String userName, String userId, String userPw, String userPwCheck, String userEmail,
			String userTel, String userAddress, String fieldCheckmessage) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userPwCheck = userPwCheck;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.fieldCheckmessage = fieldCheckmessage;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getUserPwCheck() {
		return userPwCheck;
	}
	public void setUserPwCheck(String userPwCheck) {
		this.userPwCheck = userPwCheck;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getFieldCheckmessage() {
		return fieldCheckmessage;
	}
	public void setFieldCheckmessage(String fieldCheckmessage) {
		this.fieldCheckmessage = fieldCheckmessage;
	}
	public String getUserAddressDetail() {
		return userAddressDetail;
	}
	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}
	
	
	
	
}