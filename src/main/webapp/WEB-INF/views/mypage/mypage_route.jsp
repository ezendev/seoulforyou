<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- mypage_route.jsp -->
<%@ include file="mypage.jsp"%>

<style>
a {
  text-decoration: none;
  color: black;
}
</style>
<!-- 나의 여행 루트 페이지 -->
  <div class="wrapper col-md-9">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
       <section class="content-header">
          <h2 id="mypage_route" align="center">나의 여행 루트</h2>   
       </section>
       <div class="row mt-2">
		<div align="right">
			<div class="col-12 mb-3 col-md-2" style="float:right" >
	          <select class="form-select" id="hashtagFilter" onchange="hashtagFilter()">
	             <option value="" <c:if test="${route_hashtag==''}"> selected </c:if>>#여행 테마</option>      
	             <option value="힐링" <c:if test="${route_hashtag=='힐링'}"> selected </c:if>>#힐링</option>
	             <option value="미식" <c:if test="${route_hashtag=='미식'}"> selected </c:if>>#미식</option>
	             <option value="한류" <c:if test="${route_hashtag=='한류'}"> selected </c:if>>#한류</option>
	             <option value="명소" <c:if test="${route_hashtag=='명소'}"> selected </c:if>>#명소</option>
	             <option value="쇼핑" <c:if test="${route_hashtag=='쇼핑'}"> selected </c:if>>#쇼핑</option>
	          </select>
			</div>
		</div>
	</div>
	
	<form id="routeForm" name="f" method="post" action="mypage_route.do">
      <input type="hidden" id="route_hashtag" name="route_hashtag">
   </form>
    	<section class="content container-fluid">
          <div class="col-lg-12">
            <div class="box box-primary">
               <div class="box-body">
        
		        <!-- Main content -->
		      	<table class="table table-sm table-hover">
		         <tbody>
		            <tr>
		               <th style="width: 10%">NO</th>
		               <th style="width: 10%">#테마</th>
		               <th style="width: 40%">제목</th>
		               <th style="width: 10%">작성일</th>
		               <th style="width: 10%">조회수</th>
		               <th style="width: 10%">수정</th>
		               <th style="width: 10%">삭제</th>
		            </tr>
		           <c:if test="${empty listMyroute}">
					<tr>
						<td colspan="6">등록된 여행 루트가 없습니다.</td>
					</tr>
			       </c:if>
			       <c:set var="num" value="${requestScope.num}"/>
			       <c:if test="${not empty listMyroute}">
			          <c:forEach items="${listMyroute}" var="dto">
		               	<tr>
		                	<td style="width: 10%">
		                		<c:out value="${num}"/>
		                		<c:set var="num" value="${num-1}"/>
		                	</td>
		                	<td style="width: 10%">#${dto.route_hashtag}</td>
        					<td style="width: 40%">
				                <button id="modal_view" type="button" class="btn" onclick="view('${dto.route_no}')" data-bs-toggle="modal" data-bs-target="#routeView">
	        					${dto.route_subject}</button></td>
			             	<td style="width: 10%">${dto.route_regdate}</td>
		                 	<td style="width: 10%">${dto.route_readcount}</td>		                 	
		                 	<td style="width: 10%">
		                 	<button type="button" class="btn btn-light" onclick="location.href='myroute_editRoute.do?route_no=${dto.route_no}'" style="--bs-btn-padding-y: .2rem; --bs-btn-padding-x: .3rem;">
						   		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg></button>
		                 	</td>
		                 	<td style="width: 10%">
			                 	<button type="button" class="btn btn-light" onclick="view('${dto.route_no}')" style="--bs-btn-padding-y: .2rem; --bs-btn-padding-x: .3rem;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
						   		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
		  						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
								</svg></button>
		                 	</td>
		             	</tr> 
					 </c:forEach>
					</c:if> 
  		          </tbody>
		         </table>
		        </div>
             </div>
            </div>  

  <div class="d-flex justify-content-center mt-3">
      <form name="mpnext" method="get">
	     <div class="box-footer">
		    <div class="text-center">
		    <nav aria-label="Page navigation example" >
			<ul class="pagination">
		       <c:if test="${not empty listMyroute}">
		       	<c:if test ="${startPage >pageBlock }">
		       	<li class="page-item"><a class="page-link"
		       		 href="mypage_route.do?pageNum=${startPage-1}&route_hashtag=${route_hashtag}" aria-label="Previous">
		       		 <span aria-hidden="true">&laquo;</span>
		       		 </a></li>
		       	</c:if>
		       	<c:forEach var ="i" begin="${startPage}" end="${endPage}">
		       		<li class="page-item"><a class="page-link" href ="mypage_route.do?pageNum=${i}&route_hashtag=${route_hashtag}">${i}</a>
				</li>
		       	</c:forEach>     	
		        <c:if test="${pageCount> endPage}">
		        <li class="page-item">
				<a class="page-link"
		        	href="mypage_route.do?pageNum=${endPage+1}&route_hashtag=${route_hashtag}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>   
		       	</c:if>
		       </c:if>
		       </ul>
		       </nav>
		    </div>
		</div>
      </form>
      </div>
		</section>
	</div>
</div>

<!-- Modal -->
<form name="mypageroutedel" id="delModalForm" action="myroute_delRoute.do?route_no=${dto.route_no}" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">나의 루트 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body mx-auto">
       	<p class="mx-auto">루트를 삭제하시려면 비밀번호를 입력해주세요</p>
       	<input type="password" name="passwd">
      </div>
      <small lable>*카카오 로그인 회원의 경우 <br>내 정보 수정에서 비밀번호 변경 후에 이용해주세요</small>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</form>

<!-- view modal -->
<div class="modal fade" id="routeView" data-bs-backdrop="static">
 	<div class="modal-dialog modal-md modal-dialog-scrollable">
	    <div class="modal-content">
	      	<div class="modal-header"> 
	      		<div align="left">
		        <h1 class="modal-title fs-5 mx-auto" id="staticBackdropLabel">ROUTE</h1>
		        </div>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="reload()"></button>
		      </div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="container text-center">
			  	<div class="row">
			  			<!-- 좌측페이지(제목, 콘텐츠, 이미지, 해쉬태그는 ajax에서 설정되어서 여기에는 값이 없음)-->
			    		<div class="col-lg-12">
			    			<h2 id="subject" align="left"></h2>
							<!-- 사진 -->
							  <div class="container">
							      <img id="main_image" src="" class="d-block w-100" style="width:100%; height:20vw; object-fit:fill;" >
							  </div>
							<br>
						<!-- 글내용 -->
							<textarea id="content" class="form-control" id="exampleFormControlTextarea1" rows="10" readonly></textarea>
							<p id="hashtag" align="right"></p>
						<!-- 지도에서 경로보기 -->
							<h5	align="left">내가 만든 루트</h5> 
						  	<div id="map" style="width:100%;height:500px;"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>				        
									<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
										<%@include file = "viewKakao.jsp"%>										
							</div>						
					</div>
				</div>
			</div><!-- 모달 바디 종료 -->
			
		</div>
	</div>
</div>            
            
<script>
	function hashtagFilter(event){
		const route_hashtag = $("#hashtagFilter option:selected").val();
		$('#route_hashtag').val(route_hashtag);
		console.log($('#route_hashtag').val());
		$('#routeForm').submit();
	}

	
	function view(route_no){
		
	$.ajax({
		type:'POST',
		url: 'mypage_routeView.do',
		data : {route_no: route_no},
		asyne: false,
		success: function(result){
			var no = result.no;
			var subject = result.subject;
			var content = result.content;
			var img = result.img;
			var hashtag = result.hashtag;
			route = result.routeView;
			
	console.log(img);
			$.each(result, function(index, value){
				$('#subject').text(subject);
				$('#content').text(content);
				$('#hashtag').text("#"+hashtag);
				$('#delModalForm').attr("action", "myroute_delRoute.do?route_no="+no);
				$('#main_image').attr("src", "https://ezdev-sfy.s3.ap-northeast-2.amazonaws.com/route/"+img);
				setList(route);
							
			})
			
			console.log("성공");
		},
		error: function(){	
			alert("error");
		}
	});
	}
	
	function reload(){
		location.reload();
	}
	

	
</script>

<%@ include file="../bottom.jsp"%>