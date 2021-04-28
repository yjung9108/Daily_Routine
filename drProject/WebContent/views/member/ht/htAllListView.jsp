<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.ht.model.vo.Ht, com.dr.common.model.vo.PageInfo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<!-- <link rel="stylesheet" href="../../../resources/css/reListView.css">  -->
<style>
	.listArea{
		display: inline-block;
	}
	.pagingArea{
        width: 100%;
    }	
    .thumbnail{
    	cursor:pointer;
    }
</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div class="wrap">
		<div id="content">
			<div id="content_1">
                <h1>Home<br>Training</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/allList.ht?currentPage=1" style="color:rgb(250, 214, 9);">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/bodyList.ht?currentPage=1">전신 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/absList.ht?currentPage=1">복부 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/upperList.ht?currentPage=1">상체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/lowerList.ht?currentPage=1">하체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/strechingList.ht?currentPage=1">스트레칭</a></div>
                </div>
            </div>
            
            

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>HomeTraining > 전체</h2>
                    <hr>
                    <p>홈트레이닝 전체 조회입니다.</p>
                </div>
                <br><br><br>
				<div id="content_2_2">

					<div class="tipcategory" style="margin-left:10px">
						<select id="category" name="category">
							<option value="upload" >업로드순</option>
							<option value="like">좋아요순</option>
							<option value="view">조회수순</option>
						</select>
					</div>
					
					<script>
						// 기본 상태 업로드 순
						$(function(){
							//$(".listArea").load("allListArea.ht?currentPage=1");
							
							$("select[name=category]").change(function(){
							var value = ($(this).val());
							
							$.ajax({
								type:"post",
								url: "allListArea.ht?currentPage=1",
								data:{
									value:value
								},success:function(map){
									//$(".listArea").load("allListArea.ht?currentPage=1");
									//console.log(map);
									console.log(map.pi);
									console.log(map.list);
								},error:function(){
									cosole.log("실패");
								}
							})
						})
						})
					
						
						
						
						
					</script>

					<div align="center" class="searchArea">
						<form action="<%= contextPath %>/searchList.ht" method="post">
							<!-- 제목검색? -->
							<input type="text" name="searchTitle">
							<button type="submit">검색</button> 
						</form>
					</div>
					
					
					<br><br>
					<!-- 여기에 listArea페이징이랑, 조회한거랑 디테일뷰 스크립트가 들어옴 -->
					<div class="listArea"></div>
					

					
				</div>
				<br>
			</div>
		</div>
	</div>
</body>
</html>