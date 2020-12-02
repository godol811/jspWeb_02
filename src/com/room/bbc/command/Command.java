package com.room.bbc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface Command {

	
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException;
}
	
	
	
