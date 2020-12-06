package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.MessageDao;

public class MessageInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String roomUserId = request.getParameter("roomUserId");
		String messageContent = request.getParameter("messageContent");
		String bookId = request.getParameter("bookId");
		System.out.println(userId + roomUserId +messageContent+bookId);
		
		
		MessageDao dao = new MessageDao();
		dao.insert(userId, roomUserId, messageContent, bookId);
		
	}

}
