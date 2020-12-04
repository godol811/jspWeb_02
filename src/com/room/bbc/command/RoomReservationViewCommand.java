package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;
import com.room.bbc.dao.RoomReservationDao;
import com.room.bbc.dto.RoomListDto;
import com.room.bbc.dto.RoomReservationDto;

public class RoomReservationViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		
		String bookId = request.getParameter("bookId");
		String userId = (String) session.getAttribute("USERID");
		
		session.setAttribute("BOOKID", bookId);
		
		RoomReservationDao dao = new RoomReservationDao();
		RoomReservationDto dto = dao.roomReservationView(bookId, userId);
		request.setAttribute("bookView", dto);
		
		
		
	}

}
