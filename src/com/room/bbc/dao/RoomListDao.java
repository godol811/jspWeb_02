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
	
	//게시판 글쓰기
	
		public void roomRegister(String pTitle, String pContent, String pImage, String pImageReal) {
			
			//선언자.  --> 무조건 맨 위에/!  // 입력 수정 삭제 다똑같은 패턴.
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			//--->
			
			try {
				connection = dataSource.getConnection();
				String query = "insert into room (userid, roomid, roomtitle, roomcontent, roomimage, roomimagereal) values ('qkr',1,'11','바보',?,?)";
				preparedStatement = connection.prepareStatement(query);
//				preparedStatement.setString(1, pTitle);
//				preparedStatement.setString(2, pContent);
				preparedStatement.setString(1, pImage);
				preparedStatement.setString(2, pImageReal);
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
