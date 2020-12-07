package com.room.bbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.room.bbc.dto.RoomReviewDto;

public class RoomReviewDao {
	
	DataSource dataSource;
	
	
	public RoomReviewDao() {
		
		try {
			//javax.naming 사용
			Context context = new InitialContext();
			// /.env 뒤에 context.xml의 source 이름을 적어준다.
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/room");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 해당 숙소의 리뷰 불러오기
	public ArrayList<RoomReviewDto> list(String roomId) {
		
		ArrayList<RoomReviewDto> dtos = new ArrayList<RoomReviewDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select reviewid, userinfo_userid,room_roomid,reviewcontent,reviewrate,DATE_FORMAT(reviewdate, '%Y/%m/%d') as reviewdate from review where room_roomid=? order by reviewid desc";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, roomId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String reviewId = resultSet.getString("reviewid");
				String userinfo_Userid = resultSet.getString("userinfo_userid");
				String room_Roomid = resultSet.getString("room_roomid");
				String reviewContent = resultSet.getString("reviewcontent");
				double reviewRate = resultSet.getDouble("reviewrate");
				String reviewDate = resultSet.getString("reviewdate");
				
			RoomReviewDto dto = new RoomReviewDto(reviewId, userinfo_Userid, room_Roomid, reviewContent, reviewRate, reviewDate);
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
	
// 리뷰 입력하기
// 리뷰 아이디는 자동으로 생성(AI)userinfo_userid와 room_Roomid 를 받아와서 넣을것
	
	public int write(String bookId, String userinfo_Userid, int room_Roomid, String ReviewContent, double ReviewRate) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int reviewCheck = 0;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "insert into review (bookid, room_Roomid, userinfo_Userid, reviewContent, reviewRate, reviewDate) values (?,?,?,?,?,now())";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setInt(1, Integer.parseInt(bookId));
			preparedStatement.setInt(2, room_Roomid);
			preparedStatement.setString(3, userinfo_Userid);
			preparedStatement.setString(4, ReviewContent);
			preparedStatement.setDouble(5, ReviewRate);
			preparedStatement.executeUpdate();
			reviewCheck = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { // 처음 선언된 부분 닫아준다.
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return reviewCheck;
	}
	
//리뷰 삭제하기
	
	public void delete(String ReviewId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "delete from review where reviewid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(ReviewId));
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
	
	//reviewTitle, reviewContent, reviewRate, reviewDate) values (?,?,?,?,now()
	//리뷰 수정하기
	public int update(String ReviewTitle,String ReviewContent, double ReviewRate,int ReviewId) {
		int check=0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// 위에 선언된 dataSource 사용
			connection = dataSource.getConnection();
			String query = "update mvc_board set reviewtitle = ?, reviewcontent = ?, reviewrate = ?, reviewdate = now() where reviewid = ?";
			preparedStatement = connection.prepareStatement(query); // query 문장 연결
			preparedStatement.setString(1, ReviewTitle);
			preparedStatement.setString(2, ReviewContent);
			preparedStatement.setDouble(3, ReviewRate);
			preparedStatement.setInt(4, ReviewId);
			preparedStatement.executeUpdate();
			check=1;
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
		return check;
	}
	
	
}
