package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.UserDao;
import com.room.bbc.dto.UserDto;

public class UserPWFindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String userTel = request.getParameter("userTel");
		String userId = request.getParameter("userId");
		UserDao dao = new UserDao();
		ArrayList<UserDto> dtos = dao.findPw(userName, userTel, userId);
	
		request.setAttribute("list", dtos);
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
