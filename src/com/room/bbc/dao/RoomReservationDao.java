package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	public void roomReservation(String userId, String roomId, String roomCheckIn, String roomCheckOut, String roomCapa,String roomPriceTotal) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into book (userId, roomId, roomCheckIn, roomCheckOut, roomCapa, roomPriceTotal) values (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, roomId);
			preparedStatement.setString(3, roomCheckIn);
			preparedStatement.setString(4, roomCheckOut);
			preparedStatement.setString(5, roomCapa);
			preparedStatement.setString(6, roomPriceTotal);
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
	
	
	
	
}
