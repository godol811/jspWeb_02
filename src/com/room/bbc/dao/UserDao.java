package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.room.bbc.dto.RoomReviewDto;
import com.room.bbc.dto.UserDto;

public class UserDao {
	
	DataSource dataSource;
	
	public UserDao() {
		try {
			//javax.naming 사용
			Context context = new InitialContext();
			// /.env 뒤에 context.xml의 source 이름을 적어준다.
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
public ArrayList<UserDto> list() {
		
		ArrayList<UserDto> dtos = new ArrayList<UserDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select userId,userPw,userName,userAddress,userTel,userinsertDate,userState,userDeleteDate from userinfo";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String userId = resultSet.getString("userId");
				String userPw = resultSet.getString("userPw");
				String userName = resultSet.getString("userName");
				String userAddress = resultSet.getString("userAddress");
				String userTel = resultSet.getString("userTel");
				Timestamp userinsertDate = resultSet.getTimestamp("userinsertDate");
				String userState = resultSet.getString("userState");
				Timestamp userDeleteDate = resultSet.getTimestamp("userDeleteDatewdate");
				
			UserDto dto = new UserDto(userId, userPw, userName, userAddress, userTel, userinsertDate, userState,userDeleteDate);
			dtos.add(dto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(connection != null) connection.close();
				if(preparedStatement != null) preparedStatement.close();
				if(resultSet != null) resultSet.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}





	public void write(String userId, String userPw, String userName, String userAddress, String userTel) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "insert into userinfo  (userId, userPw, userName, userAddress,  userTel, userinsertDate ) values (?,?,?,?,?,now())";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, userPw);
			preparedStatement.setString(3, userName);
			preparedStatement.setString(4, userAddress);
			preparedStatement.setString(5, userTel);
			preparedStatement.executeUpdate();
			
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
	
	//로그인 아이디 비밀번호 체크 메서드
	
	public int loginCheck(String userId, String userPw) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String dbPW ="";
		int x = -1;
		
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "select userpw from userinfo where userid = ? ";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
			 dbPW = resultSet.getString("userpw");
			
			if (dbPW.equals(userPw)) 
                x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
            else                  
                x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
            
			 } else {
	            x = -1; // 해당 아이디가 없을 경우
	            }
	 
	           

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
		 return x;

	}		
}
