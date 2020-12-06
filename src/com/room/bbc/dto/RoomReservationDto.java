package com.room.bbc.dto;

public class RoomReservationDto {
	
	String userId;
	String bookId;
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
	String roomId;
	String roomGpsx;
	String roomGpsy;
	String bookCheckInDate;
	String bookCheckOutDate;
	String bookCapa;
	String roomPriceTotal;
	
	public RoomReservationDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public RoomReservationDto(String bookId, String roomTitle, String roomContent, String bookCheckInDate,
			String bookCheckOutDate, String bookCapa, String roomImage, String roomId) {
		super();
		this.bookId = bookId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.bookCheckInDate = bookCheckInDate;
		this.bookCheckOutDate = bookCheckOutDate;
		this.bookCapa = bookCapa;
		this.roomImage = roomImage;
		this.roomId = roomId;
	}





	public RoomReservationDto(String roomTitle, String roomContent, String roomPrice, String roomCapa,
			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
			String roomImageReal, String roomId, String roomGpsx, String roomGpsy) {
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
		this.roomGpsx = roomGpsx;
		this.roomGpsy = roomGpsy;
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



	public RoomReservationDto(String userId, String bookCheckInDate, String bookCheckOutDate, String bookCapa,
			String roomId, String roomPriceTotal) {
		super();
		this.userId = userId;
		this.bookCheckInDate = bookCheckInDate;
		this.bookCheckOutDate = bookCheckOutDate;
		this.bookCapa = bookCapa;
		this.roomId = roomId;
		this.roomPriceTotal = roomPriceTotal;
	}



	public RoomReservationDto(String userId, String roomTitle, String roomContent, String bookCheckInDate,
			String bookCheckOutDate, String bookCapa, String roomImage, String roomAddress, String roomAddressDetail,
			String roomPriceTotal) {
		super();
		this.userId = userId;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.bookCheckInDate = bookCheckInDate;
		this.bookCheckOutDate = bookCheckOutDate;
		this.bookCapa = bookCapa;
		this.roomImage = roomImage;
		this.roomAddress = roomAddress;
		this.roomAddressDetail = roomAddressDetail;
		this.roomPriceTotal = roomPriceTotal;
	}





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
	
	
//	
//	public RoomReservationDto(String roomTitle, String roomContent, String roomPrice, String roomCapa,
//			String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage,
//			String roomImageReal) {
//		super();
//		this.roomTitle = roomTitle;
//		this.roomContent = roomContent;
//		this.roomPrice = roomPrice;
//		this.roomCapa = roomCapa;
//		this.roomAddress = roomAddress;
//		this.roomAddressDetail = roomAddressDetail;
//		this.roomCheckIn = roomCheckIn;
//		this.roomCheckOut = roomCheckOut;
//		this.roomImage = roomImage;
//		this.roomImageReal = roomImageReal;
//	}
// 
//	

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




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getBookId() {
		return bookId;
	}




	public void setBookId(String bookId) {
		this.bookId = bookId;
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




	public String getRoomPriceTotal() {
		return roomPriceTotal;
	}




	public void setRoomPriceTotal(String roomPriceTotal) {
		this.roomPriceTotal = roomPriceTotal;
	}

}
