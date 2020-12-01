package com.room.bbc.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.room.bbc.dao.RoomListDao;


public class RoomInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String directory = request.getServletContext().getRealPath("/upload/"); 
   		int maxSize = 300 * 300 * 10;
   		String encoding = "UTF-8";
   		
   		//사용자가 전송한 파일 'upload '파일로 간다.
   		MultipartRequest multi;
   		
		try {
			multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
			String pTitle = multi.getParameter("pTitle"); //jsp에 있는 내용을 여기서 받아주는 것이다.
			String pContent = multi.getParameter("pContent");
			
			//file 이란 이름은 wineList.jsp에 있는 name ="file" / DB에 넣기위해 스트링 변환
			String pImage = multi.getOriginalFileName("file");
			String pImageReal = multi.getFilesystemName ("file");
			
			// 확장자 정해주기
			if(pImage.endsWith(".doc") && pImage.endsWith(".hwp") &&
					pImage.endsWith(".pdf") && pImage.endsWith(".xls")){
				File file = new File(directory + pImageReal);
				file.delete(); 
				
				System.out.println("업로드할 수 없는 확장자 입니다.");
			}else{
				
				RoomListDao dao = new RoomListDao();
				dao.roomRegister(pTitle, pContent, pImage, pImageReal);
				System.out.println("파일명 : " + pImage + "<br>"); 
				System.out.println("실제 파일명 : " + pImageReal + "<br>"); 
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
