package com.room.bbc.dto;

import java.sql.Timestamp;

public class RoomSearchDto {
	
	String userId;
	String roomId;
	String roomTitle;
	String roomContent;
	String roomPrice;
	String roomCapa;
	String roomAddress;
	String roomAddressDetail;
	String roomCheckIn;
	String roomCheckOut;
	String roomImage;
	String roomImageReal;
	Timestamp roomDeleteDate;
	String roomGpsx;
	String roomGpsy;
	String roomReviewRate;
	
	int rowCount;
	
	String SearchBar;
	String SearchBox;
	
	
	public RoomSearchDto() {
		// TODO Auto-generated constructor stub
	}
	

	public RoomSearchDto(String searchBar, String searchBox) {
		super();
		SearchBar = searchBar;
		SearchBox = searchBox;
	}

	public RoomSearchDto(String roomId, String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal, String roomReviewRate) {
		super();
		this.roomId = roomId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomPrice = roomPrice;
		this.roomCapa = roomCapa;
		this.roomAddress = roomAddress;
		this.roomAddressDetail = roomAddressDetail;
		this.roomCheckIn = roomCheckIn;
		this.roomCheckOut = roomCheckOut;
		this.roomImage = roomImage;
		this.roomImageReal = roomImageReal;
		this.roomReviewRate =roomReviewRate;
	}

	public RoomSearchDto(String roomId, String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal) {
		super();
		this.roomId = roomId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomPrice = roomPrice;
		this.roomCapa = roomCapa;
		this.roomAddress = roomAddress;
		this.roomAddressDetail = roomAddressDetail;
		this.roomCheckIn = roomCheckIn;
		this.roomCheckOut = roomCheckOut;
		this.roomImage = roomImage;
		this.roomImageReal = roomImageReal;
	}


	public RoomSearchDto(String roomId, String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal, String roomGpsx, String roomGpsy) {
		super();
		this.roomId = roomId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomPrice = roomPrice;
		this.roomCapa = roomCapa;
		this.roomAddress = roomAddress;
		this.roomAddressDetail = roomAddressDetail;
		this.roomCheckIn = roomCheckIn;
		this.roomCheckOut = roomCheckOut;
		this.roomImage = roomImage;
		this.roomImageReal = roomImageReal;
		this.roomGpsx = roomGpsx;
		this.roomGpsy = roomGpsy;
	}


	public RoomSearchDto(int rowCount) {
		super();
		this.rowCount = rowCount;
	}







	
	
	
	
	
	

	public Timestamp getRoomDeleteDate() {
		return roomDeleteDate;
	}


	public void setRoomDeleteDate(Timestamp roomDeleteDate) {
		this.roomDeleteDate = roomDeleteDate;
	}


	public String getRoomReviewRate() {
		return roomReviewRate;
	}


	public void setRoomReviewRate(String roomReviewRate) {
		this.roomReviewRate = roomReviewRate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getRoomId() {
		return roomId;
	}


	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}


	public String getRoomTitle() {
		return roomTitle;
	}


	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}


	public String getRoomContent() {
		return roomContent;
	}


	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}


	public String getRoomPrice() {
		return roomPrice;
	}


	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}


	public String getRoomCapa() {
		return roomCapa;
	}


	public void setRoomCapa(String roomCapa) {
		this.roomCapa = roomCapa;
	}


	public String getRoomAddress() {
		return roomAddress;
	}


	public void setRoomAddress(String roomAddress) {
		this.roomAddress = roomAddress;
	}


	public String getRoomAddressDetail() {
		return roomAddressDetail;
	}


	public void setRoomAddressDetail(String roomAddressDetail) {
		this.roomAddressDetail = roomAddressDetail;
	}


	public String getRoomCheckIn() {
		return roomCheckIn;
	}


	public void setRoomCheckIn(String roomCheckIn) {
		this.roomCheckIn = roomCheckIn;
	}


	public String getRoomCheckOut() {
		return roomCheckOut;
	}


	public void setRoomCheckOut(String roomCheckOut) {
		this.roomCheckOut = roomCheckOut;
	}


	public String getRoomImage() {
		return roomImage;
	}


	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;
	}


	public String getRoomImageReal() {
		return roomImageReal;
	}


	public void setRoomImageReal(String roomImageReal) {
		this.roomImageReal = roomImageReal;
	}


	

	public int getRowCount() {
		return rowCount;
	}


	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}


	public String getSearchBar() {
		return SearchBar;
	}


	public void setSearchBar(String searchBar) {
		SearchBar = searchBar;
	}


	public String getSearchBox() {
		return SearchBox;
	}


	public void setSearchBox(String searchBox) {
		SearchBox = searchBox;
	}


	public String getRoomGpsx() {
		return roomGpsx;
	}


	public void setRoomGpsx(String roomGpsx) {
		this.roomGpsx = roomGpsx;
	}


	public String getRoomGpsy() {
		return roomGpsy;
	}


	public void setRoomGpsy(String roomGpsy) {
		this.roomGpsy = roomGpsy;
	}
	
	
	
	
	

}
