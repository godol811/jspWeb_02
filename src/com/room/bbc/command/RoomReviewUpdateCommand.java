package com.room.bbc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.room.bbc.dao.RoomReviewDao;

public class RoomReviewUpdateCommand implements Command {

	
public void execute(HttpServletRequest request, HttpServletResponse response) {
	int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	String userinfo_Userid = request.getParameter("userinfo_Userid");
	int room_Roomid = Integer.parseInt(request.getParameter("room_Roomid"));
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewContent = request.getParameter("reviewContent");
	double ReviewRate = Double.parseDouble(request.getParameter("ReviewRate"));
	
	RoomReviewDao dao = new RoomReviewDao();
	dao.update(reviewTitle, reviewContent, ReviewRate, reviewId);
	
	}

}
