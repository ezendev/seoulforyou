<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "mypage.jsp" %>

		<div class="col-md-9">
        	<h3 align="center">회원탈퇴</h3>
        	<p class="d-flex justify-content-center mt-4">정말로 탈퇴하시겠습니까?</p>
   		  <button style="float:right" onclick="javascript:quit()" type="button" class="btn btn-primary">탈퇴</button>
		</div>

</div>
</div>
<script>
	function quit(){
		location.href="deleteMember.do";
	}
</script>

<%@ include file ="../bottom.jsp"%>