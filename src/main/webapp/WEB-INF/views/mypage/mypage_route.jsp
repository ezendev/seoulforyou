<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- mypage_route.jsp -->
<%@ include file="../top.jsp"%>
<html>
<head>
<title>나의 여행루트</title>
<script>
function getselect() {
	<%-- 검색 관련 기능 --%>
	const value = e.value;

    document.getElementById('result').innerText = value;
   
}
<%-- 모달창 끄면 내용 초기화 시켜줌 --%>
$('.modal').on('hidden.bs.modal', function (e) { 
    console.log('modal close');
  $(this).find('form')[0].reset()
});
<%-- 검색 기능 스크립트 --%>
$(function(){
	$('#searchBtn').click(function(){
		var url = document.location.href;
		url = url + "?searchType=" + $("#searchBtn").val();
		url = url + "&keyword=" + $("#keywordInput").val();
		location.href = url;
	});
});
</script>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
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
        <a class="nav-link js-scroll-trigger" href="#mypage_route">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 여행 루트
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_review.do">
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
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
            <section class="content-header">
            <h2 id="mypage_route">
                나의 여행 루트
            </h2>
            </section>
            <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                <div class="box-body">
        <!-- Main content -->
      <table class="table table-sm table-hover">
         <tbody>
            <tr>
               <th style="width: 30px">#</th>
               <th>제목</th>
               <th style="width: 150px">작성시간</th>
               </tr>
            	<c:if test="${empty listRoutetest}">
		<tr>
			<td colspan="2">등록된 여행 루트가 없습니다.</td>
		</tr>
	            </c:if>
              <c:forEach items="${listRoutetest}" var="dto">
               <tr>
                <td>${dto.routetest_no}</td>
                  <%-- 
                                    제목 누르면 루트 쪽 페이지로 넘어가게 경로 재설정 필요
                    <td><a href="${path}/article/read?articleNo=${article.articleNo}">${article.title}</a></td>       
                  --%>
                  <td>${dto.routetest_subject}
             <td>${dto.routetest_regdate}</td>
             </tr>
             </c:forEach>
             </tbody>
             </table>
             </div>
             </div>
             </div>
         
        <select name="searchType">
            <option value="fn" <c:out value="${cri.searchType == null ? 'selected' : ''}"/>>선택</option>
            <option value="all" <c:out value="${cri.searchType eq 'all' ? 'selected' : ''}"/>>전체</option>
            <option value="routetest_subject" <c:out value="${cri.searchType eq 'routetest_subject' ? 'selected' : ''}"/>>제목</option>
        </select>
       
        <input type="text" name="keyword" id="keywordInput" size="50" maxlength="20" value="${cri.keyword}"/>
        <button class="btn btn-primary btn-flat" id="searchBtn" type="button">검색</button>
      
            <div class="box-footer">
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${pagemaker.prev}">
                <li>
                <a href='<c:url value="mypage_route?page=${pagemaker.startPage - 1}"/>'>이전</a>
                </li>
            </c:if>
            <c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="pageNum"> 
                <li>
                <a href="mypage_route?page=${pageNum}">${pageNum}</a> 
                </li>
            </c:forEach>
            <c:if test="${pagemaker.next && pagemaker.endPage > 0}">
                <li><a href='<c:url value="mypage_route?page=${pagemaker.startPage + 1}"/>'>다음</a></li>
            </c:if>
        </ul>
    </div>
</div>
</section>
</div>
</div>
</div>
</div>
  <script src="resources/js/jquery-3.6.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.js"></script>
  </body>
  </html>
  <%@ include file="../bottom.jsp"%>