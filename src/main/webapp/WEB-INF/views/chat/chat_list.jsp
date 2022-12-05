<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h5 align="left">반재준</h5>
			</div>
			<!-- 대화목록 -->
			<div class="col-sm-4" style="height:700">
				<div class="text-bg-light p-3" style="height:100%;">
					<table class="table table-hover" >
						<tr>
							<th>강희찬</th>
							<td>배고프다</td>
						</tr>
						<tr>
							<th>반재준</th>
							<td>나 진짜 너무 배고픈데 그래도 아침에 운동해서 기분은 좋음</td>
						</tr>	
						<tr>
							<th>고경현</th>
							<td>ㅁㅁㅁ</td>
						</tr>			
					</table>
		   		</div>
			</div>
			<!-- 대화상자 -->
			<div class="col-sm-8" style="height:700">
				<div class="position-relative">
					<div class="text" style="height:100%; background-color:#F0F8FF">
						<div class="wrap">
					        <div class="chat ch1">
					            <div class="icon"><i class="fa-solid fa-user"></i></div>
					            <div class="textbox">오늘 점심 뭐먹</div>
					        </div>
					        <div class="chat ch2">
					            <div class="icon"><i class="fa-solid fa-user"></i></div>
					            <div class="textbox">못먹을듯</div>
					        </div>
					        <div class="chat ch1">
					            <div class="icon"><i class="fa-solid fa-user"></i></div>
					            <div class="textbox">왜?</div>
					        </div>
					        <div class="chat ch2">
					            <div class="icon"><i class="fa-solid fa-user"></i></div>
					            <div class="textbox">전철역 다녀와야 함</div>
					        </div>
					        <div class="position-absolute bottom-0 start-50 translate-middle-x">
								<form class="d-flex" >
									<input class="form-control me-2" type="textfiled"  aria-label="Search" style="width:700">
									<button type="button" class="btn btn-outline-success btn px-4" id="search_btn" style="width:100">전송</button>
								</form>
							</div>
				        </div>
		    		</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../bottom.jsp"%>