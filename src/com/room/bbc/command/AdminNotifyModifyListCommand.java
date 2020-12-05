package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.command.Command;
import com.room.bbc.dao.BoardDao;
import com.room.bbc.dto.BoardDto;

public class AdminNotifyModifyListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String boardId = (String)request.getParameter("boardId");
		BoardDao dao = new BoardDao();
		ArrayList<BoardDto>  dtos = dao.modifylist(boardId);
		request.setAttribute("list", dtos);
		System.out.println(boardId);
	}

}
