<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.*" %>
<%
    Comm c = (Comm)request.getAttribute("c"); 
    // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일, 조회수

    CommFile cf = (CommFile)request.getAttribute("cf"); 
    // null 
    // 파일번호, 원본명, 수정명, 저장경로 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing:border-box
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
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:15%;}
    #content_2_2{height:60%; margin-left:48px;}
 
    #updateForm input, #updateForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .updateArea{
        right:500px;
    }
    .updateArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    div>button{
        cursor:pointer;
    }
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }
</style>

    <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>
       
            <div id="line"></div>


            <!-- 게시글 수정 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div><br>


                <!-- 게시글 수정 폼 -->
                <div id="content_2_2">
                    <div class="updateArea">
                        <form action="<%=contextPath%>/tipUpdate.co" id="updateForm" method="post" enctype="multipart/form-data">
                            <!-- <input type="hidden" name="cno" value="<%=c.getCommPostNo()%>"> -->
                            <table align="center">
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="100">
                                                <select name="category" required>
                                                    <option value="1">[식단공유]</option>
                                                    <option value="2">[운동tip]</option>
                                                </select>
                                                <script>
                                                    $(function(){
                                                        $("#updateForm option").each(function() { 
                                                            if($(this).text() == "<%=c.getCategoryName()%>") {
                                                                $(this).attr("selected", true); 
                                                            }
                                                        })
                                                    })
                                                </script>
                                            </td>
                                            <td width="800" height="30">
                                                <input type="text" name="title" value="<%=c.getPostTitle()%>" required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                    </td>
                                                    <td>
                                                        <!-- 기존의 첨부파일이 있었다면 -->
                                                        <% if(cf != null) { %>
                                                            <%=cf.getFileName() %>
                                                            <input type="hidden" name="originFileNo" value="<%=cf.getFileNo()%>">
                                                            <input type="hidden" name="originFileName" value="<%=cf.getFileUpdate()%>">
                                                        <% } %>
                                                        
                                                        <input type="file" name="reUpfile">
                                                         
                                                        <!-- 버튼 클릭 시 파일 삭제 -->
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button><br>
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button>
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <textarea name="content" rows="20" style="resize:none" required><%=c.getPostContent()%></textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table><br><br>
                        </form>
                    </div>
                </div>

                <div align="right" class="updateArea">
                    <button type="submit">수정</button>
                    <button type="submit">등록</button>
                </div>
        
            </div>


        </div>    
    </div>
</body>
</html>