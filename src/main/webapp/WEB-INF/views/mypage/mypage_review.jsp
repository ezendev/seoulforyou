<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- mypage_review.jsp -->
<%@ include file="../top.jsp"%>

<html>

<head>
<title>나의 리뷰</title>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
</head>
<body>
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
          내정보
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_route.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 여행 루트
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="#mypage_review">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 리뷰
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_favorite.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 즐겨찾기
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_friend.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          친구 목록
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_qna.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          문의 내역
        </a>
      </li>
      <li>
        <a class="nav-link link-dark" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          회원 탈퇴
        </a>
      </li>
      <li>
        <a class="nav-link active" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          로그아웃
        </a>
      </li>
    </ul>
    <hr>
  </aside>
 <div class="wrapper col-md-9">   
            <h3 id="mypage_review">
                나의 리뷰
            </h3>
        <!-- Main content -->
                        <table class="table table-sm table-hover">
                            <thead>
                            <tr>
                                <th width="5%">#</th>
                                <th width="10%">평점</th>
                                <th width="20%">제목</th>
                                <th width="15%">작성시간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty listReview}">
                            <tr>
                            <td colspan="3">등록된 리뷰가 없습니다.</td>
                            </tr>
                            </c:if>
                            <c:forEach var="redto" items="${listReview}" varStatus="status">
                            <tr>
                                <td>${redto.review_no}</td>
                                <td>${redto.review_star}</td>
                                <td title="${redto.review_content}">
                                <c:choose>
                                <c:when test="${fn:length(redto.review_content)>10}">
                                </span>
                                <c:out value="${fn:substring(redto.review_content,0,9)}"/>....
                                </c:when>
                                <c:otherwise>
                                <c:out value="${redto.review_content}"/>
                                </c:otherwise>
                                </c:choose> 
                                </td>
                                <td>${redto.review_regdate}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
               <form align="center">     
            <c:if test="${not empty listReview}">
                <c:if test="${startPage > pageBlock}">
			[<a href="mypage_review.do?pageNum=${startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="mypage_review.do?pageNum=${i}">${i}</a>]
		</c:forEach>	
		<c:if test="${pageCount > endPage}">
			[<a href="mypage_review.do?pageNum=${endPage+1}">다음</a>]
		</c:if>
	    </c:if>
        </form>  
             </div>
             </div>
            </div>
        <!-- /.content -->
  <script src="resources/js/jquery-3.6.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.js"></script>
   <script src="js/star-rating.js" type="text/javascript"></script>
  </body>
  </html>
  <%@ include file="../bottom.jsp"%>