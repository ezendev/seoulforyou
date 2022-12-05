<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Bootstrap -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/jquery-3.6.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- from my_route -->
	<link rel="stylesheet" href="resources/css/bootstrap-datepicker3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- from review_page -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>

	
	<script>
		function admin(){
			location.href="admin.do";
		}
		function login(){
			location.href="login.do";
		}
		function join(){
			location.href="join.do";
		}
		function chat(){
			location.href="chat.do";
		}
		function qnaWrite(){
			location.href="qnaWrite.do";
		}
	</script>
	
	<title>Seoul For You</title>
  
</head>
<body>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      
      <!-- 임시 매핑:: 관리자페이지 -->
      <a href="admin.do" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-map-fill" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"></path>
        </svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="index.do" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="tourList.do" class="nav-link px-2 link-dark">여행지</a></li>
        <li><a href="routeList.do" class="nav-link px-2 link-dark">여행루트</a></li>
        <li><a href="myRoute.do" class="nav-link px-2 link-dark">나의여행 만들기</a></li>
      </ul>

      <div class="col-md-3 text-end">

        <button type="button" class="btn btn-outline-primary me-2" onclick="javascript:chat()">쪽지</button>
        	      	
<!--         <button type="button" class="btn btn-outline-primary me-2" data-bs-toggle="modal"
        	data-bs-target="#chatModal">쪽지</button> -->

      	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
        	data-bs-target="#loginModal">로그인</button>
      </div>
    </header>
  </div>



  <!-- 로그인 모달-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalTitle">Seoul For You</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
		   <form class="form-signin" align="center">
		    <h1 class="h3 mb-3 font-weight-normal">로그인</h1>

		    <input type="email" id="id" class="form-control" placeholder="아이디" required="" autofocus="">
		    <input type="password" id="passwd" class="form-control" placeholder="비밀번호" required="">
		    <div class="checkbox mb-3 p-2">
		      <label>
		        <input type="checkbox" value="remember-me"> 아이디 기억하기
		      </label>
			    </div>
    	   	 </form>
	        </div>
	        <div class="d-grid gap-2 d-md-block mx-auto pb-2">
	         <button id="login-btn" class="btn btn-primary btn-block" type="button" onclick="javascript:login()">로그인</button>
    	     <button id="join-btn" class="btn btn-primary btn-block" type="button" onclick="javascript:join()">회원가입</button>
	        </div>
        <div class="modal-footer">
    	<p class="mx-auto text-muted">© 2022 EzDev</p>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 쪽지 모달-->
	<div class="modal fade" id="chatModal" tabindex="-1" role="dialog" aria-labelledby="chatModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalTitle">쪽지함</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        	<div class="row row-cols-2">
        		<!-- 친구목록 -->
	       		<div class="inbox_friend col-4" style="background:lightgray">
     				<table class="table table-hover">
						<tr>
							<td>무지</td>
						</tr>
						<tr>
							<td>라이언</td>
						</tr>	
						<tr>
							<td>어피치</td>
						</tr>			
					</table>
				</div>
				
				<!-- 메세지 목록 -->
    			<div class="chats col-8">
    				<!-- 메시지 내용목록 -->
    				<div class="chat_history" name="chatList">
    					<!-- txt -->
    				</div>
    			</div>
    			<div class="send_mchat">
    			</div>
    			<!-- 메시지 입력란이 올 자리 -->
       		</div>
	    </div>
        <div class="modal-footer">
    		<p class="mx-auto text-muted">© 2022 EzDev</p>
        </div>
      </div>
    </div>
  </div>
  
  
  <script>
  //메세지 전송 함수
  const SendChat = function(room, other_nick){
	  
	  
  }
  </script>