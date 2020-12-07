package com.room.bbc.dto;

import java.sql.Timestamp;

public class MessageDto {
	
	String messageId;
	Timestamp messageInsertDate;
	String userinfo_userId;
	String messageContent;
	String bookId;
	String room_userId;
	String room_roomId;
	String roomTitle;
	
	public MessageDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	


	public MessageDto(String messageContent,  String bookId, Timestamp messageInsertDate) {
		super();
		this.messageContent = messageContent;
		this.bookId    = bookId;
		this.messageInsertDate = messageInsertDate;
	}

	



	public MessageDto(String room_userId, String room_roomId, String bookId) {
		super();
		this.room_userId = room_userId;
		this.room_roomId = room_roomId;
		this.bookId = bookId;
	}





	public MessageDto(Timestamp messageInsertDate, String userinfo_userId, String messageContent) {
		super();
		this.messageInsertDate = messageInsertDate;
		this.userinfo_userId = userinfo_userId;
		this.messageContent = messageContent;
	}











	public MessageDto(String messageId, String messageContent, String userinfo_userId, String room_roomId,
			String room_userId, Timestamp messageInsertDate) {
		super();
		this.messageId = messageId;
		this.messageContent = messageContent;
		this.userinfo_userId = userinfo_userId;
		this.room_roomId = room_roomId;
		this.room_userId = room_userId;
		this.messageInsertDate = messageInsertDate;
	}


	public String getBookId() {
		return bookId;
	}





	public void setBookId(String bookId) {
		this.bookId = bookId;
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
		return messageInsertDate;
	}


	public void setMessageDate(Timestamp messageDate) {
		this.messageInsertDate = messageDate;
	}





	public Timestamp getMessageInsertDate() {
		return messageInsertDate;
	}





	public void setMessageInsertDate(Timestamp messageInsertDate) {
		this.messageInsertDate = messageInsertDate;
	}





	public String getRoomTitle() {
		return roomTitle;
	}





	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}
	
	
	

}
