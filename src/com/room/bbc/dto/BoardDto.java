package com.room.bbc.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	String boardId;
	String boardTitle;
	String boardContent;
	Timestamp boardInsertDate;
	String userInfo_userId;
	
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}


	public BoardDto(String boardId, String boardTitle, String boardContent, Timestamp boardInsertDate,
			String userInfo_userId) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardInsertDate = boardInsertDate;
		this.userInfo_userId = userInfo_userId;
	}


	public String getBoardId() {
		return boardId;
	}


	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public Timestamp getBoardInsertDate() {
		return boardInsertDate;
	}


	public void setBoardInsertDate(Timestamp boardInsertDate) {
		this.boardInsertDate = boardInsertDate;
	}


	public String getUserInfo_userId() {
		return userInfo_userId;
	}


	public void setUserInfo_userId(String userInfo_userId) {
		this.userInfo_userId = userInfo_userId;
	}
	
	

}
