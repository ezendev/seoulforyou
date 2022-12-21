<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../top.jsp"%>

<div class="container-md">
	<!-- 여행지 분류 -->
	<div class="row mt-2">
		<div align="right">
			<div class="col-12 mb-3 col-md-2" style="float:right" >
	          <select class="form-select" id="filterByType" onchange="searchFilter()">
	             <option value="0" <c:if test="${tourType=='0'}"> selected </c:if>>여행지목록</option>      
	             <option value="1" <c:if test="${tourType=='1'}"> selected </c:if>>문화</option>
	             <option value="2" <c:if test="${tourType=='2'}"> selected </c:if>>명소</option>
	             <option value="3" <c:if test="${tourType=='3'}"> selected </c:if>>자연</option>
	             <option value="4" <c:if test="${tourType=='4'}"> selected </c:if>>음식</option>
	             <option value="5" <c:if test="${tourType=='5'}"> selected </c:if>>숙소</option>
	          </select>
			</div>
		</div>
	</div>
	
	<form id="tourForm" name="f1" method="post" action="tourList.do">
      <input type="hidden" id="tourType" name="tourType">
   </form>
	
	<!-- 여행지 리스트 -->
	<div class="tourrow row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">
		<c:forEach var="tdto" items="${tourList}">
			<!-- 여행지 -->
			<div class="tourcol col ${tdto.tour_type}">
				<a onclick="valueSetting('${tdto.tour_no}', '${tdto.tour_name}','${tdto.tour_postal}','${tdto.tour_addr}','${tdto.tour_hp}')"
					data-bs-toggle="modal" data-bs-target="#tourView">
			    	<div class="card h-100">
			    		<!-- 여행지 이미지 -->
				    	<img src="resources/img/seoul2.jpg" class="card-img-top" alt="..."
				    		style="width:100%; height:20vw; object-fit:cover;">
						<!-- 여행지 -->
			    		<div class="tour-card-body card-body">
					      	<!-- 이름 -->
					        <h5 class="card-title">${tdto.tour_name}</h5>
					        
				        	<!-- 주소 -->
					        <c:choose>
						        <c:when test="${fn:length(tdto.tour_addr) gt 26}">
						        	<p class="card-text">${fn:substring(tdto.tour_addr, 0, 25)}...</p>
						        </c:when>
						        <c:otherwise>
							        <p class="card-text">${tdto.tour_addr}</p>
						        </c:otherwise>
							</c:choose>
						</div>
    				</div>
   				</a>
			</div>
		</c:forEach>
	</div>
	
	<!-- 여행지 상세페이지 모달 -->
	<div class="modal fade" id="tourView">
	 	<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    
		      <!-- Modal Header -->
		      <div class="modal-header">
		      		<!-- 즐겨찾기 이미지 -->
			 		<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
			 		<button type="button" style="border:0; background:transparent" onclick="javascript:makeFavorite()">
						<img id="favoriteStar" src="resources/icon/star.svg" alt="" >
					</button>
		      </div>
		      
		      <!-- Modal body -->
		      <div class="modal-body">
		     	 <div class="container-fluid">
		  			<div class="row">
		    			<div class="col-lg-6">
		     				 <p><img src="resources/img/seoul2.jpg" class="rounded float-start" alt="" width="100%" height="260"></p>
		    			</div>
		   			 	<div class="col-sm-12 col-md-12 col-lg-6">
		   			 		<p><input type="hidden" class="no" /></p>
			     			 <p><img src="resources/icon/geo-alt.svg">이름: <input class="name"  /></p>
			     			 <p><img src="resources/icon/clock.svg">우편번호: <input class="postal"  /></p>
			     			 <p><img src="resources/icon/clock.svg"> 주소: <input class="addr"  /></p>
			     			 <p><img src="resources/icon/telephone.svg"> 전화번호: <input class="hp"  /></p>
		    			</div>
		 		 	</div>
				</div>
		        &nbsp;&nbsp;
		      </div>
		      
				<!-- Modal footer -->
				<div class="routes modal-footer">
					<!-- 이 여행지가 포함된 루트 / tour_ajax_list.jsp 올 자리 -->
				</div>
				<!-- Modal footer End -->
				
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center mt-3">
	<nav aria-label="Page navigation example" >
			<ul class="pagination">
		<c:if test="${not empty tourList}">	
			<c:if test="${startPage > pageBlock}">
			<li class="page-item"><a class="page-link"
				 href="tourList.do?pageNum=${startPage-1}&tourType=${tourType}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item">	<a class="page-link" href="tourList.do?pageNum=${i}&tourType=${tourType}">${i}</a>
			</li>
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				<li class="page-item">
				<a class="page-link"
				 href="tourList.do?pageNum=${endPage+1}&tourType=${tourType}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>
			</c:if>
		</c:if>
		</ul>
		</nav>
	</div>

</div>
<script>
function checkFavorite(){
	const no = $('.no').val();
	$.ajax({
		url: "mypage_favorite_check.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	if(data == "existFavorite"){
        		$("#favoriteStar").attr("src", "resources/icon/star-fill.svg" );
        	}else{
        		$("#favoriteStar").attr("src", "resources/icon/star.svg" );
        	}
        },
	})
}

function makeFavorite(){
	const no = $('.no').val();
	$.ajax({
		url: "mypage_favorite.do",
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
function loadRoute(no){
	var no = no;
	
	$.ajax({
		url: "loadRoute.do",
        type: "POST",
        data: {
            no: no
        },
        success: function (data) {
        	$(".routes").html(data);
        },
	})
}

</script>

<script>

//각 여행지 눌렀을 때 해당 dto값을 모달영역에 띄워주는 함수
function valueSetting(no, name, postal, addr, hp){
	//모달input에 dto값 설정
	$('.no').attr("value", no);
	$('.name').attr("value", name);
	$('.postal').attr("value", postal);
	$('.addr').attr("value", addr);
	$('.hp').attr("value", hp);	
	
	//즐겨찾기 여부 확인
	checkFavorite();
	
	//이 여행지가 포함된 여행루트 불러오기
	loadRoute(no);
}
</script>


<script>
   function searchFilter(event){
       const tourType = $("#filterByType option:selected").val();
       $('#tourType').val(tourType);
       $('#tourForm').submit();
   }
</script>
    
<%@ include file="../bottom.jsp"%>