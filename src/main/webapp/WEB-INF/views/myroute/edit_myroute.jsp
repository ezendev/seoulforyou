<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- my_route_1.jsp -->
<%@ include file="../top.jsp"%>
<script>
		//enter키 막음
		document.addEventListener('keydown', function(event){
			if(event.keyCode ===13){
				event.preventDefault();
				};
			}, true);
	
		
		function route_check(){
		if(mr.trip_thema.value==""){
			alert("테마를 선택해주세요")
			mr.trip_thema.focus()
			return false
		}
		if(mr.region.value==""){
			alert("지역을 선택해주세요")
			mr.region.focus()
			return false
		}
		if(mr.startDate.value==""){
			alert("여행 시작일을 선택해주세요")
			mr.startDate.focus()
			return false
		}
		if(mr.endDate.value==""){
			alert("여행 종료일을 선택해주세요")
			mr.endDate.focus()
			return false
		}
		
		document.mr.submit();
	}

</script>

<!-- main 1번 filter -->
<form name="mr" action="myroute_editRoute_after.do" method="post">
<div class="container text-center clearfix">
  	<div class="row row-cols-3 g-10 p-5">
    <div class="col-lg-2 col-md-6">
    	<div id="thema">
		     <select class="form-select" aria-label="Default select example" name="trip_thema" id="trip_thema">
			  <option value="${getRoute.route_hashtag}" selected>#${getRoute.route_hashtag}</option>
			  <option value="힐링" <c:if test="${trip_thema=='힐링'}">selected</c:if>>#힐링</option>
			  <option value="미식" <c:if test="${trip_thema=='미식'}">selected</c:if>>#미식</option>
			  <option value="한류" <c:if test="${trip_thema=='한류'}">selected</c:if>>#한류</option>
			  <option value="명소" <c:if test="${trip_thema=='명소'}">selected</c:if>>#명소</option>
			  <option value="쇼핑" <c:if test="${trip_thema=='쇼핑'}">selected</c:if>>#쇼핑</option>
			</select>
	    </div>
    </div>
    
    <div class="col-lg-2 col-md-6">
      <div id="regionSelect">
      <select class="form-select" aria-label="Default select example" name="region" id="region">
		 <option value="${getRoute.route_region}" selected>세부지역(구)</option>
		  <option value="1"<c:if test="${region=='1'}">selected</c:if>>강남구</option>
		  <option value="2"<c:if test="${region=='2'}">selected</c:if>>강동구</option>
		  <option value="3"<c:if test="${region=='3'}">selected</c:if>>강북구</option>
		  <option value="4"<c:if test="${region=='4'}">selected</c:if>>강서구</option>
		  <option value="5"<c:if test="${region=='5'}">selected</c:if>>관악구</option>
		  <option value="6"<c:if test="${region=='6'}">selected</c:if>>광진구</option>
		  <option value="7"<c:if test="${region=='7'}">selected</c:if>>구로구</option>
		  <option value="8"<c:if test="${region=='8'}">selected</c:if>>금천구</option>
		  <option value="9"<c:if test="${region=='9'}">selected</c:if>>노원구</option>
		  <option value="10"<c:if test="${region=='10'}">selected</c:if>>도봉구</option>
		  <option value="11"<c:if test="${region=='11'}">selected</c:if>>동대문구</option>
		  <option value="12"<c:if test="${region=='12'}">selected</c:if>>동작구</option>
		  <option value="13"<c:if test="${region=='13'}">selected</c:if>>마포구</option>
		  <option value="14"<c:if test="${region=='14'}">selected</c:if>>서대문구</option>
		  <option value="15"<c:if test="${region=='15'}">selected</c:if>>서초구</option>
		  <option value="16"<c:if test="${region=='16'}">selected</c:if>>성동구</option>
		  <option value="17"<c:if test="${region=='17'}">selected</c:if>>성북구</option>
		  <option value="18"<c:if test="${region=='18'}">selected</c:if>>송파구</option>
		  <option value="19"<c:if test="${region=='19'}">selected</c:if>>양천구</option>
		  <option value="20"<c:if test="${region=='20'}">selected</c:if>>영등포구</option>
		  <option value="21"<c:if test="${region=='21'}">selected</c:if>>용산구</option>
		  <option value="22"<c:if test="${region=='22'}">selected</c:if>>은평구</option>
		  <option value="23"<c:if test="${region=='23'}">selected</c:if>>종로구</option>
		  <option value="24"<c:if test="${region=='24'}">selected</c:if>>중구</option>
		  <option value="25"<c:if test="${region=='25'}">selected</c:if>>중랑구</option>
		</select>
      </div>
    </div>
      
    
    <!-- calendar -->
    <div class="col-lg-6 col-md-6 pt-2">
    	<lable>여행기간 :</lable>
    		<input type="text" class="datepicker" value="${startDate}" id="startDate" name="startDate" size=10 maxlength=10> ~
	     	<input type="text" class="datepicker" value="${endDate}" id="endDate" name="endDate" size=10 maxlength=10>
    	
     		<script>
     		$.datepicker.setDefaults({
     			  dateFormat: 'yy-mm-dd',
     			  prevText: '이전 달',
     			  nextText: '다음 달',
     			  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     			  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
     			  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
     			  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
     			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
     			  showMonthAfterYear: true,
     			  yearSuffix: '년',
     			});
     			$(function(){
     				$('.datepicker').datepicker();
     		
     			})
     		</script>
    	</div>

    <div class="col-lg-2 col-md-6">
		<input class="btn btn-outline-dark" type="button" value="원래대로" onclick ="location.href='myroute_editRoute.do?route_no=${getRoute.route_no}'">
    	<input class="btn btn-outline-dark" type="button" value="저장" onclick="route_check()">
    </div>
    </div>

</div>

<!-- main 2번 filter -->
<div class="container text-center clearfix">
  <div class="row row-cols-3 g-15"> 
   
   <!-- spot -->
  <div class="col-lg-3 col-md-6">
    <div class="container mx-auto ps-3">
	  <label class="p-2">장소</label>
	  <ul class="nav nav-tabs justify-content-center" id="spot_tab" role="tablist">
		 <li class="nav-item" role="presentation">
    		<button class="nav-link active" id="search_tab" data-bs-toggle="tab" data-bs-target="#search" type="button" role="tab" aria-controls="saerch" aria-selected="true">검색</button></li>
  		 <li class="nav-item" role="presentation">
  		 	<button class="nav-link" id="favorite-tab" data-bs-toggle="tab" data-bs-target="#favorite" type="button" role="tab" aria-controls="favorite" aria-selected="false">즐겨찾기</button></li>
	   </ul>
	   
	<!-- search panel -->
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="search" role="tabpanel" aria-labelledby="search-tab" tabindex="0" style="overflow:scroll; height:600px">
		     <form name="mrs" action="eidt_tourFind.do" method="post">
		        <select class="form-select" aria-label="Default select example" name="searchType" id="searchType">
				 <option value="0" selected>여행지 목록</option>
				  <option value="1" <c:if test="${searchType=='1'}">selected</c:if>>문화</option>
				  <option value="2" <c:if test="${searchType=='2'}">selected</c:if>>명소</option>
				  <option value="3" <c:if test="${searchType=='3'}">selected</c:if>>자연</option>
				  <option value="4" <c:if test="${searchType=='4'}">selected</c:if>>음식</option>
				  <option value="5" <c:if test="${searchType=='5'}">selected</c:if>>숙소</option>
				 </select>
		        <input type="text" name="keyword">
		        <button class="btn btn-outline-success btn-sm" type="submit" formaction="edit_tourFind.do">GO!</button>
			</form>
			
		    <!-- 검색항목이 뜨는 부분 -->
		  <!-- 카드를 누르면 일정 list에 추가 -->
		  <c:if test="${empty findList}">
		  	<div>장소를 검색해주세요</div>
		  </c:if>
		  <c:if test="${not empty findList}">
		  	<c:forEach var="fdto" items="${findList}">	
			 <button class="btn" type="button" id="tourbtn" name="tourbtn" onclick="location.href='edit_addList.do?tour_no=${fdto.tour_no}'">
		  		<div class="card border-dark mx-auto" style="width: 230px; height:80px;">
				  <div class="row g-0">
				    <div class="col-md-4">
				      <img src="resources/img/1.jpg" class="img-fluid-center rounded-start pt-2" style="width:70px; height:70px">
				    </div>
				    <div class="col-md-7 mx-auto">
				        <p class="card-text pt-2">${fdto.tour_name}</p>
				    </div>
				  </div>
				</div>
			 </button>
			</c:forEach> 
		</c:if>
	 </div>
	</div>	
 
	  
	  <!-- favorite panel -->
		<div class="tab-pane fade" id="favorite" role="tabpanel" aria-labelledby="favorite-tab" tabindex="0" style="overflow:scroll; height:600px">
		<p></p>
		<button class="btn" type="button">
			<div class="card border-dark mx-auto" style="width: 90%; height:70px;">
				<div class="row g-0">
					<div class="col-md-4">
				      <img src="resources/img/1.jpg" class="img-fluid-center rounded-start" style="width:70px; whight:70px">
				    </div>
				    <div class="col-md-7 mx-auto">
				        <p class="card-text">장소 정보(주소)...</p>
				    </div>
				 </div>
			</div>
		</button> 
		</div>
	
	</div>
	</div>

   <!-- schedule -->
   <div class="col-lg-4 col-md-6">
   	<div class="container mx-auto ps-3" style="overflow:scroll; height:700px">
   		<label>일정 만들기</label>    		
   		<p></p>
   		<c:if test ="${empty editRoute}">
   			<p>일정이 비어있습니다.</p>   		
   		</c:if>
   		<c:if test ="${not empty editRoute}">
   		<c:forEach var="rdto" items="${editRoute}">
   		<p></p>
			<div class="card border-dark pt-2" style="width: 100%; height:120px;">
				<div class="row g-0">
					<div class="col-md-3">
				      <img src="resources/img/1.jpg" class="img-fluid-center rounded-start pt-2" style="width:80px; height:80px">
				    </div>
				    <div class="col-md-7">
				        <p class="card-text" id="spot_info">${rdto.getTour_name()}</p>
				        <small class="text-muted" id="addr">${rdto.getTour_addr()}</small>
				   </div>
				   <div class="col-md-2">
					<button class="btn" type="button" onclick ="location.href='edit_delList.do?tour_no=${rdto.getTour_no()}'">
				   	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
					</svg></button>
				   </div>
				 </div>
			</div> 
   		</c:forEach>
   		</c:if>
	  </div>
  	 </div>

    
  <!-- map -->
   <div class="col-lg-5 col-md-12">
     <div class="container mx-auto"> 
    	<div class="tab-content">
    	<p></p>
	    <div id="map" style="width:100%;height:600px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>				        
			<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->
			
			<%@ include file ="edit_kakaoMap.jsp" %>
  	  	</div>
	   	</div>
     </div>
  </div>
</div>
</form>


<%@ include file="../bottom.jsp"%>