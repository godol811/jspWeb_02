package com.room.bbc.homecontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.bbc.command.Command;
import com.room.bbc.command.HostRoomListCommand;
import com.room.bbc.command.HostRoomViewCommand;
import com.room.bbc.command.JoinCheckCommand;
import com.room.bbc.command.RoomDeleteCommand;
import com.room.bbc.command.RoomInsertCommand;
import com.room.bbc.command.RoomReviewDeleteCommand;
import com.room.bbc.command.RoomReviewInsertCommand;
import com.room.bbc.command.RoomReviewSelectCommand;
import com.room.bbc.command.RoomReviewUpdateCommand;
import com.room.bbc.command.RoomReviseCommand;
import com.room.bbc.command.UserInsertCommand;
import com.room.bbc.command.UserSelectCommand;
import com.room.bbc.command.UserUpdateCommand;

/**
 * Servlet implementation class HomeFrontController
 */
@WebServlet("*.room")
public class HomeFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);

	}

	//---------------------
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		Command command = null;
		String viewPage = null;
		
		
		switch(com) {

		//리뷰 CRUD-------------------------------
		case ("/Rating_list.room"):
			command = new RoomReviewSelectCommand();
			command.execute(request, response);
			viewPage = "Rating_list.jsp";
			break;
		
		case ("/Rating_Write.room"): // 입력화면
			viewPage = "Rating_write.jsp";
		break;
			
		case ("/Rating_InsertAction.room"):
			command = new RoomReviewInsertCommand();
			command.execute(request, response);
			viewPage = "Rating_list.room";
			break;
			
		case ("/delete.do"):
			command = new RoomReviewDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
			
			
		//user CRUD-------------------------
			

		case ("/login.room"): // 입력화면
			viewPage = "login.jsp";
		break;	
			
			
		case("/SignUpCheck.room"):		
			command = new JoinCheckCommand();
			command.execute(request, response);
			viewPage="SignUp.room";
			break;
			//회원가입
		
		case("/SignUp.room"):
			String joinCheck = (String)request.getAttribute("JOIN");
			//회원가입 성공했을떄
			if(joinCheck.equals("ok")) {	
				command = new UserInsertCommand();
				command.execute(request, response);
				viewPage = "login.jsp";
			//회원가입 실패했을때
			}else {
			viewPage = "SignUp.jsp";
			}
		break;
		 
		//----------------- 관리자---------------------------------
		case("/AdminUserList.room"):		
			command = new UserSelectCommand();
		command.execute(request, response);
		viewPage="UserList.jsp";
		break;
		
		case("/UserDelete.room"):		
			command = new UserUpdateCommand();
		command.execute(request, response);
		viewPage="AdminUserList.room";
		break;
		case ("/logout.room"):
			session.invalidate();
		viewPage = "mainPage.jsp";
		break;
		
		
		//----------------- 호스트 메뉴-------------------------
		//호스트 숙소 등록
		case ("/hostRegister.room"):
			command = new RoomInsertCommand();
			command.execute(request, response, session);	
			viewPage = "mainPage.jsp";
			break;
			
		//호스트 숙소 리스트
		case ("/hostRoomList.room"):
			command = new HostRoomListCommand();
			command.execute(request, response, session);
			viewPage = "hostRoomList.jsp";
			break;
			
		//호스트 숙소 클릭
		case ("/roomListView.room"):
			command = new HostRoomViewCommand();
			command.execute(request, response, session);
			viewPage = "hostRegisterRoom01.jsp";
			break;
			
		// 호스트 숙소 수정
		case ("/hostRoomRevise.room"):
			command = new RoomReviseCommand();
			command.execute(request, response);
			viewPage = "hostRoomList.room";
			break;
		
		// 호스트 숙소 삭제
		case ("/hostRoomDelete.room"):
			command = new RoomDeleteCommand();
			command.execute(request, response);
			viewPage = "/hostRoomList.room";
			break;
		
		default :
			viewPage = "mainPage.jsp";
			break; 
		
	}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
}
}