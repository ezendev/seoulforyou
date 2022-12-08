<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<head>
	<link href="resources/css/chat-style.css" rel="stylesheet">
</head>
<div class="container themed-container text-center">
	<div class="container text-center">
		<!-- 행1:: 제목 -->
		<div class="row row-cols-2">
			<div class="col-5 col-lg-4">
	  			<h5>대화목록</h5>
	  		</div>
	  		<div class="col-7 col-lg-8">
	  			<!-- 대화상대 이름 -->
				<h5 id="otherNo" align="left"></h5>
			</div>
		</div>
		
		<!-- 행2:: 본문 -->
		<div class="row row-cols-2">
			<!-- 대화방 목록 -->
			<div class="col-5 col-lg-4" style="height:700">
				<div class="text-bg-light p-3" style="height:100%;">
					<table class="table table-hover" >
					<c:forEach var="tmp" items="${chatList}">
						<c:choose>
							<c:when test="${tmp.unread > 0}">
							<!-- 만약 현재사용자가 안읽은 메세지가 있다면 -->
								<tr class="chat_list_box${tmp.chat_room} unread" onclick="javascript:viewChat(${tmp.other_no}, ${tmp.chat_room})">
									<th>${tmp.other_name}</th>
									<td>
										${tmp.chat_content}
										<span class="badge badge${tmp.chat_room}">${tmp.unread}</span>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="chat_list_box${tmp.chat_room}" onclick="javascript:viewChat(${tmp.other_no}, ${tmp.chat_room})">
									<th>${tmp.other_name}</th>
									<td>${tmp.chat_content}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</table>
		   		</div>
			</div>
			<!-- 대화내역 상세보기 -->
			<div class="col-7 col-lg-8" style="height:700">
				<div class="position-relative">
					<div class="text" style="height:100%; background-color:#F0F8FF">
						<div class="wrap chat_history">
							<!-- 대화내역 올 자리 -->
							<!-- 입력창 올 자리 -->
						</div>
		    		</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// 쪽지 보내기
	function sendChat(){
		let content = $('#chatContent').val();
		content = content.trim();
		let other_no = $('#otherNo').text();
		let room_no = $('#roomNo').val();
		
		if(content == ""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url: "chatSubmit.do",
				method: "GET",
				data: {
					other_no: other_no,
					content: content,
					chat_room: room_no,
				},
				success: function(data){
					//메세지 입력칸 비우기
					$('#chatContent').val("");
					
					//메세지 내용 리로드
					viewChat(other_no, room_no);
				},
				error: function(){
					alert('서버 에러');
				}
			})
		}
	}
	
	// 대화목록에서 누르면 대화 상세정보
	const viewChat = function(other_no, chat_room){
		
		$.ajax({
			url: "chatView.do",
			method: "GET",
			data:{
				other_no: other_no,
				chat_room: chat_room
			},
			success:function(data){
				//메세지 내용을 html에 넣는다
				$(".chat_history").html(data);
				
				$("#otherNo").text(other_no);
				
				//이 함수로 메세지 내용을 가져올때마다 스크롤을 맨아래로 가게 한다.
				$(".chat_history").scrollTop($(".chat_history")[0].scrollHeight);
			},
			error: function(){
				alert("서버 에러");
			},
		});
		
		// unread 클래스를 지워 읽지않음 표시를 없앤다.
		$('.chat_list_box'+chat_room).removeClass('unread');
		// 읽지않은 갯수 뱃지를 지운다.
		$('.badge'+chat_room).empty();
		
	}
</script>
<%@ include file="../bottom.jsp"%>