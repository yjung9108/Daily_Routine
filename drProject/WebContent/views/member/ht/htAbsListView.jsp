<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.ht.model.vo.Ht, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Ht> list = (ArrayList<Ht>)request.getAttribute("list");
	
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<style>
		.wrap{
		font-family: 'Do Hyeon', sans-serif;
	}
	.listArea{
		display: inline-block;
	}
	.pagingArea{
		text-align: right;
        width: 500px;
        display: inline-block;
        margin-right: 300px
    }	
    .thumbnail{
    	cursor:pointer;
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
                    <div><a href="<%=contextPath%>/allList.ht?currentPage=1" >??????</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/bodyList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
					<div><a href="<%=contextPath%>/absList.ht?currentPage=1"  style="color:rgb(250, 214, 9);">?????? ??????</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/upperList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/lowerList.ht?currentPage=1">?????? ??????</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/strechingList.ht?currentPage=1">????????????</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- ????????? ?????? -->
            <div id="content_2">

                <!-- ?????? ?????????-->
                <div id="content2_1">
                    <h2>HomeTraining > ?????? ??????</h2>
                    <hr>
                    <p>??????????????? ?????? ?????? ???????????????.</p>
                </div>
                <br><br>
				<div id="content_2_2">
					
					<div align="center" class="searchArea">
						<form action="<%= contextPath %>/searchList.ht?currentPage=1" method="post">
							<!-- ????????????? -->
							<input type="text" name="searchTitle">
							<button type="submit">??????</button> 
						</form>
					</div>
					
					<br><br>
					<!-- ????????? listArea???????????????, ??????????????? ???????????? ??????????????? ????????? -->
					<% if(list.isEmpty()){ %>
						<h1>????????? ???????????? ????????????</h1>
						<br><br><br><br><br><br><br><br><br><br><br><br>
					<% } else{ %>
						<% for(Ht h : list){ %>
							<div class="thumbnail" align="center">
								<input type="hidden" value="<%= h.getHtPostNo() %>">
								<img src="<%= h.getTitleImg() %>" width="230" height="150">
								<p>
									<%= h.getHtPostTitle() %><br>
									????????? : <%= h.getHtViewCount() %> ????????? : <%= h.getHtLikeCount() %> <br>
									<%= h.getHtUpdateDate() %>
								</p>
							</div>
						<% } %>
					<% } %>
					<!-- ????????? ??? ?????? ???????????? -->
						<script>
							$(function() {
				       	     	 $(".thumbnail").click(function() {
				                  	 location.href= '<%=contextPath%>/detail.ht?hno=' + $(this).children().eq(0).val();
				      	     	   })
				   	    	 })
						</script>
				
					<br><br>
					<!-- ??????????????? ???????????? ??????????????? ???????????? ?????? -->
					<!-- 1??? ????????? "<"??? ???????????? ????????? ??????????????? ????????? ">"??? ??????????????? ?????? ???????????? ???-->
					<div align="center" class="pagingArea">
						<% if(currentPage != 1){ %>
							<button onclick="location.href='<%= contextPath %>/absList.ht?currentPage=<%= currentPage-1 %>';"><</button>
						<% } %>
											
						<% for(int p=startPage; p<=endPage; p++){ %>
							<% if(currentPage == p) { %>
								<button disabled><%= p %></button>
							<% }else{ %>
								<button onclick="location.href='<%= contextPath %>/absList.ht?currentPage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
											
						<% if(currentPage != maxPage){ %>
							<button onclick="location.href='<%= contextPath %>/absList.ht?currentPage=<%= currentPage + 1 %>';">></button>
						<% } %>
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