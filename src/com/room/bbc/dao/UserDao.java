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
				Timestamp userInsertDate = resultSet.getTimestamp("userInsertDate");
				String userState = resultSet.getString("userState");
				Timestamp userDeleteDate = resultSet.getTimestamp("userDeleteDate");
				
			UserDto dto = new UserDto(userId, userPw, userName, userAddress, userTel, userInsertDate, userState,userDeleteDate);
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
//--------------------------------유저 삭제 but 저장하되 사용 불가------------------------------------------------------------------------------
public void DeleteUser(String userId) {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	try {
		// 위에 선언된 dataSource 사용
		connection = dataSource.getConnection();
		String query = "update userinfo set userdeletedate = now(), userstate = '탈퇴' where userId = ?";
		preparedStatement = connection.prepareStatement(query); // query 문장 연결
		preparedStatement.setString(1, userId);
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



//-----------------------------------------------------------------------------------------------------------------
	public void write(String userId, String userPw, String userName, String userAddress, String userTel) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "insert into userinfo  (userId, userPw, userName, userAddress,  userTel, userinsertDate,userstate ) values (?,?,?,?,?,now(),'회원')";
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
	
	//로그인 아이디 비밀번호 체크 메서드----------------------------------------------
	
	public int logincheck(String userId,String userPw) {
		int loginCheck = 0;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String checkPw ="";
		
			
		
		try {
		     connection = dataSource.getConnection();
		     String query = "select userpw from userinfo where userid = ?";
		     preparedStatement = connection.prepareStatement(query);
		     preparedStatement.setString(1, userId);
		     resultSet = preparedStatement.executeQuery();
		     
		     
		     if(resultSet.next())
		     { //아이디가 불려와지는지 여부 확인
		    	checkPw = resultSet.getString("userpw"); //암호 가져오기
			 
		    	if (userPw.equals(checkPw)) { //암호 같으면
			    		loginCheck= 1; //다음 페이지 진행
					
			     	}else {
			    	 	loginCheck = 0;//다르면 빠꾸
			     	}
		    }else {
		    	loginCheck= -1;
		    }
			}catch(Exception e) {
		    	e.printStackTrace();
		    	
		    }finally {
				try {
					if(resultSet!=null) resultSet.close();
					if(preparedStatement!=null) preparedStatement.close();
					if(connection!=null) connection.close();
				}catch (Exception e) {
					e.printStackTrace();
					
				}
			}

		return loginCheck;
	}
	//아이디 중복체 체크 메서드----------------------------------------------
	
	public int joinIdCheck(String userid) {
		int joinCheck=0;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
		     connection = dataSource.getConnection();
		     String query = "select count(*) from userinfo where userid = ?";
		     preparedStatement = connection.prepareStatement(query);
		     preparedStatement.setString(1, userid);
		     resultSet = preparedStatement.executeQuery();
		     
		     if(resultSet.next()) {
		    	joinCheck=resultSet.getInt(1);
		     }
		     
		       
		    }catch(Exception e) {
		    	e.printStackTrace();
   
		    }finally {
				try {
					if(resultSet!=null) resultSet.close();
					if(preparedStatement!=null) preparedStatement.close();
					if(connection!=null) connection.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		return joinCheck;
	}
//	----회원 상태 가져오기----------------------
	public String userState(String userId) {
		
		String userState = "";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
			
		
		try {
		     connection = dataSource.getConnection();
		     String query = "select userstate from userinfo where userid = ?";
		     preparedStatement = connection.prepareStatement(query);
		     preparedStatement.setString(1, userId);
		     resultSet = preparedStatement.executeQuery();
		     
		     
		     if(resultSet.next())
		     { //아이디가 불려와지는지 여부 확인
		    	userState = resultSet.getString("userstate"); //암호 가져오기
		     }
			}catch(Exception e) {
		    	e.printStackTrace();
		    	
		    }finally {
				try {
					if(resultSet!=null) resultSet.close();
					if(preparedStatement!=null) preparedStatement.close();
					if(connection!=null) connection.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			return userState;
	}
}
