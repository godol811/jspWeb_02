package com.room.bbc.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.room.bbc.dao.RoomListDao;

public class RoomReviseCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String directory = request.getServletContext().getRealPath("/upload/"); 
   		int maxSize = 300 * 300 * 10;
   		String encoding = "UTF-8";
   		
   		MultipartRequest multi;
   		
		try {
			multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
   		
		String roomTitle = multi.getParameter("roomTitle"); //jsp에 있는 내용을 여기서 받아주는 것이다.
		String roomContent = multi.getParameter("roomContent");
		
		String roomId = (String)session.getAttribute("ROOMID");
		String roomPrice = (String)session.getAttribute("ROOMPRICE");
		String roomCapa = (String)session.getAttribute("ROOMCAPA");
		String roomAddress = (String)session.getAttribute("ROOMADDRESS");
		String roomAddressDetail = (String)session.getAttribute("ROOMADDRESSDETAIL");
		String roomCheckIn = (String)session.getAttribute("ROOMCHECKIN");;
		String roomCheckOut = (String)session.getAttribute("ROOMCHECKOUT");
		String roomImage = multi.getOriginalFileName("roomImage");
		String roomImageReal = multi.getFilesystemName ("roomImage");
	
		// 확장자 정해주기
		if(roomImage.endsWith(".doc") && roomImage.endsWith(".hwp") &&
				roomImage.endsWith(".pdf") && roomImage.endsWith(".xls") && roomImage.endsWith(".zip")){
			File file = new File(directory + roomImageReal);
			file.delete(); 
			
			System.out.println("업로드할 수 없는 확장자 입니다.");
		}else{
			
			RoomListDao dao = new RoomListDao();
			dao.roomRevise(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
			
		}
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}

}
