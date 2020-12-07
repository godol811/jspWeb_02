package com.room.bbc.dto;

import java.sql.Timestamp;

public class RoomReviewDto {
	String reviewId;
	String userinfo_Userid;
	String room_Roomid;
	String reviewTitle;
	String reviewContent;
	double reviewRate;
    String reviewDate;
    String bookId;
	
    public RoomReviewDto() {
		// TODO Auto-generated constructor stub
	}
    



	public RoomReviewDto(String reviewId, String bookId) {
		super();
		this.reviewId = reviewId;
		this.bookId = bookId;
	}




	public RoomReviewDto(String reviewId, String userinfo_Userid, String room_Roomid,
			String reviewContent, double reviewRate, String reviewDate) {
		super();
		this.reviewId = reviewId;
		this.userinfo_Userid = userinfo_Userid;
		this.room_Roomid = room_Roomid;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
		this.reviewDate = reviewDate;
	}




	public String getReviewId() {
		return reviewId;
	}




	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}




	public String getUserinfo_Userid() {
		return userinfo_Userid;
	}




	public void setUserinfo_Userid(String userinfo_Userid) {
		this.userinfo_Userid = userinfo_Userid;
	}




	public String getRoom_Roomid() {
		return room_Roomid;
	}




	public void setRoom_Roomid(String room_Roomid) {
		this.room_Roomid = room_Roomid;
	}




	public String getReviewTitle() {
		return reviewTitle;
	}




	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}




	public String getReviewContent() {
		return reviewContent;
	}




	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}




	public double getReviewRate() {
		return reviewRate;
	}




	public void setReviewRate(double reviewRate) {
		this.reviewRate = reviewRate;
	}




	public String getReviewDate() {
		return reviewDate;
	}




	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}




	public String getBookId() {
		return bookId;
	}




	public void setBookId(String bookId) {
		this.bookId = bookId;
	}



    
}
