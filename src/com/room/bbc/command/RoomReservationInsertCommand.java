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
		String bookCheckindate= request.getParameter("date1");
		String bookCheckoutdate = request.getParameter("date2");
		System.out.println(userId);
		System.out.println(bookCheckindate);
	
		
		String roomCapa = request.getParameter("guest");
		String roomPriceTotal = request.getParameter("roomPriceTotal");
		
		RoomReservationDao dao = new RoomReservationDao();
		dao.roomReservation(userId, roomId, bookCheckindate, bookCheckoutdate, roomCapa, roomPriceTotal);
		
	}

}
