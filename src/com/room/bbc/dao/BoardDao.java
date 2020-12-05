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
import com.room.bbc.dto.UserDto;

public class BoardDao {
DataSource dataSource;  
	
	//constructor
	public BoardDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
//	---게시판 글쓰기
public void write(String boardTitle, String boardContent, String userId) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//--->
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into board (boardTitle, boardContent, userinfo_userId, boardinsertdate) values (?,?,?,now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, boardTitle);
			preparedStatement.setString(2, boardContent);
			preparedStatement.setString(3, userId);
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
//	--게시판 리스팅

public ArrayList<BoardDto> list() {
	
	ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	try {
		connection = dataSource.getConnection();
		String query = "select boardId, boardTitle, boardContent,boardInsertDate,userinfo_userid from board";
		preparedStatement = connection.prepareStatement(query);
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			String boardId = resultSet.getString("boardId");
			String boardTitle = resultSet.getString("boardTitle");
			String boardContent = resultSet.getString("boardContent");
			Timestamp boardInsertDate = resultSet.getTimestamp("boardInsertDate");
			String userinfo_userid = resultSet.getString("userinfo_userid");
			
		BoardDto dto = new BoardDto(boardId,boardTitle,boardContent,boardInsertDate,userinfo_userid);
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
//---게시판 수정
public void modify(String boardTitle, String boardContent, String boardId) {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	try {
		// 위에 선언된 dataSource 사용
		connection = dataSource.getConnection();
		String query = "update board set boardInsertDate = now(), boardTitle = ?, boardContent  =? where boardId = ?";
		preparedStatement = connection.prepareStatement(query); // query 문장 연결
		preparedStatement.setString(1, boardTitle);
		preparedStatement.setString(2, boardContent);
		preparedStatement.setString(3, boardId);
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


public ArrayList<BoardDto> modifylist(String boardId) {
	
	ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	try {
		connection = dataSource.getConnection();
		String query = "select boardId, boardTitle, boardContent,boardInsertDate,userinfo_userid from board where boardId = ?";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, boardId);
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			String boardTitle = resultSet.getString("boardTitle");
			String boardContent = resultSet.getString("boardContent");
			Timestamp boardInsertDate = resultSet.getTimestamp("boardInsertDate");
			String userInfo_userId = resultSet.getString("userinfo_userid");
			
		BoardDto dto = new BoardDto(boardId,boardTitle,boardContent,boardInsertDate,userInfo_userId);
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

public void delete(String boardId) {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	try {
		// 위에 선언된 dataSource 사용
		connection = dataSource.getConnection();
		String query = "delete from board where boardId = ?";
		preparedStatement = connection.prepareStatement(query); // query 문장 연결
		preparedStatement.setString(1, boardId);
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


}
	
