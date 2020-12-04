package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;

public class RoomDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String roomId = request.getParameter("roomId");
		System.out.println(roomId);
		RoomListDao dao = new RoomListDao();
		dao.adminRoomDelte(roomId);
		
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
