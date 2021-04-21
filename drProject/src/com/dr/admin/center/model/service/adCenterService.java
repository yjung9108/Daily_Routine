package com.dr.admin.center.model.service;

import static com.dr.common.JDBCTemplate.close;
import static com.dr.common.JDBCTemplate.commit;
import static com.dr.common.JDBCTemplate.getConnection;
import static com.dr.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dr.admin.center.model.dao.adCenterDao;
import com.dr.admin.center.model.vo.adCenterFaq;
import com.dr.admin.center.model.vo.adCenterQuery;
import com.dr.common.model.vo.PageInfo;
import com.dr.member.center.model.dao.CenterDao;

public class adCenterService {

	
	public int faqSelectListCount(String category) { //faq글 갯수 카운트 메소드
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().faqSelectListCount(conn, category);
		
		close(conn);
		return listCount;
	}




	public ArrayList <adCenterFaq> faqselectList(PageInfo pi, String category) { //faq글 카테고리별 어레이리스트에 담기
		Connection conn = getConnection();
		ArrayList <adCenterFaq> list = new adCenterDao().faqSelectList(conn, pi, category);
		close(conn);
		return list;
	}




	public adCenterFaq selectFaq(int faqNo) { // faq디테일 내역조회
		Connection conn = getConnection();
		
		adCenterFaq f = new adCenterDao().selectFaq(conn, faqNo);
		close(conn);
		return f;
	}

	
	/*
	public int faqIncreaseCount(int faqNo) { // faq조회수 증가
		Connection conn = getConnection();
		int result = new adCenterDao().faqIncreaseCount(conn, faqNo);
	}
	
	*/


	public int insertFaq(adCenterFaq f) { // faq글 등록하기
		Connection conn = getConnection();
		
		int result = new adCenterDao().insertFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}




	public int deleteFaq(int faqNo) { // faq테이블에서 삭제할거임
		Connection conn = getConnection();
		int result = new adCenterDao().deleteFaq(conn, faqNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}




	public int updateFaq(adCenterFaq f) {
		Connection conn = getConnection();
		int result = new adCenterDao().updateFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} return result;
	}




	public int searchFaqListCount(String searchFaq) { // FAQ검색결과 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().searchFaqListCount(conn, searchFaq);
		
		close(conn);
		return listCount;
		}

	
	
	public ArrayList<adCenterFaq> searchFaqList(PageInfo pi, String searchFaq) { // FAQ검색결과 리스트
		Connection conn = getConnection();
		ArrayList<adCenterFaq> list = new adCenterDao().searchFaqList(conn, pi, searchFaq);
		close(conn);
		return list;
	}



	//----------------------------1:1문의---------------------------
	public int queryListCount() { // 전체 문의 글갯수 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().queryListCount(conn);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterQuery> queryList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList <adCenterQuery> list = new adCenterDao().queryList(conn, pi);
		close(conn);
		return list;
	}
	
	
	
	
	public int querySelectListCount(String reStatus) { // 답변상태값으로 글갯수 카운트
		Connection conn = getConnection();
		
		int listCount = new adCenterDao().querySelectListCount(conn, reStatus);
		
		close(conn);
		return listCount;
	}




	public ArrayList<adCenterQuery> querySelectList(PageInfo pi, String reStatus) {
		Connection conn = getConnection();
		ArrayList <adCenterQuery> list = new adCenterDao().querySelectList(conn, pi, reStatus);
		close(conn);
		return list;
	}



	




	

	
	

}
