<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>

<div class="container themed-container text-center">
<h1 class="display-5 fw-bold" align="center">질문하랑께</h1><br><br><br>

<!-- 버튼 생성 : 나의문의내역확인 & 검색창 -->
	<div class="position-relative">
		<div class="container-fluid">
    		<button type="button" onclick="javascript:admin()" class="btn btn-outline-success btn px-4 me-md-3" style="float:left" url="mypage_qna.do">나의 문의내역 확인하기</button>
    		<div class="position-absolute top-0 end-0">
				<form class="d-flex">
					<select class="form-select" style="width:100">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="content">작성자</option>
					</select>
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width:230">
					<button type="button" class="btn btn-outline-success btn px-4" id="search_btn">검색</button>
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
	    </tr>
	  </thead>
	  <tbody align="center">
	  	<c:if test="${empty listBoard}">
			<tr>
				<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>	
			<tr>
		      <th scope="row">1</th>
		      <td>애인이 없는데 혼자 갈만한 곳 없을까요?</td>
		      <td>강희찬은 아님</td>
		      <td>2022-11-23</td>
		    </tr>
		<c:forEach var="dto" items="${listQna}">
		<tr>
			<td>${dto.qna_no}</td>
			<td>${dto.mem_no}</td>
			<td>${dto.qna_name}</td>
			<td>${dto.datetime}</td>
			<td>
		</tr>	
	</c:forEach>
	    </tbody>
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
	 </table>
	 <button type="button" class="btn btn-outline-success btn px-4 me-md-3" style="float:right" data-bs-toggle="modal" data-bs-target="#qnawrite">글쓰기</button>
<!-- 페이징 -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		  </ul>
		</nav>
		
<!-- 글쓰기 창 -->
<div class="modal" tabindex="-1" id="qnawrite">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">잘들으쇼잉</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
				<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="textfield" class="form-control" id="exampleFormControlInput1" placeholder="title">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">전송</button>
      </div>
    </div>
  </div>
</div>
</div>

<%@ include file="../bottom.jsp"%>



