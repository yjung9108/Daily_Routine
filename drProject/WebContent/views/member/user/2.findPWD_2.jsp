<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>02. 본인확인</title>
    <style>
        .outer{
            width:800px;
            height:auto;
            margin:auto;
            margin-top:30px;
        }
        .wrap{border:1px solid gray;}

        .menuWrap{
            background:lightgray;
            color:#F5DA01;
            width:1200px;
            height:50px;

            display:flex;
            justify-content:center;
            }

        .menu a{
            text-decoration:none;
            color:white;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            display:block;
            width:100%;
            height:100%;
            margin:0px 50px;
        }
        .menu a:hover{color:#F5DA01;}

        .wrap>table{
            margin:auto; 
            margin-top:50px;
            margin-bottom:50px;
        }
            
    </style>
</head>
<body>
    
    <!-- <%@ include file="../common/menubar.jsp" %> -->
    
    <div class="menuWrap" align="center">
        <div class="menu"><a href=""> 아이디 찾기</a> </div>
        <div class="menu"><a href="">비밀번호 찾기</a></div>
    </div>
    
    <div class="outer">


        <div id="title">
            <h3>비밀번호 찾기</h3>
            <hr>
            <p>비밀번호 찾는 방법을 선택해주세요.</p>
        </div>
        
        <br>

        <!-- radio 하나만 설정가능하게 -->
        <!-- 1 휴대전화로 인증/ 2. 이메일로 인증
             1 선택시 1보이고 2는 hidden -->
        
        <form action="" id="findID"></form>
        <div class="wrap" >
            <table id="findID">
                <td colspan="3"><input type="radio">회원정보에 등록한 휴대전화로 인증 <br>
                    <small>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                <!-- <tr>
                    <td colspan="2"><input type="radio">회원정보에 등록한 휴대전화로 인증 <br>
                    <small>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                </tr> -->

                <tr>
                    <th align="left">이름</th>
                    <td colspan="2"><input type="text" placeholder="이름을 입력하세요"></td>
                    
                </tr>

                <tr></tr>
                <tr>
                    <th align="left">휴대전화</th>
                    <td><input type="text" placeholder="휴대전화번호"></td>
                    <td><input type="button" value="인증번호 받기"></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="3"><input type="text" placeholder="인증번호 6자리 숫자 입력"></td>
                </tr>

                <!-- 테이블 내에 (중간에) 선 넣기  -->
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>

                <tr rowspan="2" colspan="3">
                    <td colspan="2"><input type="radio">본인확인 이메일로 인증<br>
                    <small>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                </tr>

                <tr>
                    <th align="left">이름</th>
                    <td colspan="2"><input type="text" placeholder="이름을 입력하세요"></td>
                    
                </tr>

                <tr>
                    <th align="left">이메일</th>
                    <td><input type="text" placeholder="이메일주소를 입력하세요"></td>
                    <td><input type="button" value="인증번호 받기"></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="2"><input type="text" placeholder="인증번호 6자리 숫자 입력"></td>
                </tr>


            </table>
        </div>
        <br>
        <div align="center">
            <button type="submit">다음</button>
        </div>
        
    </div>


</body>
</html>
