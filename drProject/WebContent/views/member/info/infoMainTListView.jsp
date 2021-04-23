<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.info.model.vo.Info, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Info> list = (ArrayList<Info>)request.getAttribute("list"); 
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage(); 
	int endPage = pi.getEndPage(); 
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     div{
        box-sizing:border-box;
    }
    .wrap{
        width:1000px;
        height:8000px;
        margin:auto;
        margin-top:15px;
    }
    .wrap>div{
        width:100%;
    }

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a:hover{color:rgb(250, 214, 9);}

    #content{height:100%; width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_2{width:100%;}

    .listArea{
        width:700px;
        margin:auto;
    }

    .tipcategory{
        width:200px;
        height:1px;
    }
    .thumbnail{
        border:1px solid black;
        width:200px;
        display:inline-block;
        margin:10px;
    }
    .searchArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    .searchArea{
        float: right;
        margin-right: 95px;
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 250px;
    }
    .btn{
        width: 100px;
        text-align: right;
        float: right;
        margin-right:100px;
    }
    div>button{
        cursor:pointer;
    }
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }
</style>
</head>
<body>
    
    <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <h1>Info & Tip</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/infoMain.in?currentPage=1">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/workout.in?currentPage=1">운동 정보</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/menu.in?currentPage=1">식단 정보</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Info & Tip > 전체 </h2>
                    <hr>
                    <p>Daily Routine에서 제공하는 다양한 Info & Tip을 소개합니다.</p>
                </div><br>
				
                <!-- 게시글 목록 -->
                <div id="content_2_3">
                    <div class="listArea">
                    
                        <div class="subTitle">
                            <p style= "font-weight:bolder; font-size:20px;">
                                오늘의 운동
                            </p>
                        </div>
                        
                        <% for(Info	i : list) { %>
                        <div class="thumbnail" align="center">	
                        
                        	<input type="hidden" value="<%= i.getIntPostNo() %>">
                        	
                            <img src="<%=contextPath%>/<%=i.getTitleImg()%>" width="200" height="150">
                            <p>
                                <%= i.getPostTitle() %> <br>
                                조회수 : <%= i.getBoardView() %> 좋아요 : <%= i.getLikeCount() %> <br>
                                <%= i.getEnrollDate() %>
                            </p>
                        </div>
                        <% } %>         
                        
                        <div class="subTitle">
                            <p style= "font-weight:bolder; font-size:20px;">
                                오늘의 식단
                            </p>
                        </div>
                        
                        <% for(Info i : list) { %>
                        <div class="thumbnail" align="center">	
                        
                        	<input type="hidden" value="<%= i.getIntPostNo() %>">
                        	
                            <img src="<%=contextPath%>" width="200" height="150">
                            <p>
                                <%= i.getPostTitle() %> <br>
                                조회수 : <%= i.getBoardView() %> 좋아요 : <%= i.getLikeCount() %> <br>
                                <%= i.getEnrollDate() %>
                            </p>
                        </div>
                        <% } %>
                        
                        <script>
	                        $(function() {
	                			$(".thumbnail").click(function() {
	                    			location.href= '<%=contextPath%>/mainDetail.in?ino=' + $(this).children().eq(0).val();
	                   		 	})
	                		})
		        		</script>
		        		
                    </div><br>
                </div>


			
                <br><br>


                <!-- 페이징 처리 -->
		        <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
		        <div align="center" class="pagingArea">
		                	
		        	<% if(currentPage != 1) { %>
		            	<button onclick="location.href='<%=contextPath%>/infoMain.in?currentPage=<%=currentPage-1%>';"><</button>
		            <% } %>
		        	
		            <% for(int p=startPage; p<=endPage; p++) { %>
		                    	
		            	<% if(currentPage == p) { %>
		                    <button disabled><%= p %></button>
		                <% }else { %>
		                    <button onclick="location.href='<%=contextPath%>/infoMain.in?currentPage=<%= p %>';"><%= p %></button>
		                <% } %>
		                    	
		            <% } %>
		                    
		            <% if(currentPage != maxPage) { %>
		                <button onclick="location.href='<%=contextPath%>/infoMain.in?currentPage=<%=currentPage+1%>';">></button>
		            <% } %>
		                        
		         </div>
		                
		         <br><br>	 
               

            </div>    
            
            
        </div>      
    </div>
</body>
</html>