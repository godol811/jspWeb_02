package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;
import com.room.bbc.dto.RoomListDto;

public class RoomAdminSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String roomId = request.getParameter("roomId");
		RoomListDao dao = new RoomListDao();
		ArrayList<RoomListDto> dtos = dao.AdminList(roomId);
		
		request.setAttribute("list", dtos);
		
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
