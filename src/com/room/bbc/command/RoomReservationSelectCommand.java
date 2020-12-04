package com.room.bbc.command;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomReservationDao;
import com.room.bbc.dto.RoomReservationDto;

public class RoomReservationSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	String roomId = request.getParameter("roomId");	
	session.setAttribute("ROOMID", roomId);
//	System.out.println(roomId);
	RoomReservationDao dao = new RoomReservationDao();
	ArrayList<RoomReservationDto> dtos = dao.ReservationData(roomId);
	
	
	request.setAttribute("list", dtos);
//	System.out.println(dtos);

	}

}
