package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomReservationDao;
import com.room.bbc.dto.RoomReservationDto;
import com.room.bbc.dto.RoomReviewDto;

public class UserRoomReservationSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userId = (String)session.getAttribute("USERID");
		
		RoomReservationDao dao = new RoomReservationDao();
		ArrayList<RoomReservationDto> dtos = dao.roomReservationList(userId);
		
		request.setAttribute("roomReservationList", dtos);
		
		
		ArrayList<RoomReviewDto> dtos2= dao.roomReviewSearch(userId);
		
		request.setAttribute("REVIEWID", dtos2);
	}

}
