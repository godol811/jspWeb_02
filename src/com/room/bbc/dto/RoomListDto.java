package com.room.bbc.dto;

public class RoomListDto {
	String userId;
	String roomTitle;
	String roomContent;
	String roomPrice;
	String roomCapa;
	String roomAddress;
	String roomCheckIn;
	String roomCheckOut;
	String roomImage;
	
	
	public RoomListDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public RoomListDto(String roomTitle, String roomContent, String roomPrice, String roomCapa, String roomAddress,
			String roomCheckIn, String roomCheckOut, String roomImage) {
		super();
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomPrice = roomPrice;
		this.roomCapa = roomCapa;
		this.roomAddress = roomAddress;
		this.roomCheckIn = roomCheckIn;
		this.roomCheckOut = roomCheckOut;
		this.roomImage = roomImage;
	}




	public RoomListDto(String userId, String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomCheckIn, String roomCheckOut, String roomImage) {
		super();
		this.userId = userId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomPrice = roomPrice;
		this.roomCapa = roomCapa;
		this.roomAddress = roomAddress;
		this.roomCheckIn = roomCheckIn;
		this.roomCheckOut = roomCheckOut;
		this.roomImage = roomImage;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
	
	
}
