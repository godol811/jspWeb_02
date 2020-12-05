package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomReservationDao;
import com.room.bbc.dao.RoomReviewDao;
import com.room.bbc.dto.RoomReservationDto;
import com.room.bbc.dto.RoomReviewDto;

public class RoomReviewSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String roomId = request.getParameter("roomId");	
		System.out.println(roomId);
		session.setAttribute("ROOMID", roomId);
		RoomReviewDao dao2 = new RoomReviewDao();
		ArrayList<RoomReviewDto> dtos2 = dao2.list(roomId);
		
		
		request.setAttribute("reviewList", dtos2);
	}

}
