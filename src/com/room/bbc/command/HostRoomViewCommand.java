package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;
import com.room.bbc.dto.RoomListDto;

public class HostRoomViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		
		String roomId = request.getParameter("roomId");
		session.setAttribute("ROOMID", roomId);
		
		RoomListDao dao = new RoomListDao();
		RoomListDto dto = dao.roomView(roomId);
		request.setAttribute("roomView", dto);
	}
		

}
