package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.MessageDao;
import com.room.bbc.dto.MessageDto;

public class MessageSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = (String) session.getAttribute("USERID");
//		String roomUserId = request.getParameter("roomUserId");
		
		
		
//		String userInfoUserId = (String) session.getAttribute("USERINFOUSERID");
//		String roomUserId = (String) session.getAttribute("ROOMUSERID");

		MessageDao dao = new MessageDao();
	
		
		ArrayList<MessageDto> dtos = dao.messageList(userId);
		
		request.setAttribute("messageList", dtos);
				
	}

}
