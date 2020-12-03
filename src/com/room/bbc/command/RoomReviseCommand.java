package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;

public class RoomReviseCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String roomId = request.getParameter("roomId");
		String roomTitle = request.getParameter("roomTitle");
		String roomContent = request.getParameter("roomContent");
		String roomPrice = request.getParameter("roomPrice");
		String roomCapa = request.getParameter("roomCapa");
		String roomAddress = request.getParameter("roomAddress");
		String roomAddressDetail = request.getParameter("roomAddressDetail");
		String roomCheckIn = request.getParameter("roomCheckIn");
		String roomCheckOut = request.getParameter("roomCheckOut");
		String roomImage = request.getParameter("roomImage");
		String roomImageReal = request.getParameter("roomImageReal");
		
		RoomListDao dao = new RoomListDao();
		dao.roomRevise(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
		
	}

}
