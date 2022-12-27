<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tour.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<div class="container-md">
	<!-- 여행루트 분류 -->
	<div class="row mt-2">
		<div align="right">
		<div class="col-12 mb-2 col-md-2" style="float:right" >
          <select class="form-select" id="filterByType" onchange="searchFilter()">
             <option value="0" <c:if test="${routeType=='0'}"> selected </c:if> >여행루트목록</option>      
             <option value="1" <c:if test="${routeType=='1'}"> selected </c:if>>힐링</option>
             <option value="2" <c:if test="${routeType=='2'}"> selected </c:if>>미식</option>           
             <option value="3" <c:if test="${routeType=='3'}"> selected </c:if>>한류</option>           
             <option value="4" <c:if test="${routeType=='4'}"> selected </c:if>>명소</option>           
             <option value="5" <c:if test="${routeType=='5'}"> selected </c:if>>쇼핑</option>           
          </select>
		</div>
		</div>
	</div>
	
	<form id="routeForm" name="f1" method="post" action="routeList.do">
      <input type="hidden" id="routeType" name="routeType">
   </form>
	
	<!-- row -->
	<div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">	   
	  	  <c:forEach var="rdto" items="${listRoute}">	    
	  	  <div class="col 숙소">
	  		<a onclick="valueSetting('${rdto.route_readcount}','${rdto.route_no}', '${rdto.route_subject}','${rdto.route_img}','${rdto.route_content}','${rdto.route_hashtag}')" 	
	  	 	data-bs-toggle="modal" data-bs-target="#routeView"> 	  	 
			    <div class="card h-100 card border-info mb-3 card text-bg-light mb-3">
			      <img src="resources/img/seoul2.jpg" class="card-img-top" alt="..."
			      style="width:100%; height:20vw ; object-fit:cover;">
			      <div class="card-body ">
			        <h5 class="card-title text-dark ">${rdto.route_subject}</h5>
			        <p class="card-text text-primary">#${rdto.route_hashtag}</p>
			      </div>
			    </div>					  		
	  		</a>	  	  	
	  	   </div>	 
	  	 </c:forEach>
	  </div>
	</div>
	
	<!-- 상세페이지 모달 -->
	<div class="modal fade" id="routeView">
 	<div class="modal-dialog modal-lg  modal-dialog-scrollable">
	    <div class="modal-content">
			<!-- Modal body -->
			<div class="modal-body">
				<div class="container-fluid text-center">
			  		<div class="row ">
			  			<div class="col-lg-6">
			  			<!-- 1. 본문 -->
		    			<h2 align="left" >
			    			<button type="button" style="border:0; background:transparent" onclick="javascript:makeFavorite()">
								<img id="favoriteStar" src="resources/icon/star.svg" alt="" >
							</button>
		    				<input type="text" class="route_subject" style="background-color:transparent;border:0; solid black;text-align:left;" spellcheck="false" readonly>
		    			</h2>
						<input type="hidden" class="route_no">
						<div align="left">
						<span>조회수:</span>
						<input type="text"class="route_readcount" style="background-color:transparent;border:0; solid black;text-align:left;" readonly>
						</div>
						<!-- 사진 -->				
						<div>
						  <img id="thumbnail" class="d-block w-100 " style="width:100%; height:20vw; object-fit:fill;">
						</div>
						<br>
						
						<!-- 글내용 -->
						<p>
							<textarea class="form-control route_content"
								id="exampleFormControlTextarea1" rows="10" readonly></textarea>
						</p>
						<p align="left">
							<input  class="route_hashtag" style="background-color:transparent;border:0; solid black;text-align:left;" spellcheck="false" readonly>
						</p>
						
						<!-- 지도에서 경로보기 -->
							<div id="map" style="width:100%;height:450px;"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>				        
								<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
								<%@include file = "route_kakaoMap.jsp"%>
							</div>
							
						<!-- 2. 리뷰 -->
							<div class="col-lg-6">
			    			<h2 align="left">리뷰</h2>
			      			<div class="mb-3">
			      				<!-- 로그인을 하지 않았다면 -->
			      				<c:if test="${empty sessionScope.mdto}">
			      					<p class="text-muted">로그인하고 리뷰를 남겨보세요!</p>
			      				</c:if>
			      				<!-- 로그인을 했다면 리뷰남기기, 내가 등록한 리뷰 보기 가능 -->
			      				<c:if test="${not empty sessionScope.mdto}">
			      					<form  action="insert_review.do" method="post">
									<input type="hidden" class="review_route_no" name="review_route_no">
									<textarea class="form-control" name="review_content" rows="7"></textarea>
									<label>평점 : </label>
					      			<select name="review_star">
						      			<option value="★☆☆☆☆">★☆☆☆☆</option>
						      			<option value="★★☆☆☆">★★☆☆☆</option>
						      			<option value="★★★☆☆">★★★☆☆</option>
						      			<option value="★★★★☆">★★★★☆</option>
						      			<option value="★★★★★">★★★★★</option>
					                </select>
									<br>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				  						<input class="btn btn-primary" type="submit" value="등록">
									</div>
									</form>
									<br><br>
									<!--내가 등록한 리뷰 --> 
									<h5	align="left">내가 등록한 리뷰</h5>
									<!-- 내가 등록한 리뷰 올 자리 -->
										<textarea class="my_review" rows="5" cols="40" readonly></textarea>
			      				</c:if>
								
									<br><br>
								<!-- 리뷰목록 -->
								<table class="table table-hover">
								  <thead>
								    <tr>
								      <th scope="col">평점</th>
								      <th scope="col">내용</th>
								    </tr>
								  </thead>
								  <tbody class="review_list">
								    <!-- review_ajax_list.jsp / 리뷰 들어갈 자리 -->
								  </tbody>
								</table>
							</div>
							</div>
						</div>
			  		</div>
			  	</div>
			</div>
	</div>
	</div>

<div class="d-flex justify-content-center mt-3">
	<nav aria-label="Page navigation example" >
			<ul class="pagination">
		<c:if test="${not empty listRoute}">	
			<c:if test="${startPage > pageBlock}">
			<li class="page-item"><a class="page-link"
				 href="routeList.do?pageNum=${startPage-1}&routeType=${routeType}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item">	<a class="page-link" href="routeList.do?pageNum=${i}&routeType=${routeType}">${i}</a>
			</li>
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				<li class="page-item">
				<a class="page-link"
				 href="routeList.do?pageNum=${endPage+1}&routeType=${routeType}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>
			</c:if>
		</c:if>
		</ul>
		</nav>
	</div>
<script>
function checkFavorite(){
	const no = $('.route_no').val();
	$.ajax({
		url: "mypage_route_favorite_check.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	if(data == "existFavorite"){
        		$("#favoriteStar").attr("src", "resources/icon/star-fill3.svg" );
        	}else{
        		$("#favoriteStar").attr("src", "resources/icon/star.svg" );
        	}
        },
	})
}

function makeFavorite(){
	const no = $('.route_no').val();
	$.ajax({
		url: "mypage_route_favorite.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	if(data=="loginFirst"){
        		alert("로그인을 해주세요.");
        	}else if(data=="add"){
        		checkFavorite();
        	}else if(data=="delete"){
        		checkFavorite();
        	}
        },
	})
	
}  
</script>

<script>
    function valueSetting(route_readcount,route_no,route_subject,
    						route_img, route_content,route_hashtag){
	//모달input에 dto값 설정
	$('.route_readcount').attr("value", route_readcount);	
	$('.route_no').attr("value", route_no);	
	$('.route_subject').attr("value", route_subject);	
	$('.route_img').attr("value", route_img);
	$('.route_content').val(route_content);
	$('.route_hashtag').attr("value", "#"+route_hashtag);
	$('.review_route_no').attr("value", route_no);
	
	//즐겨찾기 여부 확인
	checkFavorite();
	
	var upPath = $("#upPath").val();
	const no = route_no;
	
	$.ajax({
		url: 'getMyReview.do',
	 	type: 'POST',
	 	data: {route_no: no},
	 	success: function(data){
	 		$(".my_review").val(data);
	 	},
	 	error: function(){
	 		alert("error");
	 	}
	  });
	
	$.ajax({
		url: 'listReview.do',
	 	type: 'POST',
	 	data: {route_no: no},
	 	success: function(data){
	 		$(".review_list").html(data);
	 	},
	 	error: function(){
	 		alert("error");
	 	}
	  });
	
	
	$.ajax({
		  url: 'getReadcount.do',
		  type: 'POST',
		  data: {
	            no: no
	        },
		  success: function (data) {
			  $(".route_readcount").attr("value",data);
		    }
		  })
	
	
	$.ajax({
		  url: 'getTourImg.do',
		  type: 'POST',
		  data: {
	            no: no
	        },
		  success: function (data) {
			  $("#thumbnail").attr("src","https://ezdev-sfy.s3.ap-northeast-2.amazonaws.com/route/"+data);
		    }
		  })
		  
		  $.ajax({
				url: 'getRouteKakao.do',
			 	type: 'POST',
			 	data: {no: no},
			 	success: function(data){
			 		route = data.routeView;
			 	$.each(data, function(index, value){
			 		setList(route);
			 	})
			 	},
			 	error: function(){
			 		alert("error");
			 	}
			  });
}
    
    $(document).ready(function(){
    	$('#routeView').on('hide.bs.modal', function(){
    			location.reload();
    	});
    });
</script>
<script>
   function searchFilter(event){
       const routeType = $("#filterByType option:selected").val();
       $('#routeType').val(routeType);
       $('#routeForm').submit();
   }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<%@ include file="../bottom.jsp"%>