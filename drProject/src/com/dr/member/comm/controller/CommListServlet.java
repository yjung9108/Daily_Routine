package com.dr.member.comm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Comm;
import com.dr.member.user.model.vo.User;

/**
 * Servlet implementation class CommListServlet
 */
@WebServlet("/commMain.co")
public class CommListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) { 
			
			
		// 페이징 처리 
		int listCount; 			
		int currentPage = 1;		
		int pageLimit; 			
		int boardLimit; 		

		int maxPage; 			
		int startPage;    		// pageLimit, currentPage에 영향을 받음 
		int endPage; 			// pageLimit, startPage에 영향을 받음 
		
		listCount = new CommService().tipSelectListCount(); 
		//System.out.println(listCount); 
		
		String currentPageParam = request.getParameter("currentPage");
		
		if(currentPageParam!=null)	currentPage =  Integer.parseInt(currentPageParam);
	 
		
		pageLimit = 10; // 페이징 바 10개 단위 
		boardLimit = 10; // 한 페이지당 게시글 10개씩 
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1; 
		
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
		
		// 페이징 정보들을 한 공간에 담아둘 것
		// 1. 페이징바 만들 때 필요한 PageInfo 객체 
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		//System.out.println(pi);
		
		// 2. currentPage(현재 페이지)에 보여질 게시글 리스트 조회 
		ArrayList<Comm> list = new CommService().tipSelectList(pi);
		
		/*
		for(Comm c : list) { 
			System.out.println(c); 
		}
		*/
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/comm/commMainTipListView.jsp").forward(request, response);
		
		
		} else {
			
			request.getSession().setAttribute("alertMsg", "회원만 이용 가능한 서비스입니다. 로그인 후 이용 부탁드립니다.");
			response.sendRedirect(request.getContextPath()+"/loginForm.us");
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
