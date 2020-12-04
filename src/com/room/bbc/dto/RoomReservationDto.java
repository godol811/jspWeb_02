package com.room.bbc.dto;

public class RoomReservationDto {
	String bookId;
	String userId;
	String roomTitle;
	String roomContent;
	String bookCheckInDate;
	String bookCheckOutDate;
	String bookCapa;
	String roomImage;
	String roomPriceTotal;
	String roomAddress;
	String roomAddressDetail;
	
	
	public RoomReservationDto() {
		// TODO Auto-generated constructor stub
	}

	
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

	
	public RoomReservationDto(String userId, String roomTitle, String roomContent, String bookCheckInDate,
			String bookCheckOutDate, String bookCapa, String roomImage, String roomPriceTotal, String roomAddress,
			String roomAddressDetail) {
		super();
		this.userId = userId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.bookCheckInDate = bookCheckInDate;
		this.bookCheckOutDate = bookCheckOutDate;
		this.bookCapa = bookCapa;
		this.roomImage = roomImage;
		this.roomPriceTotal = roomPriceTotal;
		this.roomAddress = roomAddress;
		this.roomAddressDetail = roomAddressDetail;
	}


	public String getBookId() {
		return bookId;
	}


	public void setBookId(String bookId) {
		this.bookId = bookId;
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


	public String getRoomImage() {
		return roomImage;
	}


	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;
	}


	public String getRoomPriceTotal() {
		return roomPriceTotal;
	}


	public void setRoomPriceTotal(String roomPriceTotal) {
		this.roomPriceTotal = roomPriceTotal;
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

	
	
}
