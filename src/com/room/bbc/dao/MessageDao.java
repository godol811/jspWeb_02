package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.room.bbc.dto.MessageDto;


public class MessageDao {

	
	
DataSource dataSource;

public MessageDao() {
	
	try {
		//javax.naming 사용
		Context context = new InitialContext();
		// /.env 뒤에 context.xml의 source 이름을 적어준다.
		dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");

	} catch(Exception e) {
		e.printStackTrace();
	}
}

//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------//------------------------------------------

public ArrayList<MessageDto> messageListforReservation(String userId){
	ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
	// java.sql 사용
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	try {
		// 위에 선언된 dataSource 사용
		connection = dataSource.getConnection();
		String query = "select room.userid,roomid,bookid  from room.room inner join room.book on book.room_roomid = room.roomid where userinfo_userid = ? ";
		//select messagedate, userinfo_userid, messagecontent from message where userinfo_userid='imkanghoo'&&room_userid='sang' || userinfo_userid='sang'&&room_userid='imkanghoo';
		preparedStatement = connection.prepareStatement(query); // query 문장 연결
		preparedStatement.setString(1, userId);//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@struserInfoUserId로 수정할것!!!!!!!
		resultSet = preparedStatement.executeQuery();
//		System.out.println("Dao.MessageList"+resultSet);
//		System.out.println("Dao.MessageList"+struserInfoUserId);
//		System.out.println("Dao.MessageList"+strroomUserId);
		
		while(resultSet.next()) {
			
			String room_userId = resultSet.getString("room.userid");
			String roomId = resultSet.getString("roomid");
			String bookId = resultSet.getString("bookid");
			
//			System.out.println(messageDate);
//			System.out.println(userInfo_userId);
//			System.out.println(messageContent);
//						
			// bean 선언
			MessageDto dto = new MessageDto(room_userId, roomId, bookId);
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



	
		
	
	




//------------------------------------------
	public void insert(String userId, String roomUserId, String messageContent, String bookId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "insert into message (userinfo_userid, room_userid, messageContent, messageinsertdate, book_bookid) values (?,?,?,now(),?)";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, roomUserId);
			preparedStatement.setString(3, messageContent);
			preparedStatement.setInt(4, Integer.parseInt(bookId));
			preparedStatement.executeUpdate();
			
//			System.out.println(userInfoUserId);
//			System.out.println(roomUserId);
//			System.out.println((messageContent));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { // 처음 선언된 부분 닫아준다.
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	//-----------
	
	// 선택된 사람의 전체 list 목록 보기 
	
	
	
	//하다 만 부분
	public ArrayList<MessageDto> messageList(String userId){
		ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
		// java.sql 사용
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select messagedate, userinfo_userid, messagecontent from message where userinfo_userid=? order by messagedate";
			//select messagedate, userinfo_userid, messagecontent from message where userinfo_userid='imkanghoo'&&room_userid='sang' || userinfo_userid='sang'&&room_userid='imkanghoo';
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setString(1, userId);//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@struserInfoUserId로 수정할것!!!!!!!
			resultSet = preparedStatement.executeQuery();
//			System.out.println("Dao.MessageList"+resultSet);
//			System.out.println("Dao.MessageList"+struserInfoUserId);
//			System.out.println("Dao.MessageList"+strroomUserId);
			
			while(resultSet.next()) {
				
				Timestamp messageDate = resultSet.getTimestamp("messagedate");
				String userInfo_userId = resultSet.getString("userinfo_userid");
				String messageContent = resultSet.getString("messagecontent");
				
//				System.out.println(messageDate);
//				System.out.println(userInfo_userId);
//				System.out.println(messageContent);
//							
				// bean 선언
				MessageDto dto = new MessageDto(messageDate, userInfo_userId, messageContent);
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
	
	
	//---------메세지 주고 받는 사람들 리스트.
	
		public ArrayList<MessageDto> bookMessage(String userId){
			ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
			// java.sql 사용
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			try {
				// 위에 선언된 dataSource 사용
				connection = dataSource.getConnection();
				String query = "select r.roomtitle,b.bookid, messageinsertdate from message as m, book as b, room as r where m.book_bookid = b.bookid and r.roomid = b.room_roomid and b.userinfo_userid=? ";
				//select room_userid, messagedate from message where (userinfo_userid='imkanghoo' or room_userid='imkanghoo') and (room_userid, messagedate) in (select room_userid, max(messagedate) as messagedate from message group by room_userid) order by messagedate desc;
				preparedStatement = connection.prepareStatement(query); // query 문장 연결
				preparedStatement.setString(1, userId);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					
					String roomTitle = resultSet.getString("r.roomtitle");
					String bookId = resultSet.getString("b.bookid");
					Timestamp messageInsertDate = resultSet.getTimestamp("messageinsertdate");
					
//					System.out.println(room_userId);
//					System.out.println(messageDate);
								
					// bean 선언
					MessageDto dto = new MessageDto(roomTitle,bookId, messageInsertDate);
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
	

		//---------메세지 내용 내역
		
			public ArrayList<MessageDto> messageHistory(String bookId,String userId){
				ArrayList<MessageDto> dtos = new ArrayList<MessageDto>();
				// java.sql 사용
				Connection connection = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				
				try {
					// 위에 선언된 dataSource 사용
					connection = dataSource.getConnection();
					String query = "select userinfo_userid,book_bookid, messageContent, messageinsertdate from message where book_bookid = ? and userinfo_userid = ? ";
					//select room_userid, messagedate from message where (userinfo_userid='imkanghoo' or room_userid='imkanghoo') and (room_userid, messagedate) in (select room_userid, max(messagedate) as messagedate from message group by room_userid) order by messagedate desc;
					preparedStatement = connection.prepareStatement(query); // query 문장 연결
					preparedStatement.setString(1, bookId);
					preparedStatement.setString(2, userId);
					resultSet = preparedStatement.executeQuery();
					
					while(resultSet.next()) {
						
						String messageContent = resultSet.getString("messageContent");
						Timestamp messageInsertDate = resultSet.getTimestamp("messageinsertdate");
						
//						System.out.println(room_userId);
//						System.out.println(messageDate);
									
						// bean 선언
						MessageDto dto = new MessageDto(bookId, messageContent, messageInsertDate);
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
