package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;
import com.room.bbc.dto.RoomListDto;

public class HostRoomListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		
		RoomListDao dao = new RoomListDao();
		ArrayList<RoomListDto> dtos = dao.hostRoomList((String)session.getAttribute("USERID"));
		
		request.setAttribute("hostRoomList", dtos);
		
	}

}
