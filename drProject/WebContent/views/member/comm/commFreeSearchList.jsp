<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm, com.dr.common.model.vo.PageInfo" %>
<%

	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Comm> list = (ArrayList<Comm>)request.getAttribute("list"); 
	
	String searchFreeText = (String)request.getAttribute("searchFreeText");
	String searchFreeCtg = (String)request.getAttribute("searchFreeCtg");
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
	div{
        box-sizing:border-box;
    }
    .wrap{
        width:1000px;
        height:800px;
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
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:15%;}
    #content_2_2{height:80%; margin-left:48px;}

    .listArea{
        border:1px solid gray;
        text-align:center;
        margin-left:50px;
    }
    .listArea>tbody>tr:hover{
        background:lightgray;
        cursor:pointer;
    }
    .listArea>thead>tr{
        background:lightgray;
    }
    .listArea>tr,th,td{
        height:30px;
    }
    .searchArea>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    div>button{
        cursor:pointer;
    }
    .pagingArea, .searchArea{
        margin-left:120px;
    }
    .leftMenu>#menu2>a{
    	color:rgb(250, 214, 9);
    } 
</style>
<body>

	<%@ include file="../../common/menubar.jsp"%>
	
	
	 <div class="wrap">

        <div id="content">

            <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div id="menu2"><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>커뮤니티 > 자유게시판</h2>
                    <hr>
                    <p>Daily Routine 회원들과 자유롭게 다양한 얘기를 나눠보세요!</p>
                </div>
                <br><br><br>
                
                <!-- 게시판 목록 테이블 -->
                <div id="content2_2">
                
                	<div class="commArea">
                   	    <table align="center" class="listArea">	
                            <thead>
                                 <tr>
	                                 <th width="100">글번호</th>
	                                 <th width="600">글제목</th>
	                                 <th width="150">작성자</th>
	                                 <th width="150">작성일</th>
	                                 <th width="100">조회수</th>
                            	 </tr>
                        	</thead>
                        	<tbody>
                        		<% if(list.isEmpty()) { %> 
                                <div align="center">
                                <p style="color: crimson; font-weight: bolder; font-size:20px; ">조회된 리스트가 없습니다.</p>
                                </div>
	                        	<% } else { int count=1; %>
	                        		<% for(Comm c : list) { %>
                           		<tr>
                           			<input type="hidden" value="<%= c.getCommPostNo() %>">
				                    <td width="10%"><%= count++ %></td>
				                    <td width="55%"><%= c.getPostTitle() %></td>
				                    <td width="10%"><%= c.getUserNo() %></td>
				                    <td width="15%"><%= c.getEnrollDate() %></td>
				                    <td width="10%"><%= c.getBoardView() %></td>
			                    </tr>
	                            	<% } %>
	                            <% } %>
                       		</tbody>
                    	</table>
           			
           			 	<script>
		               		$(function() {
		                		$(".listArea>tbody>tr").click(function() {
		                			location.href= '<%=contextPath%>/freeDetail.co?cno=' + $(this).children().eq(0).val();
		                		})
		                	})
		             	</script> 
               	
              		 	<br><br>
           			
           			
           			 	<!-- 페이징 처리 -->	
                	 	<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
               		 	<div align="center" class="pagingArea">
               		 	
               		 	<%if (list.isEmpty()) { %>
						<p></p>
						<% } else { %>	
						
                   	 		<% if(currentPage != 1) { %>
		                    	<button onclick="location.href='<%=contextPath%>/searchFree.co?currentPage=<%=currentPage-1%>&searchFreeText=<%=searchFreeText%>&searchFreeCtg=<%=searchFreeCtg%>';"><</button>
		                	<% } %>
		                    
		                	<% for(int p=startPage; p<=endPage; p++) { %>
		                    	
		                    	<% if(currentPage == p) { %>
		                    		<button disabled><%= p %></button>
		                    	<% }else { %>
		                    		<button onclick="location.href='<%=contextPath%>/searchFree.co?currentPage=<%= p %>&searchFreeText=<%=searchFreeText%>&searchFreeCtg=<%=searchFreeCtg%>';"><%= p %></button>
		                   		<% } %>
		                    	
		                	<% } %>
		                    
		                	<% if(currentPage != maxPage) { %>
		                		<button onclick="location.href='<%=contextPath%>/searchFree.co?currentPage=<%=currentPage+1%>&searchFreeText=<%=searchFreeText%>&searchFreeCtg=<%=searchFreeCtg%>';">></button>
		                	<% } %>
		                <% } %> 
                	 	</div>
                	 
                     	<br><br>
            		
            		
            		 	<div align="center" class="searchArea">
		                	<form action="<%=contextPath%>/searchFree.co?currentPage=1" method="post">
			                	<select name="searchFreeCtg">
			                   		<option name="searchFreeCtg" value="제목">제목</option>
			                   		<option name="searchFreeCtg" value="내용">내용</option>
			                 	</select>
	                         	<input type="text" name="searchFreeText">
		                   	 	<button type="submit" class="fas fa-search"></button>
		                  	 	<a href="<%=contextPath%>/freeEnroll.co">글쓰기</a>
		              		</form>
		             	</div><br><br>
   
   
       		   	</div>
       		 
        </div>
    </div>	 
</div>
		
</body>
</html>