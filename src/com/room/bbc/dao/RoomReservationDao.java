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
			String query = "select roomcontent,roomtitle, roomprice, roomcapa, roomaddress, roomaddressdetail, roomcheckin, roomcheckout, roomimage, ";
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
	
}
