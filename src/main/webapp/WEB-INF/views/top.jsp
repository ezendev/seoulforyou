<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<!-- 플로팅 버튼 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
	
	<style>
	/*플로팅 버튼 수정*/
	.floating-button {
	  display: flex;
	  position: fixed;
	  right: 10px;
	  bottom: 15px;
	  z-index: 999;
	}
	 
	/*플로팅 버튼 스타일 */
	.qnalist-btn {
		width: 100%;
		height: 100%;
		opacity: 1;
		border-radius: 50%;
		font-size: 1.15em;
		font-family: 'HYHeadLine';
		color: #FFFAFA;
		text-align: center;
	}
	 
	/*플로팅 버튼 스타일========*/
	.move-qnalist {
		float: left;
		display: flex;
		position: relative;
		width: 32px;
		height: 32px;
		border-radius: 50%;
		cursor: pointer;
		justify-content: center;
		align-items: center;
		margin-left: 5px;
		/*사용자 설정 파트*/	
		font-weight: 700;
		background-color: #5F9EA0;
		border: 2px solid #5F9EA0;
	
	}
	</style>
	<!-- 관리자 로그인 javascript  해당 함수가 최종 실행되면 a라는 이름의 form태그 전송이 실행된다-->
	<script>
	function admin_login_ok(){
		if(admin_id.value== ""){
			alert("관리자 아이디를 입력해주세요")
			admin_id.focus()
			return 
		}
		if(admin_passwd.value== ""){
			alert("관리자 비밀번호를 입력해주세요")
			admin_passwd.focus()
			return
		}
		document.a.submit()
	}
	</script>
	
	<script>
	function adminLogout(){
		location.href="adminLogout.do";
	}
	</script>

	<script>
		function admin(){
			location.href="admin.do";
		}
		function login(){
			location.href="login.do";
		}
		function login_ok(){
			if(member_id.value==""){
				alert("아이디를 입력해 주세요")
				member_id.focus()
				return
			}
			if(member_passwd.value==""){
				alert("비밀번호를 입력해 주세요")
				member_passwd.focus()
				return
			}
			document.f.submit()
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
		function logout(){
			location.href="logout.do";
		}
		
		function mypage(){
			location.href="mypage.do";
		}
	</script>

	
	<title>Seoul For You</title>
  
</head>
<body>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

      <!--  임시 매핑:: 관리자페이지
      <a href="admin.do" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-map-fill" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"></path>
        </svg>
      </a>
      -->

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="index.do" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="tourList.do" class="nav-link px-2 link-dark">여행지</a></li>
        <li><a href="routeList.do" class="nav-link px-2 link-dark">여행루트</a></li>
        <li><a href="myRoute.do" class="nav-link px-2 link-dark" onclick="make()">나의여행 만들기</a></li>
      </ul>
      
<!-- 쪽지버튼은 로그인해야 나타남 -->
      <div class="col-md-3 text-end">
      	<c:if test="${not empty mdto and empty adto}">
        <button onclick="javascript:chat()" type="button" class="btn btn-outline-primary me-2">쪽지</button>
        
        </c:if>
        
        <!-- 관리자 로그인이 되면 header부분이 바뀌도록 한다 -->    
        <c:if test="${not empty adto and empty mdto}">
		<a href="admin.do" style="text-decoration-line:none"><img src="resources/icon/adminSite.svg" onclick="javascript:adminSite()" width="40" height="40" >
		</a>
		<button type="button" class="btn btn-primary" onclick="javascript:adminLogout()">로그아웃</button>
		</c:if>
        
		<c:if test="${empty mdto and empty adto}">
      	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
        	data-bs-target="#loginModal">로그인</button>
        </c:if>
        
        <c:if test="${not empty mdto}">
              	<button type="button" class="btn btn-primary" onclick="javascript:logout()">로그아웃</button>
        </c:if>
      </div>
    
	</header>
    
<!-- 플로팅 버튼(qnalist로 이동) -->
  </div>
	<div class="floating-button">
		<span class="move-qnalist">
    		<a class="qnalist-btn" href="qnalist.do">Q</a>
		</span>
	</div>
</body>
<!-- 관리자 로그인 모달 -->
<form name="a" action="admin_login_ok.do" method="post">
  <div class="modal fade" id="AdminLoginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalTitle">Seoul For You</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
       <div class="modal-body">
		  <h1 class="h3 mb-3 font-weight-normal">관리자 로그인</h1>
		  <c:if test="${empty cookie.saveAid.value}"> 
		  	<input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="아이디">
		  </c:if>
		  
		  <c:if test="${not empty cookie.saveAid.value}">
		  	<input type="text" name="admin_id" id="admin_id" class="form-control" value="${cookie.saveAid.value}">
		  </c:if>
		  <input type="password" name="admin_passwd" id="admin_passwd" class="form-control" placeholder="비밀번호">
		  
			<div class="checkbox mb-3 p-2">
   			<label>
        	<input type="checkbox" name="saveAid"> 아이디 기억하기
   			</label>
	    	</div>
		</div>
	    	<div class="d-grid gap-2 d-md-block mx-auto pb-2">
	        <button id="admin-login-btn" class="btn btn-primary btn-block" type="button" onclick="javascript:admin_login_ok()">로그인</button>
	        </div>
        	<div class="modal-footer">
    		<p class="mx-auto text-muted">© 2022 EzDev</p>
        	</div>
      </div>
    </div>
  </div>
</form>


  <!-- 로그인 모달-->
<form name="f" action="login_ok.do" method="post">
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalTitle">Seoul For You</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
			<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
			<c:if test="${empty cookie.saveId.value}"> 
			   <input type="email" name="member_id" id="member_id" class="form-control" placeholder="아이디">
			</c:if>
			<c:if test="${not empty cookie.saveId.value}">
			 <input type="email" name="member_id" id="member_id" class="form-control" placeholder="아이디">
			 </c:if>
				<input type="password" name="member_passwd" id="member_passwd" class="form-control" placeholder="비밀번호" >
			<div class="checkbox mb-3 p-2">
   				<label>
        			<input type="checkbox" value="remember-me"> 아이디 기억하기
   				</label>
	    	</div>
		</div>
	        <div class="d-grid gap-2 d-md-block mx-auto pb-2">
	         <button id="login-btn" class="btn btn-primary btn-block" type="button" onclick="javascript:login_ok()">로그인</button>
    	     <button id="join-btn" class="btn btn-primary btn-block" type="button" onclick="javascript:join()">회원가입</button>
	        </div>
        <div class="modal-footer">
    	<p class="mx-auto text-muted">© 2022 EzDev</p>
        </div>
      </div>
    </div>
  </div>
</form>






</html>