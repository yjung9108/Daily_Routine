<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.Comm, com.dr.member.user.model.vo.User" %>
<%

	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
  <!-- include summernote css/js-->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
   
<title>Insert title here</title>
<style>
    div{
        box-sizing:border-box
    }
    
    .wrap{
        width:1000px;
        height:800px;
        margin:auto;       
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
    
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:15%;}
    #content_2_2{height:70%; margin-left:48px;}
    
    #enrollForm input, #enrollForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .enrollArea{
        right:500px;
    }
    .enrollButton>button{
        color:black;
        text-decoration:none;
        font-size:18px;
        font-weight:bolder;
        border:rgb(250, 214, 9);
    }
    .enrollButton>#enrollBtn:hover{
    	color:rgb(250, 214, 9);
    }
    
    div>button{
        cursor:pointer;
    }
    
    .leftMenu{text-decoration:none;}
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }  
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    
    <!-- ????????? --> 
  	.outer{
        width:1000px;
        height:170px;
        margin: auto;
    }
      
    .outerWrap>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
        padding:10px;
    }

    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;
        display:block;
        
    }
    
    .menu{
        display: table-cell;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
        width:100%;
        height:100%;
    }

    .outerWrap a:hover{
        color:darkorchid
	}

    .header{
        position:relative;
        top:-20px;
    }

    .sideLine{
        border-left:2px solid gray;
        
    }

    #dr{
        position:relative;
        top:-30px;
    }
    
    #mainLine{
        position:relative;
        top:-20px;
        border-bottom:1px solid gray;
        color:gray;
    }
    
    .navWrap{
    	margin-left:230px;
    }
    
    #topMenu2{
    	margin-right:130px;
    	margin-top:20px;
    }
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    
    <!-- ????????? --> 
    .f{
        font-family: 'Do Hyeon', sans-serif;
    }
    
    /* footer */
    .footerOuter{
        width:1300px;
        margin:auto;
        margin-left:50px;
        align-items: center;
        bottom:100;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1300px;
        
    }

    .footer1_1{
        height:30px;
        right:500px;
        width:1300px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;
    }
    .footer1_2>i{
    	left:250px;
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

   <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
  	
  	<!-- ?????? -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

	<script>
    // ???????????? ?????? ??? ?????? ????????? ?????????. ?????? ????????? ???????????? (???????????????)
    var msg = "<%=session.getAttribute("alertMsg")%>";

    if(msg != "null"){
        alert(msg);
        <% session.removeAttribute("alertMsg"); %>
    }
    </script>
  	
      <div class="outer ff">

        <div class="outerWrap">
            <p align="center">Reading is to the mind what exercise is to the body</p>
            
            <div class="header">
                <div class="loginArea">
                <!--  ????????? ?????? ???????????? ????????? ?????? -->
                
                    <% if(loginUser == null){ %>
            
                    <table id="topMenu1" align="right">
                        <tr>
                            <th><a href="<%=contextPath%>/loginForm.us">?????????</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/enrollForm1.us">????????????</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/main.ct">????????????</a></th>
                        </tr>
                        <tr>
                            <th colspan="3">Welcome DR???</th>
                            <th colspan="2"><i class="fas fa-user-circle" fa="lg"></i></th>
                        </tr>
                    </table>
                    
                    
                    <% }else { %>
                
                <!--  ????????? ??? -->
                    
                    <table id="topMenu2" align="right">
                        <tr>
                            <th><a href="<%=contextPath%>/logout.us">????????????</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/main.ct">????????????</a></th>
                        </tr>
                        <tr>
                            <th colspan="3"><b><%= loginUser.getUserName() %>???</b> ???????????????</th>
                            <th><i class="fas fa-user-circle" fa="lg"></i></th>
                        </tr>
                    </table>
                    
                    <% } %>
                    
                </div>

            <br><br>


            <span class="navWrap" align="center">
                
                <div class="menu" id="dr"><a href="<%=contextPath%>">Daily<br>Routine</a></div>
                <div class="menu"><a href="<%=contextPath%>/allList.ht">HomeTraining</a></div>
                <div class="menu"><a href="<%=contextPath%>/commMain.co?currentPage=1">Community</a></div>
                <div class="menu"><a href="<%=contextPath%>/workout.in?currentPage=1">Info&Tip</a></div>
                <div class="menu"><a href="<%=contextPath%>/myPage.md">My D.R.</a></div>
                <div class="sideLine" ></div>
                <hr id="mainLine">
            </span>
        
        </div>
    </div>

  
  
  

    <div class="wrap ff">
        
        <div id="content">

            <!--?????? ????????????-->
            <div id="content_1">
                <a href="<%=contextPath%>/commMain.co" id="leftMenu"><h1 class="ff">????????????</h1></a><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/commMain.co?currentPage=1">????????? ?????? Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">???????????????</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">???????????????</a></div>
                </div>
            </div>

            <div id="line"></div>

            
            <!-- ????????? ?????? -->
            <div id="content_2">

                <!-- ?????? ????????? -->
                <div id="content_2_1">
                    <h2>???????????? > ????????? ?????? Tip!</h2>
                    <hr>
                    <p>Daily Routine?????? ????????? ????????? ?????? tip??? ?????? ??????????????????!</p>
                </div><br>

                
                <!-- ????????? ?????? ??? -->
                <div id="content_2_2">
                    <div class="enrollArea">
                       <form action="<%=contextPath%>/tipInsert.co" id="enrollForm" method="post" enctype="multipart/form-data">
                            <table align="center">
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="100">
                                                <select name="category" id="category" required>
                                                	<option id="category" value="0">????????????</option>
                                                    <option name="category" id="category" value="????????????">[????????????]</option>
                                                    <option name="category" id="category" value="??????tip">[??????tip]</option>
                                                </select>
                                            </td>
                                            <td width="800" height="30">
                                                <input type="text" name="title" id="title" placeholder="????????? ??????????????????." required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" id="upfile" style="cursor:pointer;">
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td height="500"> 
                                                <textarea class="summernote" name="tContent" id="tContent" rows="20" style="resize:none" placeholder="????????? ??????????????????." required></textarea>    
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                                <div align="right" class="enrollButton">
                                <button type="submit" id="enrollBtn" onclick="return validate();">??????</button>
                                <button type="reset" onclick="return back();"><a href="<%=contextPath%>/commMain.co?currentPage=1">??????</a></button>
                            </div>
                            </table><br><br>
                            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
							<br><br>

                           

				
							<script>      
								$('.summernote').summernote({
									// ????????? ??????
	                                   height: 300,
	                                    // ????????? ?????? ??????
	                                    lang: "ko-KR",
	                                    // ???????????? ?????? ?????? (input?????? autofocus?????? ??????????????? ?????????.)
	                                    focus : true,
	                                    toolbar: [
	                                          // ?????? ??????
	                                          ['fontname', ['fontname']],
	                                          // ?????? ?????? ??????
	                                          ['fontsize', ['fontsize']],
	                                          // ??????, ????????????, ??????,?????? ???, ???????????????
	                                          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	                                          // ?????????
	                                          ['color', ['forecolor','color']],
	                                          // ????????????
	                                          ['table', ['table']],
	                                          // ????????? ??????, ???????????????, ????????????
	                                          ['para', ['ul', 'ol', 'paragraph']],
	                                          // ?????????
	                                          ['height', ['height']],
	                                          // ????????????, ???????????????, ???????????????
	                                          ['insert',['picture','link','video']],
	                                          // ????????????, ??????????????????, ?????????
	                                          ['view', ['codeview','fullscreen', 'help']]
	                                        ],
	                                        // ????????? ??????
	                                      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','?????? ??????','??????','?????????','??????','?????????','?????????'],
	                                       // ????????? ???????????????
	                                      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
									
								});	
                                </script>




                                <script>
                                
                                	// ????????? ?????? ?????? 
                                	function back(){
                        				var result = confirm("????????? ????????? ?????????????????????????");
                                    	if(result){
                                    		
                                    		return true;
                                    		
                                    	} else {
                                    		
                                    		return false;
                                    	}
                        			}
                                	
                                	
                                    // ????????? ?????? 
                                	function validate() {
                                		
                                		var category = $("#category").val();
                                		var title = document.getElementById("title");
                                		var tContent = document.getElementById("tContent"); 
                                		
                                		var regExp = /[\S+$]/; // ????????? ????????? ?????? ????????? 1???????????? ??????
                                		
                                		
                                		if(category=="0"){
                                			alert("??????????????? ??????????????????"); 
                                			
                                			return false;
                                			
                                		}
                                		
                                		if(!regExp.test(title.value)){
                                    		alert("????????? ??????????????????");
                                    	
                                    		title.value="";
                                    		title.focus();
                                    		
                                    		return false;
                                    	}
                                			
                                		if(!regExp.test(tContent.value)){ 
                                    		alert("????????? ??????????????????");
                                    	
                                    		tContent.value="";
                                    		tContent.focus();
                                    		
                                    		return false;
                                    	}	
                                		
                                		var result = confirm("?????? ?????????????????????????");
                                    	if(result){
                                    		
                                    		
                                    	} else {
                                    		alert("????????? ????????? ?????????????????????");
                                    		return false;
                                    	}
                                		
                                	}
                                    
                                </script>


                 		    
                        </form>  
                    </div>
                </div>
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
    
</body>
</html>