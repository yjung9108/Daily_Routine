<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩 확인용 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>03. 비밀번호 재설정</title>
    <style>
        .menuWrap{
    background: lightgrey;
    /* color:rgb(100, 77, 1);; */
    width:100%;
    /* height:50px; */

    display:flex;
    justify-content:center;
    }

.menuWrap>.menu1{
    text-decoration:none;
    color:white;
    font-size:15px;
    line-height:50px;
    font-weight:bold;

    /* display:block; */
    width:15%;
    height:100%;
    margin:0px 50px;
}

.menuWrap>.menu2{
    text-decoration:none;
    color:gray;
    font-size:15px;
    line-height:50px;
    font-weight:bold;

    /* display:block; */
    width:15%;
    height:100%;
    margin:0px 50px;
}


.outer{
    width:800px;
    height:auto;
    margin:auto;
    margin-top:30px;
}


        .wrap>table{
            margin:auto; 
            margin-top:50px;
            margin-bottom:50px;
        }
            
    </style>
</head>
<body>
    
    <%@ include file="../../common/menubar.jsp" %>    
   
    <div class="menuWrap" align="center">
        <div class="menu1"> 아이디 찾기</a> </div>
        <div class="menu2">비밀번호 찾기</a></div>
    </div>
    
    <div class="outer">


        <div id="title">
            <h3>비밀번호 재설정</h3>
            <hr>
            <p>비밀번호 변경해 주세요.</p>
        </div>
        
        <br>

        <!-- radio 하나만 설정가능하게 -->
        <!-- 1 휴대전화로 인증/ 2. 이메일로 인증
             1 선택시 1보이고 2는 hidden -->
        
        <form action="" id="findPWD"></form>
        <div class="wrap" >
            <div style="margin-top:20px; margin-left:20px;">
                <p><small>
                   -영문, 숫자, 특수문자를 함께 사용하면 (8자 이상 16자 이하)보다 안전합니다. <br>
                   -다른 사이트와 다른 DR만의 비밀번호를 만들어 주세요.
                </small>
                </p>
                <hr>
            </div>
            <table>
                <tr>
                    <th colspan="2" align="left">DR아이디 : xxx</th>
                </tr>
                <tr>
                    <th align="left">이름</th>
                    <td><input type="text" placeholder="이름을 입력하세요"></td>
                </tr>
                <tr>
                    <th align="left">아이디</th>
                    <td><input type="text" placeholder="아이디를 입력하세요"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><button type="submit" onclick="findPwd3()">다음</button></td>
                </tr>
                
            </table>
        </div>
        <script>
            function findPwd3(){
                location.href="<%=request.getContextPath() %>/login.us";
            }
        </script>
        
    </div>


</body>
</html>

