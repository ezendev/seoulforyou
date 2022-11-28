<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- my_route_2.jsp -->
<%@ include file="../top.jsp"%>

<!-- main--> 
<div class="container">
	<div class="row">
		<div class="mx-auto pt-5">
 			 <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" >
		</div>
	</div>
	
	<!-- content -->
	<div class="row">
		<div class="col-7 mx-auto pt-4">
		<div id="editor"></div>
		<script>
	
			var editor = new toastui.Editor({
				el: document.querySelector('#editor'),
				height: '600px',
				initialValue: '',
				initialEditType: 'wysiwyg',
				previewStyle : 'vertical'
			});
			
				function Edit(){
				$('#save').click(function(){
					var html =editor.getHTML();
					alert(html);
				});
				
			console.log('editor.getHTML() : '+ editor.getHTML());
			};
		</script>
		</div>
		
		<!-- map! -->
		<div class="col-5 mx-auto pt-4">
			<div id="map" style="width:100%;height:600px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>
			<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
			<%@include file="kakaoMap.jsp" %>
		</div>
		
		<div class="row p-3">
			<div align="center">
				<input class="btn btn-outline-dark" type="button" id="save" value="저장" onclick="javascript:Edit()">
				<input class="btn btn-outline-dark" type="button" id="reset" value="취소">
			</div> 
		</div>	
	</div>

<%@ include file="../bottom.jsp"%>