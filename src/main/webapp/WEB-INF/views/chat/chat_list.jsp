<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<!-- 채팅페이지-->
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery-3.6.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
<style>
	 table {border:1; width:100%; table-layout:fixed;}
	 table tr {height:50;} 
	 table tr th {text-align:center; width:30%;  height:auto;}
	 table tr td {text-overflow: ellipsis; overflow:hidden; white-space: nowrap; text-align:left; color:gray;}
	 {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}


.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}
</style>
	
<title>Chatting_Page</title>
</head>
<div class="container themed-container text-center">
	<div class="container text-center">
		<div class="row row-cols-2">
	  		<!-- 대화목록(제목) -->
			<div class="col-sm-4">
	  			<h5>대화목록</h5>
	  		</div>
	  		<!-- 대화창(이름) -->
	  		<div class="col-sm-8">
				<h5 align="left">라이언</h5>
			</div>
			<!-- 대화목록 -->
			<div class="col-sm-4" style="height:700">
				<div class="text-bg-light p-3" style="height:100%;">
					<table class="table table-hover" >
					<c:forEach var="tmp" items="${chatList}">
						<tr class="chat_list_box${tmp.chat_room}" onclick="javascript:viewChat(${tmp.chat_room}, ${tmp.other_no})">
							<th>${tmp.other_no}</th>
							<td>${tmp.chat_content}</td>
						</tr>
					</c:forEach>
					</table>
		   		</div>
			</div>
			<!-- 대화상자 -->
			<div class="col-sm-8" style="height:700">
				<div class="position-relative">
					<div class="text" style="height:100%; background-color:#F0F8FF">
						<div class="wrap chat_history">
							<!-- 대화내역 올 자리 -->
						</div>
		    		</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function sendChat(){
		console.log($('#chatContent').val());
		document.chatForm.submit();
	}
	
	//대화목록에서 누르면 대화 상세정보
	const viewChat = function(room, other_no){
		
		$.ajax({
			url: "chatView.do",
			method: "GET",
			data:{
				room: room,
				other_no: other_no
			},
			success:function(data){
				//메세지 내용을 html에 넣는다
				$(".chat_history").html(data);
				
				//이 함수로 메세지 내용을 가져올때마다 스크롤을 맨아래로 가게 한다.
				$(".chat_history").scrollTop($(".chat_history")[0].scrollHeight);
			},
			error: function(){
				alert("서버 에러");
			},
		})
		
		//$('.unread'+room).empty(); //읽지 않은 메세지들을 읽음으로 바꾼다.
		
	}
</script>
<%@ include file="../bottom.jsp"%>