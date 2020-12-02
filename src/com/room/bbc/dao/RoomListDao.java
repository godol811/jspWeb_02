package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RoomListDao {
DataSource dataSource;  
	
	//constructor
	public RoomListDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		
	public void roomRegister(String userId, String roomTitle, String roomContent, String roomPrice, String roomCapa, String roomAddress, String roomCheckIn, String roomCheckOut, String roomImage, String roomImageReal) {
		
		//선언자.  --> 무조건 맨 위에/!  // 입력 수정 삭제 다똑같은 패턴.
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into room (roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomcheckin, roomcheckout, roomimage, roomimagereal, userid) values (?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, roomTitle);
			preparedStatement.setString(2, roomContent);
			preparedStatement.setString(3, roomPrice);
			preparedStatement.setString(4, roomCapa);
			preparedStatement.setString(5, roomAddress);
			preparedStatement.setString(6, roomCheckIn);
			preparedStatement.setString(7, roomCheckOut);
			preparedStatement.setString(8, roomImage);
			preparedStatement.setString(9, roomImageReal);
			preparedStatement.setString(10, userId);
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
	
	public void roomHostState(String userId) {
		
		//선언자.  --> 무조건 맨 위에/!  // 입력 수정 삭제 다똑같은 패턴.
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "update room set userstate = 호스트 where userid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
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
