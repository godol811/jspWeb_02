package com.room.bbc.dto;

import java.sql.Timestamp;

public class RoomReviewDto {
	int reviewId;
	String userinfo_Userid;
	int room_Roomid;
	String reviewTitle;
	String reviewContent;
	double reviewRate;
    Timestamp reviewDate;
	
    public RoomReviewDto() {
		// TODO Auto-generated constructor stub
	}

	public RoomReviewDto(int reviewId, String userinfo_Userid, int room_Roomid, String reviewTitle,
			String reviewContent, double reviewRate, Timestamp reviewDate) {
		super();
		this.reviewId = reviewId;
		this.userinfo_Userid = userinfo_Userid;
		this.room_Roomid = room_Roomid;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
		this.reviewDate = reviewDate;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getUserinfo_Userid() {
		return userinfo_Userid;
	}

	public void setUserinfo_Userid(String userinfo_Userid) {
		this.userinfo_Userid = userinfo_Userid;
	}

	public int getRoom_Roomid() {
		return room_Roomid;
	}

	public void setRoom_Roomid(int room_Roomid) {
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

	public Timestamp getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}
    
    
    
}
