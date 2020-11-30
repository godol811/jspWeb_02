package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.room.bbc.dao.UserDao;
import com.room.bbc.dto.UserDto;

public class UserSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		UserDao dao = new UserDao();
		ArrayList<UserDto> dtos = dao.list();
		
		request.setAttribute("user", dtos);
	}

}
