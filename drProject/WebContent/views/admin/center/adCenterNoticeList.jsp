<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지- 좌측 메뉴바</title>

    <style>
        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1000px;
            height:800px;
            margin:auto;
            margin-top:15px;
            background-color: rgb(33, 33, 34);
        }
        .wrap>div{
            width:100%;
        }

        
        #content{height:100%; width:100%;}

        #content>div{
            height:100%;
            float:left;
        }

        #content_1{width:15%;}
        #content_2{width:80%; margin-left:30px;}
        #line{width:1%;}

        #line{
            border:1px solid gray;
            width:0.1px;
            height:150px;
        }


        #welcome{
            text-decoration: none;
            color:white;

        }
        #welcome:hover{
            color: rgb(33, 33, 34);
        }
        /* #content_2_1{height:10%;}
        #content_2_2{height:35%;}
        #content_2_3{height:35%;} */

        #nav{
            width:100%;
            height:40px;
            background-color: gray;
            padding:5px;
            
            display:flex;
            justify-content:space-between;

            color:white;
            font-weight:bold;
            font-size:20px;
        }


        #content_1 *{
            color:gray;
            margin: 10px 3px;
        }

        #content_1>div{
            font-size:13px;
            margin-top:20px;
            margin-left:10px;
        }

        #content_1 a{
            font-size:12px;
            text-decoration:none;
            font-weight:bold;
            margin-left:10px;
        }

        /* wrap a#content_1 a:hover{color:white;} */

        #content2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }

   
        #title{
            margin-left:25px;
        }
        .listArea{
            border:1px solid gray;
            text-align:center;
            width: 95%;
            margin: auto;
        }
        .listArea>tbody>tr:hover{
            background:rgb(219, 217, 217);
            cursor:pointer;
        }
        .listArea>thead>tr{
            background:rgb(247, 209, 86);
        }
        .listArea>tr,th,td{
            height:30px;
        }
        
        
        


    </style>
</head>
<body>
	
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left">Admin Center</span>

            <span>
                <!-- 로그인 전 -->
                <i class="fas fa-user-circle"></i>
                
                <a id="welcome" href="<%=contextPath%>/loginForm.us">Welcome님</a>
                
                <!-- <i class="fas fa-bars"></i> -->
                <a href="<%=contextPath%>/"><i class="fas fa-home"></i></a> <!-- 오븐에는 메뉴바로 돼있는데, 저희 왼쪽에 메뉴바가 있어서 홈으로 가는 기능으로 바꾸면 좋을 것 같아서 넣었어요!-->

                <!-- 로그인 후
                <div>admin01님</div> -->
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체 회원 조회 </a></div>
                    <div><a href="<%=contextPath%>/deleteForm.aus">회원 탈퇴처리</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>고객센터</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">공지사항</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">1:1문의</a></div> 
                    <br>
                </div>

                <div class="content_1_4">
                    <h2>신고관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체신고보기</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">블랙리스트</a></div> 
                </div>
            </div>

            <div id="line"></div>



            <!-- content -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content2_1">
                    <h2>고객센터 > 공지사항 관리(수정/삭제)</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--공지사항-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 1000;">공지사항 관리</p>
                <div class="underLine"></div>
            </div>


            <!--공지사항게시판-->
            <div id="content_2_4" style="background: white;">

                <div class="noticeArea">
                    <br><br>
                    <table align="center" class="listArea" border="1">
                         <thead>
                             <tr>
                                 <th width="30">글선택</th>
                                 <th width="40" style="color:black">글번호</th>
                                 <th width="200" style="color:black">제목</th>
                                 <th width="50">게시자</th>
                                 <th width="60">게시일</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<!--
                         	<tr>
            					<td colspan="4">존재하는 공지사항이 없습니다.</td>
            				</tr>
            				
                         	-->
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>제목제목</td>
                                <td>admin1</td>
                                <td>2021-04-20</td>
                            </tr>

                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>제목제목</td>
                                <td>admin1</td>
                                <td>2021-04-20</td>
                            </tr>

                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>제목제목</td>
                                <td>admin1</td>
                                <td>2021-04-20</td>
                            </tr>
                            	
                         </tbody>
                    </table>
             
             		<script>
				    	$(function(){
							$(".listArea>tbody>tr").click(function(){
								location.href = '<%=contextPath%>/noticeDetail.ct?nno=' + $(this).children().eq(0).text();			
								
							})
				    	})
				    </script>
             
                    <br><br>
                    <!-- 페이징처리 10개씩 -->
                    <!--
                    <div align="center" class="pagingArea">

						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%=currentPage-1%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%=currentPage+1%>';">다음</button>
						<% } %>
						
			        </div>
                    -->
                    <div align="center" class="pagingArea">
                        <button><</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button>></button>
                   </div>






             
                    <br><br>
                    <div align="center" class="searchArea">
                        <form action="<%= contextPath %>/searchNotice.ct?currentPage=1" method="post">
                            <select name="searchNoticeCtg">
                                <option name="searchNoticeCtg" value="제목">제목</option>
                                <option name="searchNoticeCtg" value="내용">내용</option>
                            </select>  
                            <input type="text" name="searchNoticeText">
                            <button type="submit">검색</button> 
             
                        </form>

                        <div>
                            <br>
                            <button>새 글 등록</button>
                            <button>선택 삭제</button>

                        </div>
                        
             
                 </div>
                 <br><Br>


			</div>    

            

        </div>







</body>
</html>