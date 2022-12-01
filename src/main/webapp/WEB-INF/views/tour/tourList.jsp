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
	             <option value="" selected >여행지목록</option>      
	             <option value="1">문화</option>
	             <option value="2">명소</option>
	             <option value="3">자연</option>
	             <option value="4">음식</option>
	             <option value="5">숙소</option>
	          </select>
			</div>
		</div>
	</div>
	
	<form name="f" method="post" action="tourList.do">
		<input type="hidden" name="tourType">
	</form>
	
	<!-- 여행지 리스트 -->
	<div class="tourrow row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">
		<c:forEach var="tdto" items="${tourList}">
			<!-- 여행지 -->
			<div class="tourcol col ${tdto.tour_type}">
				<a onclick="valueSetting('${tdto.tour_name}','${tdto.tour_postal}','${tdto.tour_addr}','${tdto.tour_hp}'
											,'${tdto.tour_open_time}','${tdto.tour_open_day}','${tdto.tour_close_day}','${tdto.tour_traffic}')"
					data-bs-toggle="modal" data-bs-target="#tourView">
			    	<div class="card h-100">
			    		<!-- 여행지 이미지 -->
				    	<img src="resources/img/111.jpeg" class="card-img-top" alt="..."
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
			 		<a href="#" id="favorite" title="즐겨찾기 등록"><img src="resources/icon/star-fill.svg"></a>
		      </div>
		      
		      <!-- Modal body -->
		      <div class="modal-body">
		     	 <div class="container-fluid">
		  			<div class="row">
		    			<div class="col-lg-6">
		     				 <p><img src="resources/img/k1.jpg" class="rounded float-start" alt="" width="100%" height="260"></p>
		    			</div>
		   			 	<div class="col-sm-12 col-md-12 col-lg-6">
			     			 <p><img src="resources/icon/geo-alt.svg">이름: <input id="name" style="display:none" /></p>
			     			 <p><img src="resources/icon/clock.svg">우편번호: <input id="postal" style="display:none" /></p>
			     			 <p><img src="resources/icon/clock.svg"> 주소: <input id="addr" style="display:none" /></p>
			     			 <p><img src="resources/icon/telephone.svg"> 전화번호: <input id="hp" style="display:none" /></p>
			     			 <p><img src="resources/icon/house-door.svg"> 운영시간: <textarea id="open_time" style="display:none"></textarea></p>
			     			 <p><img src="resources/icon/house-door.svg"> 운영요일: <textarea id="open_day" style="display:none"></textarea></p>
			     			 <p><img src="resources/icon/house-door.svg"> 휴무일: <textarea id="close_day" style="display:none"></textarea></p>
			     			 <p><img src="resources/icon/shop-window.svg"> 교통정보: <textarea id="traffic" style="display:none"></textarea></p>
		    			</div>
		 		 	</div>
				</div>
		        &nbsp;&nbsp;
		      </div>
		      
				<!-- Modal footer -->
				<div class="modal-footer">
					<div class="container text-center">
						<h5>선택된 여행지가 포함된 루트찾기</h5>
						<div class="container text-center">
							<div class="row">
								<div class="col">
									<div class="container mt-3">	
										<div class="card" style="width:100%; height:150px" >
									<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
									<div class="card-text">
										<div class="d-grid gap-2">
											<a href="#" class="btn btn-secondary btn-sm">Find</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="container mt-3">	
								<div class="card" style="width:100%; height:150px" >
						<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
								<div class="card-text">
								<div class="d-grid gap-2">
									<a href="#" class="btn btn-secondary btn-sm">Find</a>
								</div>
								</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="container mt-3">	
								<div class="card" style="width:100%; height:150px" >
						<img class="card-img-top" src="resources/root/root1.jpeg" alt="Card image" style="width:100%">
														<div class="card-text">
														<div class="d-grid gap-2">
															<a href="#" class="btn btn-secondary btn-sm">Find</a>
														</div>
														</div>
														</div>
													</div>
												</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer End -->
				
			</div>
		</div>
	</div>
	<c:if test="${not empty tourList}">	
		<c:if test="${startPage > pageBlock}">
			[<a href="tourList.do?pageNum=${startPage-1}">이전</a>]
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="tourList.do?pageNum=${i}">${i}</a>]
		</c:forEach>	
		<c:if test="${pageCount > endPage}">
			[<a href="tourList.do?pageNum=${endPage+1}">다음</a>]
		</c:if>
	</c:if>

</div>


<script>

// 각 여행지 눌렀을 때 해당 dto값을 모달영역에 띄워주는 함수
function valueSetting(name, postal, addr, hp, open_time, open_day, close_day, traffic){
	//모달input에 dto값 설정 후 보이기
	$('#name').val(name);	$('#name').show();
	$('#postal').val(postal);	$('#postal').show();	
	$('#addr').val(addr);	$('#addr').show();	
	$('#hp').val(hp);	$('#hp').show();	
	$('#open_time').val(open_time);	$('#open_time').show();	
	$('#open_day').val(open_day);	$('#open_day').show();
	$('#close_day').val(close_day);	$('#close_day').show();
	$('#traffic').val(traffic);	$('#traffic').show();
	
}
</script>

<script>
$(document).ready(function() {
    $('#favorite').on('click', function(e) {
        var bookmarkURL = window.location.href;
        var bookmarkTitle = document.title;
        var triggerDefault = false;
        if (window.sidebar && window.sidebar.addPanel) {
            // Firefox version < 23
            window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
        } else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
            // Firefox version >= 23 and Opera Hotlist
            var $this = $(this);
            $this.attr('href', bookmarkURL);
            $this.attr('title', bookmarkTitle);
            $this.attr('rel', 'sidebar');
            $this.off(e);
            triggerDefault = true;
        } else if (window.external && ('AddFavorite' in window.external)) {
            // IE Favorite
            window.external.AddFavorite(bookmarkURL, bookmarkTitle);
        } else {
            // WebKit - Safari/Chrome
            alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
        }
        return triggerDefault;
    });
});
</script>
<script>
	function searchFilter(event){
	    console.log("야호");
	    const tourType = $("#filterByType option:selected").val();
	    console.log(tourType);
	    document.f.tourType.value = tourType;
	    f.submit();
	}
</script>
    
<%@ include file="../bottom.jsp"%>