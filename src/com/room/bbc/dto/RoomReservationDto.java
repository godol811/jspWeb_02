package com.room.bbc.dto;

public class RoomReservationDto {
	
	public RoomReservationDto(String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal, String roomId) {
		super();
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
		this.roomId = roomId;
	}
	
	
	public RoomReservationDto(String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal) {
		super();
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
 
	
	
	
	public RoomReservationDto() {
	// TODO Auto-generated constructor stub
}
	String bookId;
	String roomTitle;
	String roomContent;
	String bookCheckInDate;
	String bookCheckOutDate;
	String bookCapa;
	String roomImage;
	String roomPrice;
	String roomCapa;
	String roomAddress;
	String roomAddressDetail;
	String roomCheckIn;
	String roomCheckOut;
	String roomImageReal;
	String roomId;	
	
	
	

	public RoomReservationDto(String bookId, String roomTitle, String roomContent, String bookCheckInDate,
			String bookCheckOutDate, String bookCapa, String roomImage) {
		super();
		this.bookId = bookId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.bookCheckInDate = bookCheckInDate;
		this.bookCheckOutDate = bookCheckOutDate;
		this.bookCapa = bookCapa;
		this.roomImage = roomImage;
	}


	public String getBookId() {
		return bookId;
	}


	public void setBookId(String bookId) {
		this.bookId = bookId;
	}


	public String getBookCheckInDate() {
		return bookCheckInDate;
	}


	public void setBookCheckInDate(String bookCheckInDate) {
		this.bookCheckInDate = bookCheckInDate;
	}


	public String getBookCheckOutDate() {
		return bookCheckOutDate;
	}


	public void setBookCheckOutDate(String bookCheckOutDate) {
		this.bookCheckOutDate = bookCheckOutDate;
	}


	public String getBookCapa() {
		return bookCapa;
	}


	public void setBookCapa(String bookCapa) {
		this.bookCapa = bookCapa;
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
	public String getRoomId() {
		return roomId;
	}


	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	


	
	
}
