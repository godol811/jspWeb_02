package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.room.bbc.dao.UserDao;

public class UserInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
//		String userPwCheck = request.getParameter("userPwCheck");
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress");
		String userTel = request.getParameter("userTel");
		
		
		
		UserDao dao = new UserDao();
		dao.write(userId, userPw, userName, userAddress, userTel);
		
	
		
	}

}
