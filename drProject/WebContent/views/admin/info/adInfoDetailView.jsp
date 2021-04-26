<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page  import="com.dr.member.user.model.vo.User, com.dr.admin.info.model.vo.adInfo, com.dr.admin.info.model.vo.adInfoFile" %>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
	
	adInfo i = (adInfo)request.getAttribute("i");
	
	adInfoFile fi = (adInfoFile)request.getAttribute("fi");
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    <h2>게시물관리 > info&tip 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">
                
             <!-- 알러트 전달했을때 뜨게하기/ 메뉴바에 포함되어있으면 지워버리기! -->
			<script>
			
			var msg = "<%=session.getAttribute("alertMsg")%>";

		    if(msg != "null"){
		        alert(msg);
		        <% session.removeAttribute("alertMsg"); %>
		    }
			
			
			</script>        
                





            <!--info-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 1000;">info&tip 관리 > 글 상세보기</p>
            </div>


            <!--info 디테일뷰-->
            <div id="content_2_4" style="background: white; width: 800px; height: 600px;">
                <br>
                <div id="infoDetail">
                    <form action="">
                        <table border="1" align="center">
                            <tbody>
                                <tr>
                                    <th>아이디</th>
                                    <td colspan="3"><%= i.getUserId() %></td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td colspan="3"><%= i.getPostTitle() %></td>
                                </tr>
                                <tr>
                                    <th>등록일</th>
                                    <td style="width: 150px"><%= i.getEnrollDate() %></td>
                                    <th>마지막수정일</th>
                                    <% if(i.getUpdateDate()==null) { %>
                                    	<td style="width: 150px"></td>
                                    <% } else { %>
                                    	<td style="width: 150px"><%=i.getUpdateDate() %></td>
                                    <% } %>
                                    
                                    
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td colspan="3">
	                                    <div style="width: 300px; height: 300px;"><%= i.getPostContent() %></div>
                                    </td>

                                </tr>
                               
                                
                                <tr>
                                    <th>썸네일</th>
                                    <%if (fi !=null)   { %>
                                    <td colspan="3" align="center">
                                    	<img src="<%=contextPath %><%= fi.getFilePath() + fi.getFileUpdate() %>" width="500" height="300">
                                    	
                                    </td>
                                    <% } else { %>
                                    <td colspan="3" align="center">
                                    	썸네일이 없습니다
                                    </td>
                                    
                                    <% } %>
                                </tr>

                            
                            	<tr>
                            		<th>카테고리</th>
                            		<td colspan="3">
                            			<input type="radio" id="workout" name="category" value="1" checked><label for="workout">운동정보</label>
                                        <input type="radio" id="meal" name="category" value="2"><label for="meal">식단정보</label>
                            		
                            		</td>
                            
                            	</tr>
                                <tr>
                                    <th>게시여부</th>
                                    <td colspan="3">
                                        <input type="radio" id="statusY" name="status" value="Y" checked><label for="statusY" >게시</label>
                                        <input type="radio" id="statusN" name="status" value="N"><label for="statusN">보류</label>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                               <tr>
                                   <td colspan="4">
                                    <label style="float: right;">
                                            <button><a href="<%= contextPath%>/infoUpadteForm.ad?ino=<%= i.getIntPostNo() %>">수정</a></button>
                                            <button onclick ="return check();"><a href="<%= contextPath%>/infoDelete.ad?ino=<%= i.getIntPostNo() %>">삭제</a></button>
                                            <button><a href="<%= contextPath %>/info.ad?currentPage=1">목록으로</a></button>
                                        </label>
                                    </td>
                                </tr>
                                
                            </tfoot>
                            
                        </table>
       	</div>
       	
       	 				<script>
							$(function(){
								var status = "<%= i.getStatus()%>";
								
								
								// 체크박스인 input요소들에 순차적으로 접근하면서
								// 해당 그 input요소의 value값이 포함되어있을 경우 => 해당 input요소에 checked속성 부여
								$("input[type=radio]").each(function(){
									if(status.search($(this).val()) != -1){
										$(this).attr("checked", true);
									} 
								})
								
								
							})
							
							$(function(){
								var category = "<%= i.getCategoryName() %>";
								
								$("input[type=radio]").each(function(){
									if(category.search($(this).val()) != -1){
										$(this).attr("checked", true);
									} 
								})
								
								
							})
							
							
							
							
							function check(){
								
								var result = confirm("이 글을 완전히 삭제 하시겠습니까?");
                            	if(result){
                            		
                            		
                            	} else {
                            		alert("삭제가 취소되었습니다");
                            		return false;
                            	}
							}
						</script>







</body>
</html>