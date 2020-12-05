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
import com.room.bbc.dto.RoomSearchDto;

public class RoomSearchDao {
DataSource dataSource;  
	
	//constructor
	public RoomSearchDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	
	
	public int RoomSearchListRowCount(String location, int guest, String roomCheckinDate, String roomCheckoutDate) {
		int rowCount=0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query1  = "select count(*) from room.room  where roomaddress like  '%"+ location + "%' and roomcapa>= '"+ guest +"' and roomdeletedate is null";
			String query2  = " and roomid not in (select room_roomid from room.book where '" + roomCheckinDate + "'>= bookcheckindate and '"+ roomCheckoutDate+"' <=bookcheckoutdate)";
			preparedStatement = connection.prepareStatement(query1+ query2);
			resultSet = preparedStatement.executeQuery();
			
			
			while (resultSet.next()) {
				rowCount=resultSet.getInt(1);
	
				
			}
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	}
	
	
	public ArrayList<RoomSearchDto> RoomsearchList(String location, int guest, String roomCheckinDate, String roomCheckoutDate){ //숙소리스트
		ArrayList<RoomSearchDto> dtos = new ArrayList<RoomSearchDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomaddressdetail, roomcheckin, roomcheckout, roomimage, ";
			String query2 = "roomid, roomimagereal from room.room where roomaddress like  '%"+ location + "%' and roomcapa>= '" + guest + "' and roomdeletedate is null ";
			String query3 = "and roomid not in (select room_roomid from room.book where '" + roomCheckinDate + "'>= bookcheckindate and '"+ roomCheckoutDate+"' <=bookcheckoutdate) ";
			preparedStatement = connection.prepareStatement(query + query2 + query3); // query 문장 연결
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle"); // index 또는 컬럼명을 작성할 수 있다. (컬럼명으로 뜨는걸 적어줘야한다. ex. cnt)
				String roomContent = resultSet.getString("roomcontent");
				String roomPrice = Integer.toString(resultSet.getInt("roomprice"));
				String roomCapa = Integer.toString(resultSet.getInt("roomcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomAddressDetail = resultSet.getString("roomaddressdetail");
				String roomCheckIn = resultSet.getString("roomcheckin");
				String roomCheckOut = resultSet.getString("roomcheckout");
				String roomImage = resultSet.getString("roomimage");
				String roomImageReal = resultSet.getString("roomimagereal");
				String roomId = Integer.toString(resultSet.getInt("roomid"));
				
				// bean 선언
				RoomSearchDto dto = new RoomSearchDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
				dtos.add(dto);  //arraylist에 추가
				
			}
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
		}
	
	
	public ArrayList<RoomSearchDto> RoomSearchDirect(String location){ //홈페이지에 있는 바로가기
		ArrayList<RoomSearchDto> dtos = new ArrayList<RoomSearchDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomaddressdetail, roomcheckin, roomcheckout, roomimage, ";
			String query2 = "roomid, roomimagereal from room.room where roomaddress like  '%"+ location + "%' and roomdeletedate is null ";
			preparedStatement = connection.prepareStatement(query + query2); // query 문장 연결
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle"); // index 또는 컬럼명을 작성할 수 있다. (컬럼명으로 뜨는걸 적어줘야한다. ex. cnt)
				String roomContent = resultSet.getString("roomcontent");
				String roomPrice = Integer.toString(resultSet.getInt("roomprice"));
				String roomCapa = Integer.toString(resultSet.getInt("roomcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomAddressDetail = resultSet.getString("roomaddressdetail");
				String roomCheckIn = resultSet.getString("roomcheckin");
				String roomCheckOut = resultSet.getString("roomcheckout");
				String roomImage = resultSet.getString("roomimage");
				String roomImageReal = resultSet.getString("roomimagereal");
				String roomId = Integer.toString(resultSet.getInt("roomid"));
				
				// bean 선언
				RoomSearchDto dto = new RoomSearchDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
				dtos.add(dto);  //arraylist에 추가
				
			}
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
		}
	
	public int RoomSearchDirectRowCount(String location) {
		int rowCount=0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query1  = "select count(*) from room.room  where roomaddress like  '%"+ location + "%' and roomdeletedate is null";
			preparedStatement = connection.prepareStatement(query1);
			resultSet = preparedStatement.executeQuery();
			
			
			while (resultSet.next()) {
				rowCount=resultSet.getInt(1);
	
				
			}
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	}
	
	
}
