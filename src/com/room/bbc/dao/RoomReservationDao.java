package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.room.bbc.dto.RoomListDto;
import com.room.bbc.dto.RoomReservationDto;
import com.room.bbc.dto.RoomReviewDto;
import com.room.bbc.dto.UserDto;

public class RoomReservationDao {
	
	DataSource dataSource;  
	
	//constructor
	public RoomReservationDao() {
	 
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//-------------------------------
	// 숙소 예약
	public void roomReservation(String userinfo_userId, String room_roomId, String bookCheckindate, String bookCheckoutdate, String bookCapa,String bookPriceTotal) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into book (userinfo_userId, room_roomId, bookCheckindate, bookCheckoutdate, bookCapa, bookPriceTotal) values (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userinfo_userId);
			preparedStatement.setString(2, room_roomId);
			preparedStatement.setString(3, bookCheckindate);
			preparedStatement.setString(4, bookCheckoutdate);
			preparedStatement.setString(5, bookCapa);
			preparedStatement.setString(6, bookPriceTotal);
			preparedStatement.executeUpdate();
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {   //error가 걸렸든 안걸렸든 일로 마지막에는 온다. 쓰레기가 안쌓이도록. 다 close해서 
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace(); //화면상에 보이는 에러는 여기서 찍히는 것이다.  
			}
		}
		
		
	}
	
	//----------------------------------예약 미리 세팅할 값 불러오기----------------------------------------------
	
public ArrayList<RoomReservationDto> ReservationData(String roomId) {
		
		ArrayList<RoomReservationDto> dtos = new ArrayList<RoomReservationDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomcontent,roomtitle, roomprice, roomcapa, roomaddress, roomaddressdetail, DATE_FORMAT(roomcheckin,'%H:%i') as roomcheckin, DATE_FORMAT(roomcheckout,'%H:%i') as roomcheckout, roomimage, ";
			String query2 = " roomimagereal from room where roomid = ? ";
			preparedStatement = connection.prepareStatement(query + query2); // query 문장 연결
			preparedStatement.setString(1, roomId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle");
				String roomContent = resultSet.getString("roomcontent");
				String roomPrice = Integer.toString(resultSet.getInt("roomprice"));
				String roomCapa = Integer.toString(resultSet.getInt("roomcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomAddressDetail = resultSet.getString("roomaddressdetail");
				String roomCheckIn = resultSet.getString("roomcheckin");
				String roomCheckOut = resultSet.getString("roomcheckout");
				String roomImage = resultSet.getString("roomimage");
				String roomImageReal = resultSet.getString("roomimagereal");
				
				// bean 선언
				RoomReservationDto dto = new RoomReservationDto(roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal, roomId);
				dtos.add(dto); //arraylist에 추가
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { // 처음 선언된 부분 닫아준다.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
		
	}
	//-------------------------------
	// 예약 목록 조회(회원)
	public ArrayList<RoomReservationDto> roomReservationList(String userId) {
		ArrayList<RoomReservationDto> dtos = new ArrayList<RoomReservationDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "select bookid, roomid, roomtitle, roomcontent, bookcheckindate, bookcheckoutdate, roomimage, bookcapa from book b, room r where b.room_roomid = r.roomid and userinfo_userid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String bookId = Integer.toString(resultSet.getInt("bookid"));
				String roomId = Integer.toString(resultSet.getInt("roomid"));
				String roomTitle = resultSet.getString("roomtitle");
				String roomContent = resultSet.getString("roomcontent");
				String bookCheckInDate = resultSet.getString("bookcheckindate");
				String bookCheckOutDate = resultSet.getString("bookcheckoutdate");
				String bookCapa = Integer.toString(resultSet.getInt("bookcapa"));
				String roomImage = resultSet.getString("roomimage");
				
				// bean 선언
				RoomReservationDto dto = new RoomReservationDto(bookId, roomTitle, roomContent, bookCheckInDate, bookCheckOutDate, bookCapa, roomImage, roomId);
				dtos.add(dto); //arraylist에 추가
				
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {   //error가 걸렸든 안걸렸든 일로 마지막에는 온다. 쓰레기가 안쌓이도록. 다 close해서 
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace(); //화면상에 보이는 에러는 여기서 찍히는 것이다.  
			}
		}
		return dtos;
		
	}
	
	//-------------------------------
	// 예약목록 상세 조회
	public RoomReservationDto roomReservationView(String bookId, String userId) {
		RoomReservationDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select userid, roomtitle, roomcontent, bookcheckindate, bookcheckoutdate, roomaddress, roomaddressdetail, roomimage, bookcapa, roomprice*(bookcheckoutdate-bookcheckindate) as pricetotal";
			String query2 =" from book b, room r where b.room_roomid = r.roomid and userinfo_userid = ? and bookid = ?";
			preparedStatement = connection.prepareStatement(query+query2); // query 문장 연결
			preparedStatement.setString(1, userId);
			preparedStatement.setInt(2, Integer.parseInt(bookId));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle"); // index 또는 컬럼명을 작성할 수 있다. (컬럼명으로 뜨는걸 적어줘야한다. ex. cnt)
				String roomContent = resultSet.getString("roomcontent");
				String roomPriceTotal = Integer.toString(resultSet.getInt("pricetotal"));
				String bookCapa = Integer.toString(resultSet.getInt("bookcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomAddressDetail = resultSet.getString("roomaddressdetail");
				String roomCheckIn = resultSet.getString("bookcheckindate");
				String roomCheckOut = resultSet.getString("bookcheckoutdate");
				String roomImage = resultSet.getString("roomimage");
				
				dto = new RoomReservationDto(userId, roomTitle, roomContent, roomCheckIn, roomCheckOut, bookCapa, roomImage, roomAddress, roomAddressDetail, roomPriceTotal);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { // 처음 선언된 부분 닫아준다.
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	
	// 예약현황 조회
	public ArrayList<RoomReservationDto> hostReservationSearch(String roomId) {
		ArrayList<RoomReservationDto> dtos = new ArrayList<RoomReservationDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "select userinfo_userid, bookcheckindate, bookcheckoutdate, bookcapa, roomprice*(bookcheckoutdate-bookcheckindate) as pricetotal ";
			String query2 = "from book b, room r where b.room_roomid = r.roomid and room_roomid= ?";
			preparedStatement = connection.prepareStatement(query+query2);
			preparedStatement.setInt(1, Integer.parseInt(roomId));
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String userinfo_userid = resultSet.getString("userinfo_userid");
				String bookcheckindate = resultSet.getString("bookcheckindate");
				String bookcheckoutdate = resultSet.getString("bookcheckoutdate");
				String bookcapa = Integer.toString(resultSet.getInt("bookcapa"));
				String bookPriceTotal = Integer.toString(resultSet.getInt("pricetotal"));
				
				// bean 선언
				RoomReservationDto dto = new RoomReservationDto(userinfo_userid, bookcheckindate, bookcheckoutdate, bookcapa, roomId, bookPriceTotal);
				dtos.add(dto); //arraylist에 추가
				
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {   //error가 걸렸든 안걸렸든 일로 마지막에는 온다. 쓰레기가 안쌓이도록. 다 close해서 
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace(); //화면상에 보이는 에러는 여기서 찍히는 것이다.  
			}
		}
		return dtos;
		
	}
	
	// 리뷰 찾기
	public ArrayList<RoomReviewDto> roomReviewSearch(String userId) {
		
		ArrayList<RoomReviewDto> dtos = new ArrayList<RoomReviewDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "select reviewid, bookid from review where userinfo_userid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int reviewId = resultSet.getInt("reviewid");
				int bookId = resultSet.getInt("bookid");
				
				// bean 선언
				RoomReviewDto dto = new RoomReviewDto(reviewId, bookId);
				dtos.add(dto);
			}
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {   //error가 걸렸든 안걸렸든 일로 마지막에는 온다. 쓰레기가 안쌓이도록. 다 close해서 
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace(); //화면상에 보이는 에러는 여기서 찍히는 것이다.  
			}
		}
		return dtos;
	}
	
//	// 예약현황 조건 검색
//	public ArrayList<RoomReservationDto> hostReservationSearch( String roomId){
//		
//		ArrayList<RoomReservationDto> dtos = new ArrayList<RoomReservationDto>();
//		
////		if(search == null) {
////			search = "bookcheckindate";
////			searchWord ="";
////		}
////		
//		Connection connection = null;
//		PreparedStatement preparedStatement = null;
//		ResultSet resultSet = null;
//		//--->
//		
//		try {
//			connection = dataSource.getConnection();
//			String query = "select userinfo_userid, bookcheckindate, bookcheckoutdate, bookcapa, roomprice*(bookcheckoutdate-bookcheckindate) as pricetotal";
//			String query2 = "from book b, room r where b.room_roomid = r.roomid and room_roomid= ?";
//					// and " + search + " like '%"+searchWord + "'%";
//			preparedStatement = connection.prepareStatement(query+query2);
//			preparedStatement.setString(1,roomId));
//			resultSet = preparedStatement.executeQuery();
//			
//			while(resultSet.next()) {
//				String userinfo_userid = resultSet.getString("userinfo_userid");
//				String bookcheckindate = resultSet.getString("bookcheckindate");
//				String bookcheckoutdate = resultSet.getString("bookcheckoutdate");
//				String bookcapa = resultSet.getString("bookcapa");
//				String pricetotal = resultSet.getString("pricetotal");
//				
//				// bean 선언
//				RoomReservationDto dto = new RoomReservationDto(userinfo_userid, bookcheckindate, bookcheckoutdate, bookcapa, roomId, pricetotal);
//				dtos.add(dto);
//			}
//	
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {   //error가 걸렸든 안걸렸든 일로 마지막에는 온다. 쓰레기가 안쌓이도록. 다 close해서 
//			try {
//				if(preparedStatement != null) preparedStatement.close();
//				if(connection != null) connection.close();
//			} catch (Exception e) {
//				e.printStackTrace(); //화면상에 보이는 에러는 여기서 찍히는 것이다.  
//			}
//		}
//		return dtos;
//	}
//	
}
