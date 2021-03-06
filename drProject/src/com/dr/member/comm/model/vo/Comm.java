package com.dr.member.comm.model.vo;

import java.sql.Date;

public class Comm {
	
	private int commPostNo; 			// 커뮤니티 게시글번호 
	private String userNo; 				// 회원번호(작성자 회원번호)
	private int fileNo; 				// 파일번호 
	private String categoryName; 		// 카테고리명(1:운동tip!/2:식단공유)
	private String postContent; 		// 게시글내용  
	private String postTitle; 			// 게시글제목 
	private Date enrollDate; 			// 게시글등록일 
	private Date updateDate; 			// 게시글수정일
	private int boardView; 				// 게시글조회수 
	private String status;  			// 게시글삭제유무(Y/N) 
	private int commNo; 				// 게시판번호(1:나만의운동Tip/2:자유/3:질문)
	private int likeCount; 				// 게시글좋아요수 
	
	public Comm(){}

	public Comm(int commPostNo, String userNo, int fileNo, String categoryName, String postContent, String postTitle,
			Date enrollDate, Date updateDate, int boardView, String status, int commNo, int likeCount) {
		super();
		this.commPostNo = commPostNo;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.categoryName = categoryName;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.boardView = boardView;
		this.status = status;
		this.commNo = commNo;
		this.likeCount = likeCount;
	}

	public Comm(int commPostNo, String userNo, String categoryName, String postTitle, Date enrollDate, int boardView) {
		super();
		this.commPostNo = commPostNo;
		this.userNo = userNo;
		this.categoryName = categoryName;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
	}
	
	public Comm(int commPostNo, String userNo, String categoryName, String postContent, String postTitle,
			Date enrollDate, int boardView) {
		super();
		this.commPostNo = commPostNo;
		this.userNo = userNo;
		this.categoryName = categoryName;
		this.postContent = postContent;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
	}
	
	public Comm(int commPostNo, String userNo, String postTitle, Date enrollDate, int boardView) {
		super();
		this.commPostNo = commPostNo;
		this.userNo = userNo;
		this.postTitle = postTitle;
		this.enrollDate = enrollDate;
		this.boardView = boardView;
	}


	public Comm(int commPostNo, String userNo, String postTitle, Date updateDate, int boardView, int commNo,
			int likeCount) {
		super();
		this.commPostNo = commPostNo;
		this.userNo = userNo;
		this.postTitle = postTitle;
		this.updateDate = updateDate;
		this.boardView = boardView;
		this.commNo = commNo;
		this.likeCount = likeCount;
	}

	public int getCommPostNo() {
		return commPostNo;
	}

	public void setCommPostNo(int commPostNo) {
		this.commPostNo = commPostNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	
	public int getLikeCount() {
		return likeCount;
	}
	
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	@Override
	public String toString() {
		return "Comm [commPostNo=" + commPostNo + ", userNo=" + userNo + ", fileNo=" + fileNo + ", categoryName="
				+ categoryName + ", postContent=" + postContent + ", postTitle=" + postTitle + ", enrollDate="
				+ enrollDate + ", updateDate=" + updateDate + ", boardView=" + boardView + ", status=" + status
				+ ", commNo=" + commNo + ", likeCount=" + likeCount + "]";
	}

}