<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>
<html>
<head>
</head>
<body>
<div class="container themed-container text-center">
<h1 class="display-5 fw-bold" align="center">질문하랑께</h1><br><br><br>

<!-- 버튼 생성 : 나의문의내역확인 & 검색창 -->
	<div class="position-relative">
		<div class="container-fluid">
    		<button type="button" onclick="javascript:admin()" class="btn btn-outline-success btn px-4 me-md-3" style="float:left" >나의 문의내역 확인하기</button>
    		<div class="position-absolute top-0 end-0">
				<form class="d-flex">
					<select class="form-select" style="width:40%">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="content">작성자</option>
					</select>
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:100%">
					<button type="button" class="btn btn-outline-success btn px-4" id="search_btn" style="width:40%">검색</button>
				</form>
			</div>
		</div>
    </div><br><br><br>
<!--게시판 -->
	<table class="table">
	  <thead align="center">
	    <tr>
	      <th scope="col">No.</th>
	      <th scope="col" width="60%">제  목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">조회</th>
	      <th scope="col">IP</th>
	    </tr> 
	  </thead>
	  <tbody align="center">

	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
	</c:if>	
	<c:set var="num" value="${requestScope.num}"/>
	<c:forEach var="dto" items="${listBoard}">
		<tr>
			<td>
				<c:out value="${num}"/>
				<c:set var="num" value="${num-1}"/>
			</td>
			<td>${dto.subject}</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
			<td>${dto.ip}</td>
		</tr>
	</c:forEach>
	</table>
		<c:if test="${not empty listBoard}">	
		<c:if test="${startPage > pageBlock}">
			[<a href="list_board.do?pageNum=${startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="list_board.do?pageNum=${i}">${i}</a>]
		</c:forEach>	
		<c:if test="${pageCount > endPage}">
			[<a href="list_board.do?pageNum=${endPage+1}">다음</a>]
		</c:if>
	</c:if>
	<button type="button" onclick="javascript:qnaWrite()" class="btn btn-outline-success btn px-4 me-md-3" style="float:right" >글쓰기</button>
	</div>
</body>
</html><br>	
<%@ include file="../bottom.jsp"%>



