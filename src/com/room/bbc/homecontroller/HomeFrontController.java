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

import com.room.bbc.command.AdminNotifyDeleteCommand;
import com.room.bbc.command.AdminNotifyInsertCommand;
import com.room.bbc.command.AdminNotifyListCommand;
import com.room.bbc.command.AdminNotifyModifyListCommand;
import com.room.bbc.command.AdminNotifyUpdateCommand;
import com.room.bbc.command.Command;
import com.room.bbc.command.HostRoomListCommand;
import com.room.bbc.command.HostRoomReservationSelectCommand;
import com.room.bbc.command.HostRoomViewCommand;
import com.room.bbc.command.JoinCheckCommand;
import com.room.bbc.command.MessageHistoryCommand;
import com.room.bbc.command.MessageInsertCommand;
import com.room.bbc.command.MessageListCommand;
import com.room.bbc.command.MessageSelectCommand;
import com.room.bbc.command.MessageSelectHostCommand;
import com.room.bbc.command.PagingCommand1;
import com.room.bbc.command.PagingCommand2;
import com.room.bbc.command.PagingCommandDirect1;
import com.room.bbc.command.PagingCommandDirect2;
import com.room.bbc.command.RoomAdminDeleteCommand;
import com.room.bbc.command.RoomAdminSelectCommand;
import com.room.bbc.command.RoomAdminUpdateCommand;
import com.room.bbc.command.RoomDeleteCommand;
import com.room.bbc.command.RoomGPSSelectCommand;
import com.room.bbc.command.RoomInsertCommand;
import com.room.bbc.command.RoomReservationInsertCommand;
import com.room.bbc.command.RoomReservationSelectCommand;
import com.room.bbc.command.RoomReservationViewCommand;
import com.room.bbc.command.RoomReviewDeleteCommand;
import com.room.bbc.command.RoomReviewInsertCommand;
import com.room.bbc.command.RoomReviewSelectCommand;
import com.room.bbc.command.RoomReviewUpdateCommand;
import com.room.bbc.command.RoomReviseCommand;
import com.room.bbc.command.RoomSelectCommand;
import com.room.bbc.command.RoomUpdateCommand;
import com.room.bbc.command.UserInsertCommand;
import com.room.bbc.command.UserPWFindCommand;
import com.room.bbc.command.UserRoomReservationSelectCommand;
import com.room.bbc.command.UserSelectCommand;
import com.room.bbc.command.UserAdminDeleteCommand;
import com.room.bbc.command.UserIDFindCommand;

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
		// 리뷰 더보기 메뉴
		
		case ("/mainPage.room"):
		command = new AdminNotifyListCommand();
		command.execute(request, response, session);
		viewPage = "mainPage.jsp";
		break; 
	
		
		
		case ("/Rating_list.room"):
			command = new RoomReviewSelectCommand();
			command.execute(request, response, session);
			viewPage = "Rating_list.jsp";
			break;
		
		// 리뷰 입력
		case ("/Rating_InsertAction.room"):
			command = new RoomReviewInsertCommand();
			command.execute(request, response, session);
			viewPage = "bookList.room";
			break;
		
		// 리뷰 삭제
		case ("/delete.do"):
			command = new RoomReviewDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		
			
		//----------------- 숙소 예약 -------------------------
		// 숙소 예약
		case ("/bookInsert.room"):
			command = new RoomReservationInsertCommand();
			command.execute(request, response, session);
			viewPage = "mainPage.jsp";
			break;
			
		case ("/bookPage.room"):
			command = new RoomReservationSelectCommand();
			command.execute(request, response, session);
			command = new RoomGPSSelectCommand();
			command.execute(request, response, session);
			viewPage = "book01.jsp"; 
			break;	
		
		case ("/bookPage2.room"):
			command = new RoomReservationSelectCommand();
			command.execute(request, response, session);
			viewPage = "book02.jsp"; 
			break;	
		
		// 숙소 예약 조회(회원)
		case ("/bookList.room"):
			command = new UserRoomReservationSelectCommand();
			command.execute(request, response, session);
			viewPage = "bookList.jsp";
			break;
			
		// 숙소 상세 내용 조회	
		case ("/bookView.room"):
			command = new RoomReservationViewCommand();
			command.execute(request, response, session);
			viewPage = "bookView.jsp";
			break;
			
			
		//user CRUD-------------------------
		case ("/login.room"): // 입력화면
			viewPage = "login.jsp";
		break;	
			
		case("/findIdAction.room"):		
			command = new UserIDFindCommand();
		command.execute(request, response);
		viewPage="findIdresult.jsp";
		break;
		
		case("/findPwAction.room"):		
			command = new UserPWFindCommand();
		command.execute(request, response);
		viewPage="findPwresult.jsp";
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
		case ("/logout.room"):
			session.invalidate();
		viewPage = "mainPage.jsp";
		break;
		 
		//----------------- 관리자---------------------------------
		case("/AdminUserList.room"):		
			command = new UserSelectCommand();
		command.execute(request, response);
		viewPage="AdminUserList.jsp";
		break;
		
		case("/AdminUserDelete.room"):		//삭제라고 해놓고 수정이라고 한다 회원 -> 탈퇴
			command = new UserAdminDeleteCommand();
		command.execute(request, response);
		viewPage="AdminUserList.room";
		break;
		
		case("/AdminRoomList.room"):		
			command = new RoomSelectCommand();
		command.execute(request, response);
		viewPage="AdminRoomList.jsp";
		break;
		
		case("/AdminRoomModifyList.room"):		
			command = new RoomAdminSelectCommand();
		command.execute(request, response);
		viewPage="AdminRoomListModify.jsp";
		break;
		
		case("/AdminRoomModify.room"):		
			command = new RoomAdminUpdateCommand();
		command.execute(request, response);
		viewPage="AdminRoomList.room";
		break;
		
		case("/AdminRoomDelete.room"):		
			command = new RoomAdminDeleteCommand();
		command.execute(request, response);
		viewPage="AdminRoomList.room";
		break;
		
		case("/AdminNotifyList.room"):		
			command = new AdminNotifyListCommand();
		command.execute(request, response, session);
		viewPage="AdminNotifyList.jsp";
		break;
		case("/AdminNotifyModify.room"):		
			command = new AdminNotifyModifyListCommand();
			command.execute(request, response, session);
		viewPage="AdminNotifyModify.jsp";
		break;
		case("/AdminNotifyModifyAction.room"):		
			command = new AdminNotifyUpdateCommand();
			command.execute(request, response, session);
		viewPage="AdminNotifyList.room";
		break;
		case("/AdminNotifyDelete.room"):		
			command = new AdminNotifyDeleteCommand();
		command.execute(request, response, session);		
		viewPage="AdminNotifyList.room";
		break;
		case("/AdminNotifyInsert.room"):		
			command = new AdminNotifyInsertCommand();
		command.execute(request, response, session);
		viewPage="AdminNotifyList.room";
		break;
		
		
		
		//----------------- 호스트 메뉴-------------------------
		//호스트 숙소 등록
		case ("/hostRegister.room"):
			command = new RoomInsertCommand();
			command.execute(request, response, session);	
			viewPage = "mainPage.jsp";
			break;
			
		//호스트 예약현황 조회
		case ("/hostRoomReservation.room"):
			command = new HostRoomReservationSelectCommand();
			command.execute(request, response, session);
			viewPage = "HostRoomReservationSelect.jsp";
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
			command.execute(request, response, session);;
			viewPage = "hostRoomList.room";
			break;
		
		// 호스트 숙소 삭제
		case ("/hostRoomDelete.room"):
			command = new RoomDeleteCommand();
			command.execute(request, response);
			viewPage = "/hostRoomList.room";
			break;
		
			
		//-----------------검색결과-------------------------
		// 검색	
		case ("/roomSearchPaging.room"):
			command = new PagingCommand2();  //페이징
			command.execute(request, response, session);
			viewPage = "RoomSearchList.jsp";
			break;
		
		
		
		case ("/roomSearch.room"):
			command = new PagingCommand1(); //리스트 첫번째 페이지
			command.execute(request, response, session);
			viewPage = "RoomSearchList.jsp";
			break;

		
			
		//-----------------검색결과 링크 다이렉트-------------------------
		// 검색	
		case ("/roomSearchPagingDirect.room"):
			command = new PagingCommandDirect2();  //페이징
			command.execute(request, response, session);
			viewPage = "RoomSearchList.jsp";
			break;
		
		
		
		case ("/roomSearchDirect.room"):
			command = new PagingCommandDirect1(); //리스트 첫번째 페이지
			command.execute(request, response, session);
			viewPage = "RoomSearchList.jsp";
			break;
			
			//-----------------메세지-------------------------
			// 검색	
			
			
		case("/HostMessage.room"):
			command = new MessageListCommand();
			command.execute(request, response, session);
			command = new MessageSelectHostCommand();
			command.execute(request, response, session);
			viewPage = "div2.jsp";//@@@@@@@@@@@@@@@@@
			break;
		
		
		case ("/sendMessage.room")://DB주고받은 메세지 입력.
			command = new MessageInsertCommand();
			command.execute(request, response, session);
			viewPage = "div2.jsp";
			break;
			
		case ("/userMessage.room")://DB주고받은 메세지 입력.
			command = new MessageListCommand();
			command.execute(request, response, session);
			viewPage = "messageList.jsp";
			break;	
			
		case ("/messageHistory.room")://DB주고받은 메세지 입력.
			command = new MessageHistoryCommand();
			command.execute(request, response, session);
			viewPage = "messageHistory.jsp";
			break;		
			
		case ("/messageList.room"): //주고 받은 메세지 보이기
			command = new MessageSelectCommand();
			command .execute(request, response, session);
			command = new MessageListCommand();//@@@@@@@
			command.execute(request, response, session);//@@@@@@@
			viewPage = "div2.jsp"; //@@@@@@@@@@@@@@@@@@@@
			break;
			
			
			default:
			viewPage = "mainPage.room";
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
}
}