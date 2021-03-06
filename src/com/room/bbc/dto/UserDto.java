package com.room.bbc.dto;

import java.sql.Timestamp;

public class UserDto {
	
	String userId;
	String userPw;
	String userName;
	String userAddress;
	String userTel;
	Timestamp userInsertDate;
	String userState;
	Timestamp userDeleteDate;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(String userId, String userPw, String userName, String userAddress, String userTel,
			Timestamp userInsertDate, String userState, Timestamp userDeleteDate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userTel = userTel;
		this.userInsertDate = userInsertDate;
		this.userState = userState;
		this.userDeleteDate = userDeleteDate;
	}
	
	public UserDto(String userId) {
		super();
		this.userId = userId;
	
	}

	
	
	public UserDto(String userId,String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
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

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public Timestamp getUserInsertDate() {
		return userInsertDate;
	}

	public void setUserInsertDate(Timestamp userInsertDate) {
		this.userInsertDate = userInsertDate;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public Timestamp getUserDeleteDate() {
		return userDeleteDate;
	}

	public void setUserDeleteDate(Timestamp userDeleteDate) {
		this.userDeleteDate = userDeleteDate;
	}
	
	

}
