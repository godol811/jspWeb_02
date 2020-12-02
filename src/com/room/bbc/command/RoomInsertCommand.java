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

public class RoomInsertCommand implements Command {

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
   		
   		//사용자가 전송한 파일 'upload '파일로 간다.
   		MultipartRequest multi;
   		
		try {
			multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
			String roomTitle = multi.getParameter("roomTitle"); //jsp에 있는 내용을 여기서 받아주는 것이다.
			String roomContent = multi.getParameter("roomContent");
			
			String userId = (String)session.getAttribute("USERID");
			String roomPrice = (String)session.getAttribute("ROOMPRICE");
			String roomCapa = (String)session.getAttribute("ROOMCAPA");
			String roomAddress = (String)session.getAttribute("ROOMADDRESS");
			String roomCheckIn = (String)session.getAttribute("ROOMCHECKIN");;
			String roomCheckOut = (String)session.getAttribute("ROOMCHECKOUT");
			//file 이란 이름은 wineList.jsp에 있는 name ="file" / DB에 넣기위해 스트링 변환
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
				dao.roomRegister(userId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
				dao.roomHostState(userId);
				System.out.println("파일명 : " + roomImage + "<br>"); 
				System.out.println("실제 파일명 : " + roomImageReal + "<br>"); 
				
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
