package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomSearchDao;
import com.room.bbc.dto.RoomSearchDto;


public class PagingCommand1 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		
		
	}

	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String location = request.getParameter("location");
		int	   guest    = Integer.parseInt(request.getParameter("guest"));
		String date1    = request.getParameter("date1");
		String date2    = request.getParameter("date2");
		session.setAttribute("LOCATION", location);
		session.setAttribute("GUEST", guest);
		session.setAttribute("DATE1", date1);
		session.setAttribute("DATE2", date2);
		RoomSearchDao dao = new RoomSearchDao();
		ArrayList<RoomSearchDto> dtos = dao.RoomsearchList(location, guest, date1, date2);
		
		int noticeViewRowCount = dao.RoomSearchListRowCount(location, guest, date1, date2);
		
		int RowCount = noticeViewRowCount;
		
		int totalPage=(RowCount/10);
		if(RowCount%10!=0) {
			totalPage++;
		}

		int beginNum=0;
		int endNum=9;
		
		// 리스트
		request.setAttribute("list", dtos);
		request.setAttribute("beginNum", beginNum);
		request.setAttribute("endNum", endNum);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("location", location);
		request.setAttribute("guest", guest);

	}

}
