package com.dr.member.center.model.dao;

import static com.dr.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dr.member.center.model.vo.CenterFaq;
import com.dr.member.center.model.vo.CenterNotice;
import com.dr.member.center.model.vo.CenterQuery;

public class CenterDao {
	
	private Properties prop = new Properties();
	
	public CenterDao() {
		
		String fileName = CenterDao.class.getResource("/sql/center/center-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CenterNotice> noticeList(Connection conn) {
		
		ArrayList<CenterNotice> list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("noticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new CenterNotice(rset.getInt("notice_no"),
										  rset.getString("notice_title"),
										  rset.getString("notice_content"),
										  rset.getDate("create_date"),
										  rset.getInt("notice_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		} return list;
		
		
		
	}



	public int increaseCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}

	public CenterNotice selectNotice(Connection conn, int noticeNo) {
		
		CenterNotice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new CenterNotice(rset.getInt("notice_no"),
									 rset.getString("notice_title"),
									 rset.getString("notice_content"),
									 rset.getDate("create_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return n;
	}

	public CenterNotice selectNoticePre(Connection conn, int noticeNo) {
		CenterNotice nPre = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (noticeNo-1));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nPre = new CenterNotice(rset.getInt("notice_no"),
						 				rset.getString("notice_title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return nPre;
	}

	public CenterNotice selectNoticeNext(Connection conn, int noticeNo) {
		CenterNotice nNext = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (noticeNo+1));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nNext = new CenterNotice(rset.getInt("notice_no"),
		 							     rset.getString("notice_title"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return nNext;
	}

	

	public ArrayList<CenterFaq> faqList(Connection conn, String category) {
		
		ArrayList<CenterFaq> faqList = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("faqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { 
			
				faqList.add(new CenterFaq(rset.getInt("faq_no"),
											   rset.getInt("user_no"),
											   rset.getString("FAQ_CATEGORY"),
											   rset.getString("faq_title"),
											   rset.getString("faq_content")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return faqList;
		
	}

	public ArrayList<CenterNotice> shortNoticeList(Connection conn) {
		ArrayList<CenterNotice> shortNoticeList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("shorNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				shortNoticeList.add(new CenterNotice(rset.getString("notice_title"),
													rset.getString("notice_content"),
													rset.getDate("create_date")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return shortNoticeList;
	}

	public ArrayList<CenterQuery> queryList(Connection conn, int userNo) {
		
		ArrayList<CenterQuery> queryList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("queryList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				queryList.add(new CenterQuery (rset.getInt("query_no"),
											   rset.getInt("user_no"),
											   rset.getString("query_category"),
											   rset.getString("QUERY_TITLE"),
											   rset.getString("QUERY_CONTENT"),
											   rset.getDate("QUERY_CREATE_DATE"),
											   rset.getString("REPLY_STATUS"),
											   rset.getString("REPLY_CONTENT"),
											   rset.getDate("REPLY_DATE")));
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return queryList;
		
	}
	

	
	

}


	