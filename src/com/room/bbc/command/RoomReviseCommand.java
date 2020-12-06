package com.room.bbc.command;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
   		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); //현재시간
   		//사용자가 전송한 파일 'upload '파일로 간다.
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
			String roomImage = multi.getParameter("originImage");
			
			 String filename = "";
			 String filename2 = "";
			 String rfile = multi.getFilesystemName("roomImage01");
			 String rfile2 = multi.getFilesystemName("roomImage02");
			 String f_ext = "";
			
			 if(rfile != null){
			     File file_copy = new File(directory+rfile);
			     File file_copy2 = new File(directory+rfile2);
			     	if(file_copy.exists()) {
			     		f_ext = rfile.substring(rfile.length()-3,rfile.length());
			     		File file1 = new File(directory+now+"."+f_ext);
			     		File file2 = new File(directory+now+".detail."+f_ext);
			      
			     		file_copy.renameTo(file1);
			     		file_copy2.renameTo(file2);
			     		filename = file1.getName();
			     		filename2 = file2.getName();
			     	}
			     
			 } else {
				 filename = roomImage;
				 filename2 = "0";
			 }
			 
			 RoomListDao dao = new RoomListDao();
			 // filename2가 들어간 부분은 roomImageReal이다.
			 dao.roomRevise(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail ,roomCheckIn, roomCheckOut, filename);	
			//file 이란 이름은 wineList.jsp에 있는 name ="file" / DB에 넣기위해 스트링 변환
//			String roomImage = multi.getOriginalFileName("roomImage");
//			String roomImageReal = multi.getFilesystemName ("roomImage");
			
			// 확장자 정해주기
//			if(roomImage.endsWith(".doc") && roomImage.endsWith(".hwp") &&
//					roomImage.endsWith(".pdf") && roomImage.endsWith(".xls") && roomImage.endsWith(".zip")){
//				File file = new File(directory + roomImageReal);
//				file.delete(); 
//				
//				System.out.println("업로드할 수 없는 확장자 입니다.");
//			}else{
//				
//				RoomListDao dao = new RoomListDao();
//				dao.roomRegister(userId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail ,roomCheckIn, roomCheckOut, roomImage, roomImageReal);
//				dao.roomHostState(userId);
//				System.out.println("파일명 : " + roomImage + "<br>"); 
//				System.out.println("실제 파일명 : " + roomImageReal + "<br>"); 
//				
//				
//			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
		
//		String directory = request.getServletContext().getRealPath("/upload/"); 
//   		int maxSize = 300 * 300 * 10;
//   		String encoding = "UTF-8";
//   		
//   		MultipartRequest multi;
//   		
//		try {
//			multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
//   		
//		String roomTitle = multi.getParameter("roomTitle"); //jsp에 있는 내용을 여기서 받아주는 것이다.
//		String roomContent = multi.getParameter("roomContent");
//		
//		String roomId = (String)session.getAttribute("ROOMID");
//		String roomPrice = (String)session.getAttribute("ROOMPRICE");
//		String roomCapa = (String)session.getAttribute("ROOMCAPA");
//		String roomAddress = (String)session.getAttribute("ROOMADDRESS");
//		String roomAddressDetail = (String)session.getAttribute("ROOMADDRESSDETAIL");
//		String roomCheckIn = (String)session.getAttribute("ROOMCHECKIN");;
//		String roomCheckOut = (String)session.getAttribute("ROOMCHECKOUT");
//		String roomImage = multi.getOriginalFileName("roomImage");
//		String roomImageReal = multi.getFilesystemName ("roomImage");
//	
//		// 확장자 정해주기
//		if(roomImage.endsWith(".doc") && roomImage.endsWith(".hwp") &&
//				roomImage.endsWith(".pdf") && roomImage.endsWith(".xls") && roomImage.endsWith(".zip")){
//			File file = new File(directory + roomImageReal);
//			file.delete(); 
//			
//			System.out.println("업로드할 수 없는 확장자 입니다.");
//		}else{
//			
//			RoomListDao dao = new RoomListDao();
//			dao.roomRevise(roomId, roomTitle, roomContent, roomPrice, roomCapa, roomAddress, roomAddressDetail, roomCheckIn, roomCheckOut, roomImage, roomImageReal);
//			
//		}
//	} catch (IOException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//		
//	}

}
