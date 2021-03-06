<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
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

</style>
</head>
<body>
    <script>
        var msg = "null";
    
        if(msg != "null"){
            alert(msg);
            
        }
    </script>
    
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left"><a href="<%=contextPath%>/mainPage.ad" id="ac">Admin Center</a></span>

             <span class="loginNavi">
                <!-- ????????? ??? -->
                   
                    
                   <!-- ?????????  ??? -->
                    <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")){ %>
                        <b><%=loginUser.getUserName() %>???</b> ???????????????. 
                       <small><a href="<%=contextPath%>/adLogout.aus" id="log">????????????</a></small>
                       <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--????????? ???????????????-->
               
                  <%} else {%>
                    <div>
                    <!-- ????????? ??? -->
                        <a id="welcome" >Welcome</a>
                        <small><a href="<%=contextPath%>/loginForm.aus" id="log">?????????</a></small>
                        <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--????????? ???????????????--></div>
                  <% } %>

                   <!-- ????????? ?????????????????? ????????? -->
                    
            </span>
        </div>
    



        <div id="content">

             <!--?????? ????????????-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>????????????</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1">?????? ?????? ?????? </a></div>
                    <div><a href="">?????? ????????????</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>???????????????</h2>
                    <div><a href="<%=contextPath%>/htList.aht?currentPage=1">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/info.ad?currentPage=1">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>????????????</h2>
                    <div><a href="<%=contextPath%>/ctNotice.ad?currentPage=1">????????????</a></div> 
                    <div><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=top">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/ctQuery.ad?currentPage=1">1:1??????</a></div> 
                    <br>
                </div>

            </div>

            <div id="line"></div>


    
    <div class="outer">
        
        <form action="<%=request.getContextPath()%>/delete.aus" name="deleteUser">
            <div class="form">
                &nbsp<button>?????? ??????</button>
                <fieldset>
                    <p>
                        <br>
                        <h2><b>?????? ????????? ????????????</b></h2> <br>
                                ???????????? ???????????? ?????? ?????? ???????????? ??????????????????.<br>
                                <br><br><br>
                                <hr><br>
                                ?????? ????????? ????????? ?????? ????????? ???????????? ??????????????? ????????? ?????????. <br><br>
                        <hr>
                    </p>
                    <table id="passwordInput">
                        <tr>
                            <th>?????????</th>
                            <td><input type="hidden" name="userId" value="<%=userId%>"></td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                            <td><input type="password" name="userPwd" size="25" maxlength="15" placeholder="??????????????? ??????????????????" required></td>
                        </tr>
                    </table>
                    <br>
                    <hr>
                    <br>
                    <div class="buttons" align="center">
                        <button type="submit">??????</button> &nbsp;
                        <button onclick="location='<%= contextPath %>/mainPage.ad'">??????</button>
                    </div>
                    <br>
                </fieldset>
            </div>
        </form>
</div>


</body>
</html>