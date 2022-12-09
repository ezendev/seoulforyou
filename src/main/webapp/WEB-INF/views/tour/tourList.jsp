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
	
	<form id="tourForm" name="f" method="post" action="tourList.do">
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
			 		<form name="f2" action="mypage_favorite.do" method="post" target="iframe1">
			 		
			 		<input name="f_no" class="f_no" type="hidden" />	 		
			 		
					<button type="button"   onclick="javascript:makeFavorite()"><img src="resources/icon/star.svg" alt="" ></button>
					
			 	</form>
		      </div>
		      
		      <!-- Modal body -->
		      <div class="modal-body">
		     	 <div class="container-fluid">
		  			<div class="row">
		    			<div class="col-lg-6">
		     				 <p><img src="resources/img/seoul2.jpg" class="rounded float-start" alt="" width="100%" height="260"></p>
		    			</div>
		   			 	<div class="col-sm-12 col-md-12 col-lg-6">
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
				<div class="modal-footer">
					<div class="container text-center">
						<h5>이 여행지가 포함된 여행루트</h5>
						<div class="container text-center">
							<div class="row mt-3">
								<div class="col">
									<div class="container">	
										<div class="card h-100">
											<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
											<div class="card-text">
												<div class="d-grid gap-2">
													<a href="#" class="btn btn-secondary btn-sm">보러가기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="container">	
										<div class="card h-100">
											<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
											<div class="card-text">
												<div class="d-grid gap-2">
													<a href="#" class="btn btn-secondary btn-sm">보러가기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="container">	
										<div class="card h-100">
											<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
											<div class="card-text">
												<div class="d-grid gap-2">
													<a href="#" class="btn btn-secondary btn-sm">보러가기</a>
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
	<div class="d-flex justify-content-center mt-3">
		<c:if test="${not empty tourList}">	
			<c:if test="${startPage > pageBlock}">
				[<a href="tourList.do?pageNum=${startPage-1}&tourType=${tourType}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="tourList.do?pageNum=${i}&tourType=${tourType}">${i}</a>]
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				[<a href="tourList.do?pageNum=${endPage+1}&tourType=${tourType}">다음</a>]
			</c:if>
		</c:if>
	</div>

</div>
<script>
function makeFavorite(){
	const no = $('.no').val();
	$('.f_no').val(no);
	document.f2.submit();
	
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
}
</script>


<script>
   function searchFilter(event){
       const tourType = $("#filterByType option:selected").val();
       $('#tourType').val(tourType);
       console.log($('#tourType').val());
       $('#tourForm').submit();
   }
</script>
    
<%@ include file="../bottom.jsp"%>