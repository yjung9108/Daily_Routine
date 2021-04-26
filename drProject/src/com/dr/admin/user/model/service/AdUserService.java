package com.dr.admin.user.model.service;
import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.user.model.dao.AdUserDao;
import com.dr.admin.user.model.vo.AdUser;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.comm.model.dao.CommDao;
import com.dr.member.comm.model.service.CommService;
import com.dr.member.comm.model.vo.Comm;

public class AdUserService {

	/**
	 * 1. 로그인
	 */
	public AdUser loginUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		AdUser loginUser = new AdUserDao().loginUser(conn, userId, userPwd);
		return loginUser;
		
	}
	
	
	
	/**
	 * 1. 회원전체 조회 : 갯수 조회
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new AdUserDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1. 회원 전체 조회
	 */
	public ArrayList<AdUser> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<AdUser> list = new AdUserDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 2. 관리자- 회원 탈퇴시키기
	 */
	public int deleteUser(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new AdUserDao().deleteUser(conn, userId, userPwd);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
}
