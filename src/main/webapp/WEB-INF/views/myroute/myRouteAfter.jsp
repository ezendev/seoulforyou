<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- my_route_2.jsp -->
<%@ include file="../top.jsp"%>
	
	
<script type="text/javascript">
	function routeAfter_check(){
		if(routeAfter.route_subject.value==""){
			alert("제목을 입력해주세요")
			routeAfter.route_subject.focus()
			return
		}
		if(routeAfter.route_content.value==""){
			alert("내용을 입력해주세요")
			routeAfter.route_content.focus()
			return false
		}
		if(routeAfter.filename.value==""){
			alert("파일을 입력해주세요")
			routeAfter.filename.focus()
			return false
		}
		
		
		document.routeAfter.submit()
	}
	
	

</script>

<!-- main--> 
<form name="routeAfter" action="upload.do" method="post" enctype="multipart/form-data">
	<div class="container">
		<div class="row">
			<div class="mx-auto pt-5">
 			 <input type="text" class="form-control" id="route_subject" name="route_subject" placeholder="제목을 입력해주세요" >
			</div>
		</div>
	
	<!-- content -->
	<div class="row">
		<div class="col-7 mx-auto pt-4">
			<div class="form-floating pb-2">
			  <textarea class="form-control" name="route_content" id="route_content" style="height: 550px"></textarea>
			  <label for="floatingTextarea2">내용을 입력해주세요!</label>
			</div>
			 <div class="mb-3">
			  <label for="formFile" class="form-label">이미지를 첨부해주세요!</label>
			  <input class="form-control" type="file" name="filename" id="filename" multiple>
			</div>
		</div>
				
		<!-- map! -->
		<div class="col-5 text-center pt-3">	
		<button class="btn btn-outline-secondary sm-btn" type="button" onclick="setBounds()">ROUTE CHECK</button>
			<div id="map" style="width:100%;height:600px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>
			<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
			<%@include file="kakaoMap.jsp" %>
			
			
		</div>	
		<div class="row p-3">
			<div align="center">
				<input class="btn btn-outline-dark" type="submit" id="save" value="저장" onclick="routeAfter_check()">
				<input class="btn btn-outline-dark" type="button" id="reset" value="취소">
			</div> 
		</div>	
	</div>
</div>
</form>
<%@ include file="../bottom.jsp"%>