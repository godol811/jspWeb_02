package com.room.bbc.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.dao.RoomSearchDao;
import com.room.bbc.dto.RoomSearchDto;

public class PagingCommand2 implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		

	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String location = request.getParameter("location");
		int	   guest    = Integer.parseInt(request.getParameter("guest"));
		String date1	= (String) session.getAttribute("DATE1");
		String date2	= (String) session.getAttribute("DATE2");
		
		RoomSearchDao dao = new RoomSearchDao();
		ArrayList<RoomSearchDto> dtos = dao.RoomsearchList(location, guest, date1, date2);
		
		
		int noticeViewRowCount = dao.RoomSearchListRowCount(location, guest, date1, date2);
		
		int RowCount = noticeViewRowCount;
		
		// paging start
		
		
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		int pageRow=10;
		
		int beginNum=(nowPage*pageRow)-pageRow;
		
		int endNum=(nowPage*pageRow)-1;
		
		int totalPage=(RowCount/pageRow);
		if(RowCount%10!=0) {
			totalPage++;
		}
		
//		for(int i=1;i<=totalPage;i++) {
//			if(nowPage==i) {
//				beginNum=(i*pageRow)-pageRow;
//				endNum=(i*pageRow)-1;
//			}
//		}
		
		System.out.println("bNUM = "+beginNum);
		System.out.println("nNum = "+endNum);
		System.out.println("location = " + location);
		System.out.println("guest = " + guest);
		// 리스트
		request.setAttribute("list", dtos);
		//페이지
		request.setAttribute("beginNum", beginNum);
		request.setAttribute("endNum", endNum);
		request.setAttribute("totalPage", totalPage);
		// TODO Auto-generated method stub

	}

}
