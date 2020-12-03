package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomReservationDao;

public class RoomReservationInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = (String)session.getAttribute("USERID");
		String roomId = (String)session.getAttribute("ROOMID");
		String roomCheckIn = request.getParameter("checkinTime");
		String roomCheckOut = request.getParameter("checkoutTime");
		String roomCapa = request.getParameter("guest");
		String roomPriceTotal = request.getParameter("");
		
		RoomReservationDao dao = new RoomReservationDao();
		dao.roomReservation(userId, roomId, roomCheckIn, roomCheckOut, roomCapa, roomPriceTotal);
		
	}

}
