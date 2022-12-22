<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>
<body>
<div class="container themed-container text-center">
<h1 class="display -5 fw-bold" align="center">질문내용</h1><br><br><br>

<!-- 버튼 생성 : 나의문의내역확인 & 검색창 -->
	<div class="position-relative">
		<div class="container-fluid">
    		<button type="button" onclick="javascript:admin()" class="btn btn-outline-success btn px-4 me-md-3" style="float:left" >나의 문의내역 확인하기</button>
		</div>
    </div><br><br><br>
    </div>
    
	<div class="container-fluid px-4" style="align:center; width:69%">
		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3">
						<label for="title" class="form-label">문의 제목</label> <input
							type="text" class="form-control" id="qna_subject" name="qna_subject"
							value="${getBoard.qna_subject}" disabled>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">문의 내용</label>
						<textarea class="form-control" id="qna_content" name="qna_content" rows="5"
							disabled>${getBoard.qna_content}</textarea>
					</div>
					<div class="mb-3">
						<label for="regDate" class="form-label">작성일</label> <input
							type="text" class="form-control" id="qna_regdate" name="qna_regdate"
							value="${getBoard.qna_regdate}" disabled>
					</div>
					<div class="mb-3">
						<label for="writer" class="form-label">작성자</label> <input
							type="text" class="form-control" id="qna_writer" name="qna_writer"
							value="${getBoard.qna_writer}" disabled>
					</div>
					<a href="qnalist.do" class="btn btn-outline-secondary">목록으로</a> 
					<a href="update_qna.do?qna_no=${getBoard.qna_no}" class="btn btn-outline-warning">수정하기</a>
					<a data-bs-toggle="modal" data-bs-target="#deleteModal" class="btn btn-outline-danger">삭제</a>
				</form>
			</div>
		</div>
		</div>
<form method="post">		
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">비밀번호 입력창</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <label for="qna_passwd">비밀번호 입력</label>
        <input type="password" id="qna_passwd" name="qna_passwd">
        <input type="hidden" id="qna_no" name="qna_no" value="${getBoard.qna_no}">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" formaction="qnaDelete.do" >확인</button>
      </div>
    </div>
  </div>
</div>
</form>
</body>	
<%@ include file="../bottom.jsp"%>