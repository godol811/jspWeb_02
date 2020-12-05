package com.room.bbc.command;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ArrayList;

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
	String date1  = request.getParameter("date1");
	String date2  = request.getParameter("date2");
	String guest  = request.getParameter("guest");
	session.setAttribute("ROOMID", roomId);
//	System.out.println(roomId);
	RoomReservationDao dao = new RoomReservationDao();
	ArrayList<RoomReservationDto> dtos = dao.ReservationData(roomId);
	
	
	request.setAttribute("list", dtos);
	request.setAttribute("DATE1direct", date1);
	request.setAttribute("DATE2direct", date2);
	request.setAttribute("GUESTdirect", guest);
	
//	System.out.println(dtos);

		
	}

}
