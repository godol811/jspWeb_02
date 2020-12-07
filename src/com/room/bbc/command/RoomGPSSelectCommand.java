package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomListDao;

public class RoomGPSSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		
		String roomId = request.getParameter("roomId");
		
		RoomListDao dao = new RoomListDao();
		Double roomGpsx = dao.gpsX(roomId);
		session.setAttribute("GPSX", roomGpsx);
		
		Double roomGpsy = dao.gpsY(roomId);
		session.setAttribute("GPSY", roomGpsy);
			
		// TODO Auto-generated method stub

	}

}
