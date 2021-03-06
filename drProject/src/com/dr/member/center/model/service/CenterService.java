package com.dr.member.center.model.service;

import static com.dr.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.dao.CenterDao;
import com.dr.member.center.model.vo.CenterFaq;
import com.dr.member.center.model.vo.CenterNotice;
import com.dr.member.center.model.vo.CenterQuery;

public class CenterService {

	
	//--------------공지사항-----------------------
	public ArrayList<CenterNotice> noticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<CenterNotice> list = new CenterDao().noticeList(conn);
		
		close(conn);
		return list;
	}
	
	
	

	public int noticeIncreaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new CenterDao().noticeIncreaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

	public CenterNotice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		CenterNotice n = new CenterDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
		
	}
	
	

	

	public ArrayList<CenterNotice> shortNoticeList() {
		Connection conn = getConnection();
		
		ArrayList<CenterNotice> shortNoticeList = new CenterDao().shortNoticeList(conn);
		
		close(conn);
		return shortNoticeList;
	}

	
	
	public int noticeSelectListCount() {
		Connection conn = getConnection();
		
		int listCount = new CenterDao().noticeSelectListCount(conn);
		
		close(conn);
		return listCount;
		
		
		
	}

	public ArrayList<CenterNotice> noticeSelectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<CenterNotice> list = new CenterDao().noticeSelectList(conn, pi);
		close(conn);
		return list;
	}


	public int searchNoticeCount(String searchNoticeCtg, String searchNoticeText) { // Notice검색결과 카운트
		Connection conn = getConnection();
		
		int listCount = new CenterDao().searchNoticeCount(conn, searchNoticeCtg, searchNoticeText);
		
		close(conn);
		return listCount;
	}




	public ArrayList<CenterNotice> searchNoticeList(PageInfo pi, String searchNoticeCtg, String searchNoticeText) { //  Notice검색결과 리스트
		Connection conn = getConnection();
		ArrayList<CenterNotice> list = new CenterDao().searchNoticeList(conn, pi, searchNoticeCtg, searchNoticeText);
		close(conn);
		return list;
	}


	
	
	//------------------faq-----------------


	public int faqSelectListCount(String category) {
		Connection conn = getConnection();
		
		int listCount = new CenterDao().faqSelectListCount(conn, category);
		
		close(conn);
		return listCount;
	}




	public ArrayList<CenterFaq> faqselectList(PageInfo pi, String category) {
		Connection conn = getConnection();
		ArrayList<CenterFaq> list = new CenterDao().faqSelectList(conn, pi, category);
		close(conn);
		return list;
	}


	public int searchFaqListCount(String searchFaq) { // FAQ검색결과 카운트
		Connection conn = getConnection();
		
		int listCount = new CenterDao().searchFaqListCount(conn, searchFaq);
		
		close(conn);
		return listCount;
		}

	
	
	public ArrayList<CenterFaq> searchFaqList(PageInfo pi, String searchFaq) { // FAQ검색결과 리스트
		Connection conn = getConnection();
		ArrayList<CenterFaq> list = new CenterDao().searchFaqList(conn, pi, searchFaq);
		close(conn);
		return list;
	}




	//----------------1:1--------------------------

	public int insertQuery(CenterQuery q) { // 문의 등록
		Connection conn = getConnection();
		
		int result = new CenterDao().insertQuery(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}


	public int querySelectListCount(int userNo) { //문의내역리스트 카운트
		Connection conn = getConnection();
		
		int listCount = new CenterDao().querySelectListCount(conn, userNo);
		
		close(conn);
		return listCount;
	}


	public ArrayList<CenterQuery> querySelectList(PageInfo pi, int userNo) { // 문의내역 리스트
		Connection conn = getConnection();
		ArrayList<CenterQuery> list = new CenterDao().querySelectList(conn, pi, userNo);
		close(conn);
		return list;
	}




	


	public int deleteQuery(int queryNo) { // 문의내역 삭제 메소드
		Connection conn = getConnection();
		int result = new CenterDao().deleteQuery(conn, queryNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}


}
