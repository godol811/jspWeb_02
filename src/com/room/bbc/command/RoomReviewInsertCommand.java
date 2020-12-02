package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomReviewDao;

public class RoomReviewInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//자동생성 필요없음
//		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		String userinfo_Userid = request.getParameter("userinfo_Userid");
		int room_Roomid = Integer.parseInt(request.getParameter("room_Roomid"));
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewContent = request.getParameter("reviewContent");
		double reviewRate = Double.parseDouble(request.getParameter("reviewRate"));
		
		RoomReviewDao dao = new RoomReviewDao();
		dao.write(userinfo_Userid, room_Roomid, reviewTitle, reviewContent, reviewRate);
		
		
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
