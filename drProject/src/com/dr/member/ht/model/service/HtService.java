package com.dr.member.ht.model.service;

import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.ht.model.dao.HtDao;
import com.dr.member.ht.model.vo.Ht;

public class HtService {


	public int selectSearchListCount(String searchTitle) {
		
		Connection conn = getConnection();
		int listCount = new HtDao().selectSearchListCount(conn, searchTitle);
		close(conn);
		return listCount;
	}

	
	public int selectAllListCount() {
		
		Connection conn = getConnection();
		int listCount = new HtDao().selectAllListCount(conn);
		close(conn);
		return listCount;
	
	}
	
	public ArrayList<Ht> selectSearchHtList(String value, String searchTitle, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectSearchHtList(conn, value, searchTitle, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Ht> selectAllHtList(String value, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectAllHtList(conn, value, pi);
		close(conn);
		return list;
	}

	public int selectBodyListCount(String category) {
		
		Connection conn = getConnection();
		int listCount = new HtDao().selectListCount(conn, category);
		close(conn);
		return listCount;
	
	}

	public ArrayList<Ht> selectBodyHtList(String category, String value, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectHtList(conn, category, value, pi);
		close(conn);
		return list;
	}

	public int selectAbsListCount(String category) {
		Connection conn = getConnection();
		int listCount = new HtDao().selectListCount(conn, category);
		close(conn);
		return listCount;
	}

	public ArrayList<Ht> selectAbsHtList(String category, String value, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectHtList(conn, category, value, pi);
		close(conn);
		return list;
	}

	public int selectLowerListCount(String category) {
		Connection conn = getConnection();
		int listCount = new HtDao().selectListCount(conn, category);
		close(conn);
		return listCount;
	}

	public ArrayList<Ht> selectLowerHtList(String category, String value, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectHtList(conn, category, value, pi);
		close(conn);
		return list;
	}

	public int selectStrechingListCount(String category) {
		Connection conn = getConnection();
		int listCount = new HtDao().selectListCount(conn, category);
		close(conn);
		return listCount;
	}

	public ArrayList<Ht> selectStrechingHtList(String category, String value, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectHtList(conn, category, value, pi);
		close(conn);
		return list;
	}

	public int selectUpperListCount(String category) {
		Connection conn = getConnection();
		int listCount = new HtDao().selectListCount(conn, category);
		close(conn);
		return listCount;
	}

	public ArrayList<Ht> selectUpperHtList(String category, String value, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Ht> list = new HtDao().selectHtList(conn, category, value, pi);
		close(conn);
		return list;
	}
	
	public int increaseCount(int hno) {
		Connection conn = getConnection();
		int result = new HtDao().increaseCount(conn, hno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Ht selectPost(int hno) {
		Connection conn = getConnection();
		Ht h = new HtDao().selectPost(conn, hno);
		
		close(conn);
		return h;
	}
//		




	
		
		
}