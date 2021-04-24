<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.admin.user.model.vo.AdUser"%>
<%
	AdUser loginUser = (AdUser)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지- 좌측 메뉴바</title>
    <!-- jQuery library-->
    <script src="https://ajax.googleeapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

        #content a:hover{color:white;}

        #content_2_1{
            color:white;
            font-size:10px;
            padding:10px;
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
                <div id="userInfo">
	                <i class="fas fa-user-circle"></i>
                    <br><br>
	                <!-- 로그인 && 로그인한 아이디가 관리자 (admin01/ admincheck y) -->
                    <!-- <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")){ %> -->
	                <!-- <% if(loginUser != null && loginUser.getUserId().equals("admin01")){ %> -->
                    <% if(loginUser != null){ %>
	                   <a id="welcome" href="<%=contextPath%>/loginForm.aus">Welcome님</a>
                </div>
	            
	            	<%} else {%>
		            	<div>
		              
		               <!-- <a id="userWel" href="<%=contextPath%>/loginForm.aus"></a> -->
		               <b><%=loginUser.getUserName() %>님</b> DR에 오신 것을 환영합니다. 
		                   
		                   <!-- <i class="fas fa-bars"></i> -->
		                  
		                   </div>
		               <% } %>
	               
	               	   <a href="<%=contextPath%>/"><i class="fas fa-home"></i></a>
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1">전체 회원 조회 </a></div>
                    <div><a href="<%=contextPath%>/deleteForm.aus">회원 탈퇴처리</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/htList.aht?currentPage=1">HomeTraining</a></div> 
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
                <div id="content_2_1">
                    <h2>회원관리 > 전체 회원 조회</h2>
                </div>

                <hr style="border:1px solid gray">
                




</body>
</html>