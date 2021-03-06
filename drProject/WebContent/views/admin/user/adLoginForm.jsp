<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
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
/* menubar css */
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

        #welcome{
            text-decoration: none;
            color:white;

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

        #content_1 a:hover{color:white;}

        #content_2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }



/* context_2_2 css */
        #content_2_2{
            margin-top:20px;
        }
        #login-form{
        display:flex;
        flex-direction: column;
        margin:0px 30px; /*top bottom /left right */
        }

        #login-form input {
            border:none;
            padding:15px 0px;
            font-size: 18px;
            border-bottom:1px solid rgba(0,0,0,0.2);
            margin-bottom:25px;
            background-color: rgb(33, 33, 34);
        }

        #login-form input::placeholder{
            color: gray;
            text-align: center;
        }

        #login-form input{
            border-color: gray;
            color:white;
            text-align: center;
        }

        #btn {
            cursor:pointer;
        }
        .loginNavi *, #nav *{
            color:white;
            text-decoration: none;
        }
     @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    .f{
        font-family: 'Do Hyeon', sans-serif;
    }
    </style>
</head>
<body>
<div class="f">

<!--menubar  -->
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left"><a href="<%=contextPath%>/mainPage.ad">Admin Center</a></span>

             <span class="loginNavi">
                <!-- 로그인 전 -->
                   
                    
                   <!-- 로그인  후 -->
                    <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")){ %>
                        <b><%=loginUser.getUserName() %>님</b> 환영합니다. 
                       <small><a href="<%=contextPath%>/adLogout.aus">로그아웃</a></small>
                       <a href="<%=contextPath%>"><i class="fas fa-home"></i></a>  <!--사용자 메인페이지-->
               
                  <%} else {%>
                    <div>
                    <!-- 로그인 전 -->
                        <a id="welcome" >Welcome</a>
                        <small><a href="<%=contextPath%>/loginForm.aus">로그인</a></small>
                        <a href="<%=contextPath%>"><i class="fas fa-home"></i></a>  <!--사용자 메인페이지-->                    </div>
                  <% } %>

                   <!-- 사용자 메인페이지로 돌아감 -->
                    
            </span>
        </div>



        <div id="content">

             <!--왼쪽 공통메뉴-->
            <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1">전체 회원 조회 </a></div>
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
                    <div><a href="<%=request.getContextPath()%>/userManage.aus">공지사항</a></div> 
                    <div><a href="<%=request.getContextPath()%>/userManage.aus">FAQ</a></div> 
                    <div><a href="<%=request.getContextPath()%>/userManage.aus">1:1문의</a></div> 
                    <br>
                </div>

            </div>

            <div id="line"></div>



            <!-- content -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>DailyRoutine</h2>
                </div>

                <hr style="border:1px solid gray">

            
                <div id="content_2_2">
                    <!-- 관리자 로그인 페이지 -->
                    <form id="login-form" action="<%= request.getContextPath()%>/login.aus" method="post">
                        <input name="userId" type="text" maxlength="20" minlength="5" placeholder="관리자 아이디를 입력하세요">
                        <input name="userPwd" type="password" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요">
                        <input id="btn" type="submit" value="로그인">
                    </form>
                </div>


        


</div>
</body>
</html>