<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="tmp" items="${msgList}">
	<input type="hidden" id="roomNo" value="${tmp.chat_room}" />
	<input type="hidden" id="otherName" value="${tmp.other_name}" />
	<input type="hidden" id="otherNo" value="${tmp.other_no}" />
	<c:choose>
		<c:when test="${nowUserNo ne tmp.chat_send_no}">
			<!-- 만약 현재 로그인된 유저가 받은 메시지라면 -->
			<div class="chat ch1">
	            <div class="textbox">${tmp.chat_content}</div>
	            <span>${tmp.chat_send_time}</span>
	        </div>
		</c:when>		
		<c:otherwise>
			<!-- 만약 현재 로그인된 유저가 보낸 메시지라면 -->
			<div class="chat ch2">
	            <div class="textbox">${tmp.chat_content}</div>
	            <span>${tmp.chat_send_time}</span>
	        </div>
		</c:otherwise>
	</c:choose>
</c:forEach>
<div class="position-sticky">
	<form name="chatForm" method="post" class="d-flex" action="chatSubmit.do">
		<input id="chatContent" name="chatContent" class="form-control me-2" type="textfiled"  aria-label="Search" style="width:700">
		<button onclick="javascript:sendChat()" type="button" class="btn btn-outline-success btn px-4" id="search_btn" style="width:100">전송</button>
	</form>
</div>

<script>
//enter키 막음
document.addEventListener('keydown', function(event){
	if(event.keyCode ===13){
		event.preventDefault();
		};
	}, true);

</script>