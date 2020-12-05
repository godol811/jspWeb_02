package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.command.Command;
import com.room.bbc.dao.BoardDao;

public class AdminNotifyUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String boardTitle = (String) request.getParameter("boardTitle");
		String boardContent = (String) request.getParameter("boardContent");
		String boardId = (String) request.getParameter("boardId");
		BoardDao dao = new BoardDao();
		dao.modify(boardTitle, boardContent, boardId);
				

	}

}
