<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.ht.model.vo.Ht"%>
<%
	Ht h = (Ht)request.getAttribute("h");
	// boolean check = (boolean)session.getAttribute("check");
	// boolean check2 = (boolean)session.getAttribute("check2");
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<!-- <link rel="stylesheet" href="../../../resources/css/htView.css"> -->
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<style>
	.wrap{
		font-family: 'Do Hyeon', sans-serif;
	}
	.mark{
        width: 500px;
        text-align: right;
        cursor: pointer;
    }
    .detailArea{
        width:100%;
        height:100%;
    }
    #bkLk{
    	margin:auto;
    	margin-left:260px;
    	
    }
    
    .detailArea table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    }   
    
    .detailArea>table>tr,td{
        border-bottom: 1px solid black;
        border:1px solid black;
    }
    
    p{
        text-align:center;
    }
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:-60px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        font-family: 'Do Hyeon', sans-serif;
    }


    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);

    }
    .footer1_2{
    	margin-right:250px;
    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
</style>
</head>
<body>
    
    <div class="wrap">
    <%@ include file="../../common/menubar.jsp" %>
		<div id="content">
			<div id="content_1">
                <h1>Home<br>Training</h1><br>
               <div class="leftMenu">
                    <div><a class="all" href="<%=contextPath%>/allList.ht?currentPage=1"">??????</a></div>
                    <br>
                    <div><a class="body" href="<%=contextPath%>/bodyList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
					<div><a class="abs"href="<%=contextPath%>/absList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
                    <div><a class="upper" href="<%=contextPath%>/upperList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
                    <div><a class="lower" href="<%=contextPath%>/lowerList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
                    <div><a class="streching" href="<%=contextPath%>/strechingList.ht?currentPage=1">????????????</a></div>
                </div>
                <script>
                	$(function(){
        
                    	var category = "<%= h.getHtCategory() %>";
                    	
                    	switch(category){
                    	case "????????????" : $(".body").css("color", "rgb(250, 214, 9)");return;
                    	case "????????????" : $(".abs").css("color", "rgb(250, 214, 9)");return;
                    	case "????????????" : $(".upper").css("color", "rgb(250, 214, 9)");return;
                    	case "????????????" : $(".lower").css("color", "rgb(250, 214, 9)");return;
                    	case "????????????" : $(".streching").css("color", "rgb(250, 214, 9)");return;
                    	}
                	})
                	
                </script>
            </div>

            <div id="line"></div>

            <!-- ????????? ?????? -->
            <div id="content_2">

                <!-- ?????? ?????????-->
                <div id="content2_1">
                    <h2>HomeTraining > <%= h.getHtCategory() %></h2>
                    <hr>
                </div>
                <br>
				<div id="content_2_2">
					<div class="detailArea">
						<table border="0">
                            <tr style="font-size:25px;">
                                <th width="800"><%= h.getHtPostTitle() %></th>
                            </tr>
                            <tr>
                                <td height="200" style="resize:none"> 
                                    <p style="height:50px;"><%= h.getHtPostContent() %></p>
                                </td>
                            </tr>
                        </table> 
                        <br>
                        <div id="bkLk">
                        <!-- ????????? ???????????? ????????? ??????????????? ??? ??? / ?????????????????? ???????????? => 500?????? -->
						<% if(loginUser != null){ 
							boolean check = (boolean)request.getAttribute("check");
						    boolean check2 = (boolean)request.getAttribute("check2");
						%>
							<div class="mark">
								<% if(check == true){ %>
								????????? <i id="bookmark" class="fas fa-bookmark" onclick="bookmark();"></i> &nbsp;&nbsp;
								<% } else{ %>
								????????? <i id="bookmark" class="far fa-bookmark" onclick="bookmark();"></i> &nbsp;&nbsp;
								<% } %>
								<% if(check2 == true){ %>
								????????? <i id="like" class="fas fa-heart" onclick="like();"></i>
								<% }else{ %>
								????????? <i id="like" class="far fa-heart" onclick="like();"></i>
								<% } %>
							</div>
						
						
	
						<script>
							function bookmark(){
	
								$.ajax({
									type:"post",
									url: "bookmark.ht",
									data:{
										userNo:<%= loginUser.getUserNo() %>,
										postNo:<%= h.getHtPostNo() %>
									},success:function(check){
										// console.log(check); -> true, false ?????? ??????
										console.log(check);
										if(check == "true"){ // check ??????????????? ??????
											$("#bookmark").removeClass("fas");
											$("#bookmark").addClass("far"); 
											//  $("#like").attr("far fa-heart");
											 //document.getElementById('bookmark').className = 'far fa-bookmark';
											 console.log(document.getElementById('bookmark').className);
										}else{ // check ?????????????????? ??????
											$("#bookmark").removeClass("far");
											$("#bookmark").addClass("fas"); 
											 //$("#like").attr("fas fa-heart");
											 // document.getElementById('bookmark').className = 'fas fa-bookmark';
											 console.log(document.getElementById('bookmark').className);
										}
										
									},error:function(){
										console.log("??????");
									}
										
									
								})
							}
							function like(){
	
								$.ajax({
									type:"post",
									url: "like.ht",
									data:{
										userNo:<%= loginUser.getUserNo() %>, // ??????
										postNo:<%= h.getHtPostNo() %>
									},success:function(check){
										// console.log(check); -> true, false ?????? ??????
										console.log(check);
										if(check == "true"){ // check ??????????????? ??????
											$("#like").removeClass("fas fa-heart").addClass("far fa-heart"); 
											//  $("#like").attr("far fa-heart");
											// document.getElementById('like').className = 'far fa-heart';
											// console.log(document.getElementById('like').className);
										}else{ // check ?????????????????? ??????
											$("#like").removeClass("far fa-heart").addClass("fas fa-heart"); 
											 //$("#like").attr("fas fa-heart");
											 // document.getElementById('like').className = 'fas fa-heart';
											 // console.log(document.getElementById('like').className);
										}
										
									},error:function(){
										console.log("??????");
									}
										
									
								})
								
							}
							
						</script>
						<% } %>
	                        </div>
                    </div>
					<br>
					
				</div>
			</div>
		</div>
				<!-- footer -->
	    <div class="footerOuter">	
	            <div class="footer1">
	                <div class="footer1_1">
	                    <a href="">????????????</a> | 
	                    <a href="">????????????????????????</a>
	                </div>
	
	                <div class="footer1_2" align="right">
	                    <i class="fab fa-instagram-square" fa="lg" ></i>
	                    <i class="fab fa-youtube"></i>
	                    <i class="fab fa-facebook"></i> 
	                    <i class="fas fa-arrow-up" fa="lg"></i>
	                </div>
	            </div>
	          
	            
	            <div class="footer2">
	                <p>02) 0909 - 0909 (?????? 10:00 ~ 18:00) <br><br>
	                    Daily Routine : DR <br>
	                    ?????? : ????????? ????????? ????????? 31???, ?????? ???????????? 4??? <br>
	                    ???????????? ??? ???????????? : daily@routine.co.kr           
	                    <br>
	                    CopyRight 2000-2021 Daily Routine All Right Reserved
	                </p>
	            </div>
	    </div>
	</div>
</body>
</html>