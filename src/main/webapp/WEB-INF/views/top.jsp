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
	<title>Seoul For You</title>
</head>

<body>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
<!-- SeoulForYou 배너 -->  
	<a href="index.do" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none"><img src="resources/img/seoulforyou.png"  style="width:50%"></a>
<!-- 메뉴 -->
    <ul class="nav justify-content-center" >
	    <li class="fw-bold"><a href="index.do" class="nav-link px-2 link-secondary">Home</a></li>
	    <li class="fw-bold"><a href="tourList.do" class="nav-link px-2 link-dark">여행지</a></li>
	    <li class="fw-bold"><a href="routeList.do" class="nav-link px-2 link-dark">여행루트</a></li>
	    <li class="fw-bold"><a href="myRoute.do" class="nav-link px-2 link-dark" onclick="make()">나의여행 만들기</a></li>
    </ul>
      
<!-- 쪽지버튼은 로그인해야 나타남 -->
      <div class="col-md-3 text-end">
      	<c:if test="${not empty mdto and empty adto}">
      	<!--채팅버튼-->
		<img src="resources/icon/chat-quote.svg" style="width:16%" onclick="javascript:chat()" class="btn btn-outline-white">
		<!--마이페이지 버튼-->
        <img src="resources/icon/person-circle.svg" style="width:16%" onclick="javascript:mypage()" class="btn btn-outline-white">
        <button type="button" class="btn btn-secondary" onclick="javascript:logout()">로그아웃</button>
       	</c:if>
        
<!-- 관리자 로그인이 되면 header부분이 바뀌도록 한다 -->    
        <c:if test="${not empty adto and empty mdto}">
		<a href="admin.do" style="text-decoration-line:none"><img src="resources/icon/adminSite.svg" onclick="javascript:adminSite()" width="40" height="40"></a>
			<button type="button" class="btn btn-secondary" onclick="javascript:adminLogout()">로그아웃</button>
		</c:if>
        
		<c:if test="${empty mdto and empty adto}">
      	<button type="button" class="btn btn-success " data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
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
          <img src="resources/img/seoulforyou.png"  style="width:50%; margin-left:-10px" >
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        
		<div class="modal-body" align="center">
			<h2 class="h3 mb-3 font-weight-normal">관리자 로그인</h2>
			<div class="mb-3">		  
				<c:if test="${empty cookie.saveAid.value}"> 
					<input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="아이디" style="height:49px">
				</c:if>
				
				<c:if test="${not empty cookie.saveAid.value}">
					<input type="text" name="admin_id" id="admin_id" class="form-control" value="${cookie.saveAid.value}" style="height:49px">
				</c:if>
			</div>
			<div class="mb-3"> 
				<input type="password" name="admin_passwd" id="admin_passwd" class="form-control" placeholder="비밀번호" style="height:49px">
				<div class="checkbox mb-3 p-2">
		  			<label><input type="checkbox" name="saveAid"> 아이디 기억하기</label>
		    	</div>
			</div>
	        <button id="admin-login-btn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button" onclick="javascript:admin_login_ok()" style="height:49px">로그인</button>
		</div>
       	<div class="modal-footer">
   			<p class="mx-auto text-muted">© 2022 EzDev</p>
       	</div>
      </div>
    </div>
  </div>
</form>


  <!-- 로그인 모달-->
<form name="f" action="login_ok.do" method="post" >
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true" >
    <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content">
      
        <div class="modal-header">
          <img src="resources/img/seoulforyou.png"  style="width:50%; margin-left:-10px" >
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        
		<div class="modal-body" align="center">
			<h2 class="h3 mb-3 font-weight-normal" >로그인</h2>
			<div class="mb-3">
				<c:if test="${empty cookie.saveId.value}"> 
					<input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" style="height:49px">					
				</c:if>
				<c:if test="${not empty cookie.saveId.value}">
					<input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" style="height:49px">
				</c:if>
			</div>
			
			<div class="mb-3">
				<input type="password" name="member_passwd" id="member_passwd" class="form-control" placeholder="비밀번호" style="height:49px">
				<div class="checkbox mb-3 p-2">
		  				<label>
		       			<input type="checkbox" value="remember-me" > 아이디 기억하기
		  				</label>
		    	</div>
			</div>
				<button id="login-btn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button" onclick="javascript:login_ok()">로그인</button>
		        <c:if test="${userId eq null}">
			      	<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=4433f36e8b4d7a77d2fdd1a85312d7fe&redirect_uri=http://localhost:8081/sfy/kakaoLogin.do&response_type=code">
			 		<img src="resources/img/kakao3.png" style="width:317px;height:49px;margin-left:-8px"/>
					</a>
				</c:if>
				<c:if test="${userId ne null}">
		       		<button type="button" class="btn btn-warning" onclick="location.href='kakaoLogout.do'">카카오 로그아웃</button>
		       		<br>
		       		<small class="text-muted">*카카오로그인은 로그아웃 후 이용해주세요</small>
		   		</c:if>
		</div>
        <div class="modal-footer">
        <button id="join-btn" class="btn btn-outline-primary btn-sm btn-block" type="button" onclick="javascript:join()">회원가입</button>
        </div>
      </div> 
    </div>
  </div>
</form>

<!-- 스크립트 모음 -->
<script>
	function adminLogout() {location.href="adminLogout.do";}
	function admin() {location.href="admin.do";}
	function login(){location.href="login.do";}
	function join() {location.href="join.do";}
	function chat() {location.href="chat.do";}
	function qnaWrite() {location.href="qnaWrite.do";}
	function logout() {location.href="logout.do";}
	function mypage() {location.href="mypage.do";}
	function myQna() {location.href="mypage_qna.do";}
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

<!-- 스타일 -->
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
	/*로그인*/
	.btn-success{
		background-color: #A0C8C8;
		border-color:#A0C8C8;
		font-weight: 600;
		border-radius: 1rem;
	}
	/*로그아웃*/
	.btn-secondary {
		background-color: #A0C8C8;
		border-color:#A0C8C8;
		font-weight: 600;
		border-radius: 1rem;
		}
	/*채팅, 마이페이지 버튼*/	
	.btn-outline-white{
		margin-left : -10px;
	
	}
	/*메뉴 간격*/
	ul li {margin-left:20px;}
	
	.modal-dialog{
	width:350px;
	}
	
</style>
</html>