package com.dr.member.user.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.member.user.model.service.UserService;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class UserInsertServlet
 */
@WebServlet("/insert.us")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	      
	      //int userNo = request.getParameter("userNo");
	      String userId = request.getParameter("userId");
	      String userPwd = request.getParameter("userPwd");
	      String userName = request.getParameter("userName");
	      String birth = request.getParameter("birth");
	      String gender = request.getParameter("gender");
	      String email = request.getParameter("email");
	      String phone = request.getParameter("phone");
	      //Date enrollDate = request.getParameter("enrollDate");
	      //String leaveCheck = request.getParameter("leaveCheck");
	      //String suspended = request.getParameter("suspended");
	      //String reportCheck = request.getParameter("reportCheck");
	      //String adminCheck = request.getParameter("adminCheck");
	      
	      User u = new User(userId, userPwd, userName, birth, gender, email, phone);
	      
	      int result = new UserService().insertUser(u);
	      
	      if(result > 0) {
	    	 //그냥 회원가입 3번째 단계빼고 이렇게 할까 ㅎㅎ
	         HttpSession session = request.getSession();
	         session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
	         
	         response.sendRedirect(request.getContextPath());
	      }else {
	         request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
	         
	         request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	      }
	   }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
