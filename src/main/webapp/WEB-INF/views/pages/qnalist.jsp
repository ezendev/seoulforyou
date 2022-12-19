
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>

<body>
<%String qna_writer =(String)session.getAttribute("member_id"); %>
<div class="container themed-container text-center">
<h1 class="display -5 fw-bold" align="center">질문게시판</h1><br><br><br>

<!-- 버튼 생성 : 나의문의내역확인 & 검색창 -->
	<div class="position-relative">
		<div class="container-fluid" >
    		<button type="button" onclick="javascript:admin()" class="btn btn-outline-success btn px-4 me-md-3" style="float:left" >나의 문의내역 확인하기</button>
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
<!-- 리스트 목록 -->
	<tbody align="center">
	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="4">등록된 게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listBoard}">
		<tr>  
			<td>
				<c:out value="${qna_no}"/>
				<c:set var="qna_no" value="${qna_no-1}"/>
			</td>
<!-- 제목을 클릭시 질문 상세보기-->
			<td>
			<a href="qnaContent.do?qna_no=${dto.qna_no}">
			 ${dto.qna_subject}
			</a>
			</td>
			
			<td>${dto.qna_writer}</td>
			<td>${dto.qna_regdate}</td>			
		</tr>
	</c:forEach>
	</tbody>
	</table>
<!-- 페이징 처리 -->
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
<!--  
<form name="f" action="read_qna.do" method="post" onsubmit="return read_qna()">
<input type="hidden" name="qna_" value="${getBoard.qna_no}" />
<div class="modal" tabindex="-1" id="exampleModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title">비밀번호 입력</p>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" >
				<div class="mb-3 row" align="right">
					<label for="inputPassword" class="col-sm-3 col-form-label">비밀번호</label>
					<div class="col-sm-9" align="left">
						<input type="password" class="form-control" id="inputPassword" style="width:90%">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="col" align="center">
					<input type="submit" value="확인" type="button" class="btn btn-primary">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<script>
function read_qna(){
	if(f.qna_passwd.value==""){
		alert("비밀번호를 입력해 주세요")
		f.qna_passwd.focus()
		return false
	}
	return true
}
</script>
-->
<style>
modal-body.input{
	class:form-control;
	type: text;
}
div{white-space: normal;}
</style>

