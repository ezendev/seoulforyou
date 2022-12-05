<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>

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
	<table class="table table-hover">
	  <thead align="center">
	    <tr>
	      <th scope="col">No.</th>
	      <th scope="col" width="60%">제  목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>

	    </tr> 
	  </thead>
	  <tbody align="center">

	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="4">등록된 게시글이 없습니다.</td>
		</tr>
	</c:if>	
	
	<c:set var="qna_no" value="${requestScope.qna_no}"/>
	<c:forEach var="dto" items="${listBoard}">
		<tr data-bs-toggle="modal" href="#write" >    
			<td>
				<c:out value="${qna_no}"/>
				<c:set var="qna_no" value="${qna_no-1}"/>
			</td>
			<td><a >${dto.qna_subject}</a></td>
			<td>${dto.qna_writer}</td>
			<td>${dto.qna_regdate}</td>
		</tr>
	</c:forEach>
<!-- 페이징 처리 -->
	<c:if test="${not empty listBoard}">	</c:if>
		</tbody>
	</table>

		<nav aria-label="Page navigation example" >
			<ul class="pagination justify-content-center">
				<c:if test="${startPage > pageBlock}">
					<li class="page-item"><a class="page-link"
						href="qnalist.do?pageNum=${startPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item"><a class="page-link"
						href="qnalist.do?pageNum=${i}">${i}</a>
					</li>
				</c:forEach>

				<c:if test="${pageCount > endPage}">
					<li class="page-item">
					<a class="page-link"
						href="qnalist.do?pageNum=${endPage+1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</c:if>

			</ul>
		</nav>


	<button type="button" onclick="javascript:qnaWrite()" class="btn btn-outline-success btn px-4 me-md-3" style="float:right" >글쓰기</button>
	</div>
</body>
<br>	
<%@ include file="../bottom.jsp"%>
<!-- 질문내용 보는 모달창 : 추후 qna_no에 맞게 가져오는 것 구현할 예정-->

	<c:set var="num" value="${requestScope.num}"/>
	<c:forEach var="dto" items="${listBoard}">
<input type=hidden name='test1' value='ttt'>

<div class="modal" tabindex="-1" id="write">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <p>${dto.qna_content}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</c:forEach>



