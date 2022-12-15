<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>
<body>

<div class="container themed-container text-center">
<h1 class="display -5 fw-bold" align="center">질문수정</h1><br><br><br>
</div>
<form name="f" action="update_qna.do" method="post" onsubmit="return checkQna()">
	<input type="hidden" name="qna_no" value="${getBoard.qna_no}" />
	<div class="container-fluid px-4" style="align:center; width:69%">
		<div class="card mb-4">
			<div class="card-body">
				
					<div class="mb-3">
						<label for="title" class="form-label">문의 제목</label> <input
							type="text" class="form-control" id="qna_subject" name="qna_subject"
							value="${getBoard.qna_subject}">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">문의 내용</label>
						<textarea class="form-control" id="qna_content" name="qna_content"
							>${getBoard.qna_content}</textarea>
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
					<div class="mb-3">
					<label for="passwd" class="form-label">비밀번호</label> 
					<input type="password" class="form-control" name="qna_passwd">
					</div>
					
					<a href="qnalist.do" class="btn btn-outline-secondary">목록으로</a> 
					<input type="submit" value="글수정" class="btn btn-outline-warning">
					<input type="reset" value="다시작성"class="btn btn-outline-danger">
				
			</div>
		</div>
		</div>
		</form>
</body>
<br>	
<%@ include file="../bottom.jsp"%>

	<script type="text/javascript">
		function checkQna(){
			if (!f.qna_subject.value){
				alert("제목을 입력해 주세요!!")
				f.qna_subject.focus()
				return false
			}
			if (f.qna_content.value==""){
				alert("내용을 입력해 주세요!!")
				f.qna_content.focus()
				return false
			}
			if (f.qna_passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.qna_passwd.focus()
				return false
			}
			return true		
		}
	</script>