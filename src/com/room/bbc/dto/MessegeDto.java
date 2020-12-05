package com.room.bbc.dto;

import java.sql.Timestamp;

public class MessegeDto {
	
	String messageId;
	String messageContent;
	String userinfo_userId;
	String room_roomId;
	String room_userId;
	Timestamp messageDate;
	
	
	public MessegeDto() {
		// TODO Auto-generated constructor stub
	}


	public MessegeDto(String messageId, String messageContent, String userinfo_userId, String room_roomId,
			String room_userId, Timestamp messageDate) {
		super();
		this.messageId = messageId;
		this.messageContent = messageContent;
		this.userinfo_userId = userinfo_userId;
		this.room_roomId = room_roomId;
		this.room_userId = room_userId;
		this.messageDate = messageDate;
	}


	public String getMessageId() {
		return messageId;
	}


	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public String getUserinfo_userId() {
		return userinfo_userId;
	}


	public void setUserinfo_userId(String userinfo_userId) {
		this.userinfo_userId = userinfo_userId;
	}


	public String getRoom_roomId() {
		return room_roomId;
	}


	public void setRoom_roomId(String room_roomId) {
		this.room_roomId = room_roomId;
	}


	public String getRoom_userId() {
		return room_userId;
	}


	public void setRoom_userId(String room_userId) {
		this.room_userId = room_userId;
	}


	public Timestamp getMessageDate() {
		return messageDate;
	}


	public void setMessageDate(Timestamp messageDate) {
		this.messageDate = messageDate;
	}
	
	
	

}
