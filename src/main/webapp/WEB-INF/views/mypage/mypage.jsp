<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- test4.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>

<html>

<head>
<title>마이페이지</title>
<script>
<%-- 모달창 끄면 이전 입력 정보 사라짐 --%>
$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});
</script>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<script src="resources/js/jquery-3.6.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
   <div class="container">
	<div class="row">
		<aside class="bd-aside sticky-xl-top text-muted align-self-start d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
    <a href="index.do" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"></svg>
      <span class="fs-4">Seoul for you</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" aria-current="page" href="mypage.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	 내정보</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_route.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	나의 여행 루트 </a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_review.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
        	나의 리뷰</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_favorite_list.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	나의 즐겨찾기</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_friend.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	 친구 목록</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_qna.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	문의 내역</a>
      </li>
      
      <li>
        <a class="nav-link link-trigger" data-bs-toggle="modal" data-bs-target="#quitModal">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	회원 탈퇴</a>
      </li>
      
      <li>
        <a class="nav-link active" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	 로그아웃</a>
      </li>
    </ul>
    <hr>
  </aside>
  
 <!-- 회원탈퇴 체크 모달 -->
<form name="quit" action="deleteMember.do" method="post">
<div class="modal fade" id="quitModal" tabindex="-1" aria-labelledby="quitModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="checkModalLabel">탈퇴</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<input type="hidden" id="checkDel" name="checkDel" />
      	<input type="hidden" id="checkType" name="checkType" />
       	<p class="mx-auto">정말 탈퇴하시겠습니까?</p>
      </div>
      <div class="modal-footer">
	      <button type="submit" class="btn btn-primary">탈퇴</button>
      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</form>


