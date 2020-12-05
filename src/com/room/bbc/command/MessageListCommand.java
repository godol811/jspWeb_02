package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.MessageDao;
import com.room.bbc.dto.MessageDto;

public class MessageListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = (String) session.getAttribute("USERID");
		MessageDao dao = new MessageDao();
		
		ArrayList<MessageDto> dtos = dao.userList(userId);
		request.setAttribute("userList", dtos);
		
		
		
	}

}
