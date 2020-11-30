package com.room.bbc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.room.bbc.dao.RoomReviewDao;


public class RoomReviewDeleteCommand implements Command {
	
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String reviewId = request.getParameter("reviewId");
		
		RoomReviewDao dao= new RoomReviewDao();
		dao.delete(reviewId);
			
	}

}
