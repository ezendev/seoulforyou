<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- my_route_2.jsp -->
<%@ include file="../top.jsp"%>

<script type="text/javascript">
	//enter키 막음
	

	function routeAfter_check(){
		if(mra.route_subject.value==""){
			alert("제목을 입력해주세요")
			routeAfter.route_subject.focus()
			return
		}
		if(mra.route_content.value==""){
			alert("내용을 입력해주세요")
			routeAfter.route_content.focus()
			return false
		}
		
		
		document.routeAfter.submit()
	}
</script>

<!-- main--> 
<form name="routeAfter" action="update_MyRoute.do" method="post" enctype="multipart/form-data">
	<div class="container">
		<div class="row">
			<div class="mx-auto pt-5">
 			 <input type="text" class="form-control" id="route_subject" name="route_subject" value="${getRoute.route_subject}">
			</div>
		</div>
	
	<!-- content -->
	<div class="row">
		<div class="col-7 mx-auto pt-4">
			<div class="form-floating pb-2">
			  <textarea class="form-control" name="route_content" id="floatingTextarea2" style="height: 550px">${getRoute.route_content}</textarea>
			</div>
			 <div class="mb-3">
			  <label for="formFile" class="form-label">이미지를 첨부해주세요!</label>
			  <input class="form-control" type="file" name="editFile" id="editFile">
			</div>
		</div>
		
		<!-- map! -->
		<div class="col-5 mx-auto pt-4">
			<div id="map" style="width:100%;height:650px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>
			<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
			<%@include file="edit_kakaoMap.jsp" %>
			
			
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