package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.room.bbc.dto.BoardDto;
import com.room.bbc.dto.RoomListDto;

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
	
	
	//-------------------------------
	// 호스트 숙소 등록	
	public void roomRegister(String userId, String roomTitle, String roomContent, String roomPrice, String roomCapa, String roomAddress, String roomAddressDetail ,String roomCheckIn, String roomCheckOut, String roomImage, String roomImageReal) {
		
		//선언자.  --> 무조건 맨 위에/!  // 입력 수정 삭제 다똑같은 패턴.
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into room (roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomaddressdetail, roomcheckin, roomcheckout, roomimage, roomimagereal, userid) values (?,?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, roomTitle);
			preparedStatement.setString(2, roomContent);
			preparedStatement.setInt(3, Integer.parseInt(roomPrice));
			preparedStatement.setInt(4, Integer.parseInt(roomCapa));
			preparedStatement.setString(5, roomAddress);
			preparedStatement.setString(6, roomAddressDetail);
			preparedStatement.setString(7, roomCheckIn);
			preparedStatement.setString(8, roomCheckOut);
			preparedStatement.setString(9, roomImage);
			preparedStatement.setString(10, roomImageReal);
			preparedStatement.setString(11, userId);
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
	
	//-------------------------------
	// 호스트 숙소 등록 시 회원상태 업데이트
	public void roomHostState(String userId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "update userinfo set userstate = '호스트' where userid = ?";
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
	
	//-------------------------------
	// 호스트 숙소 리스트
	public ArrayList<RoomListDto> hostRoomList(String userId){
		ArrayList<RoomListDto> dtos = new ArrayList<RoomListDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomaddressdetail, roomcheckin, roomcheckout, roomimage, ";
			String query2 = "roomid, roomimagereal from room where roomdeletedate is null and userid = ?";
			preparedStatement = connection.prepareStatement(query + query2); // query 문장 연결
			preparedStatement.setString(1, userId);
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
				RoomListDto dto = new RoomListDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
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
	// click 하여 해당 내용 보기 
	public RoomListDto roomView(String stroomId) {
		RoomListDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select * from room where roomid = ?";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setInt(1, Integer.parseInt(stroomId));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
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
				
				dto = new RoomListDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
				
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


	//-------------------------------
	// 호스트 숙소 삭제
	public void roomDelete(String roomId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			
			connection = dataSource.getConnection();
			
			String query = "update room set roomdeletedate = now() where roomid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, roomId);
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
	
	
	//-------------------------------
	// 호스트 숙소 수정
	public void roomRevise(String roomId, String roomTitle, String roomContent, String roomPrice, String roomCapa, String roomAddress, String roomAddressDetail, String roomCheckIn, String roomCheckOut, String roomImage, String roomImageReal) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "update room set roomtitle=?, roomcontent=?, roomprice=?, roomcapa=?, roomaddress=?, roomaddressdetail=?, roomcheckin=?, ";
			String query2 = "roomcheckout=?, roomimage=?, roomimagereal=? where roomid = ?";
			preparedStatement = connection.prepareStatement(query+query2);
			preparedStatement.setString(1, roomTitle);
			preparedStatement.setString(2, roomContent);
			preparedStatement.setInt(3, Integer.parseInt(roomPrice));
			preparedStatement.setInt(4, Integer.parseInt(roomCapa));
			preparedStatement.setString(5, roomAddress);
			preparedStatement.setString(6, roomAddressDetail);
			preparedStatement.setString(7, roomCheckIn);
			preparedStatement.setString(8, roomCheckOut);
			preparedStatement.setString(9, roomImage);
			preparedStatement.setString(10, roomImageReal);
			preparedStatement.setString(11, roomId);
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
	

	//관리자 --------------------------------------------------------------------------------------------------------
	//-------------------------------
	// 관리자 숙소리스트 DTO
	public ArrayList<RoomListDto> List(){
		ArrayList<RoomListDto> dtos = new ArrayList<RoomListDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomcheckin, roomcheckout, roomimage,  ";
			String query2 = "roomid, roomimagereal, roomdeletedate from room ";
			preparedStatement = connection.prepareStatement(query + query2); // query 문장 연결
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle"); // index 또는 컬럼명을 작성할 수 있다. (컬럼명으로 뜨는걸 적어줘야한다. ex. cnt)
				String roomContent = resultSet.getString("roomcontent");
				String roomPrice = Integer.toString(resultSet.getInt("roomprice"));
				String roomCapa = Integer.toString(resultSet.getInt("roomcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomCheckIn = resultSet.getString("roomcheckin");
				String roomCheckOut = resultSet.getString("roomcheckout");
				String roomImage = resultSet.getString("roomimage");
				String roomImageReal = resultSet.getString("roomimagereal");
				String roomId = Integer.toString(resultSet.getInt("roomid"));
				Timestamp roomDeleteDate = resultSet.getTimestamp("roomDeleteDate");
									
				// bean 선언
				RoomListDto dto = new RoomListDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomCheckIn, roomCheckOut, roomImage, roomImageReal, roomDeleteDate);
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

	
	
	
	
	//-------------------------------//-------------------------------//-------------------------------//-------------------------------
	public ArrayList<RoomListDto> AdminList(String roomId){
		ArrayList<RoomListDto> dtos = new ArrayList<RoomListDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select roomtitle, roomcontent, roomprice, roomcapa, roomaddress, roomcheckin, roomcheckout, roomimage,  ";
			String query2 = " roomimagereal, roomdeletedate from room where roomid = ? ";
			preparedStatement = connection.prepareStatement(query + query2); // query 문장 연결
			preparedStatement.setInt(1, Integer.parseInt(roomId));
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String roomTitle = resultSet.getString("roomtitle"); // index 또는 컬럼명을 작성할 수 있다. (컬럼명으로 뜨는걸 적어줘야한다. ex. cnt)
				String roomContent = resultSet.getString("roomcontent");
				String roomPrice = Integer.toString(resultSet.getInt("roomprice"));
				String roomCapa = Integer.toString(resultSet.getInt("roomcapa"));
				String roomAddress = resultSet.getString("roomaddress");
				String roomCheckIn = resultSet.getString("roomcheckin");
				String roomCheckOut = resultSet.getString("roomcheckout");
				String roomImage = resultSet.getString("roomimage");
				String roomImageReal = resultSet.getString("roomimagereal");
				Timestamp roomDeleteDate = resultSet.getTimestamp("roomDeleteDate");
				// bean 선언
				RoomListDto dto = new RoomListDto(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomCheckIn, roomCheckOut, roomImage, roomImageReal, roomDeleteDate);
						
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


	// 관리자 숙소 삭제	
public void adminRoomDelte(String roomId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "update room set roomdeletedate = now() where roomid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, roomId);
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


public void adminRoomUpadate(String roomTitle, String roomContent, String roomPrice, String roomCapa, String roomAddress, String roomCheckIn, String roomCheckOut, String roomId) {
																																									
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	//--->
	
	try {
		connection = dataSource.getConnection();
		String query = "update room set roomTitle=?, roomContent=?, roomPrice=?, roomCapa=?, roomAddress=?, roomCheckIn=?, ";
		String query2 = "roomCheckOut=? where roomid = ?";  // roomimage=?, roomimagereal=? 
		preparedStatement = connection.prepareStatement(query+query2);
		preparedStatement.setString(1, roomTitle);
		preparedStatement.setString(2, roomContent);
		preparedStatement.setString(3, roomPrice);
		preparedStatement.setString(4, roomCapa);
		preparedStatement.setString(5, roomAddress);
		preparedStatement.setString(6, roomCheckIn);
		preparedStatement.setString(7, roomCheckOut);
//		preparedStatement.setString(8, roomImage);
//		preparedStatement.setString(9, roomImageReal);
		preparedStatement.setInt(8, Integer.parseInt(roomId));
		
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




//-------------------------------//-------------------------------//-------------------------------//-------------------------------
public int noticeViewRowCount() {
	int rowCount=0;
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	
	try {
		connection = dataSource.getConnection();
		String query = "select count(*) from notice ";
		preparedStatement = connection.prepareStatement(query);
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
