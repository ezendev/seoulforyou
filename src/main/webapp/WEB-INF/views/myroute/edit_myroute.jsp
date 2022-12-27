<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- my_route_1.jsp -->
<%@ include file="../top.jsp"%>

<script>
	function route_check(){
		if(mr.trip_thema.value=="0"){
			alert("테마를 선택해주세요")
			mr.trip_thema.focus()
			return false
		}
		if(mr.region.value=="0"){
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
	
	//enter키 막음
		document.addEventListener('keydown', function(event){
			if(event.keyCode ===13){
				event.preventDefault();
				};
			}, true);

</script>
<style>
	.p-4{
	background-image:url("resources/img/seoul.png");
	height:300px;
	position: relative;
	margin-top:-73px;

	}
	.inner_div{
	width : 1000px;
  	height : 150px;
  	background-color: #FFEFD5;
  	background-color: rgba( 255, 255, 255, 0.7 );
  	position: absolute;
  	margin-left: 100px;
  	margin-top:-5px;
	}
	.display-5{
	text-align:left;
	margin-left: 100px;
	margin-top:-5px;
	font-color:white;
	}
	.inner_col{
	display:flex;
	justify-content: space-around;
	margin-top:50px;
	}
	.button_col{
	margin-right:26px;
	margin-top:10px;
	}
    .card_col{
    display:flex;
    gap: 1rem;
    justify-content: space-between;
    }
	h3{
	font-family:HYHeadLine;
	}
</style>


<!-- main 1번 filter -->
<body>
<main>
<div class=container>
<form name="mr" action="myroute_editRoute_after.do" method="post">
<form name="mrs" method="post">

<section class="py-5 text-center container" style="height:275px">
<!--설정 체크 창 -->
<div class="p-4 p-md-5 mb-4">
	<h1 class="display-5 fw-bold text-white">나의 여행</h1>
	<div class="inner_div">
  	<div class="row2">
  	<div class="inner_col">
  	
    <!-- 테마 선택 -->
	
	    <select class="form-select" aria-label="Default select example" name="trip_thema" id="trip_thema" style="width:250px">
			<option value="${getRoute.route_hashtag}" selected>#${getRoute.route_hashtag}</option>
				<option value="힐링" <c:if test="${trip_thema=='힐링'}">selected</c:if>>#힐링</option>
				<option value="미식" <c:if test="${trip_thema=='미식'}">selected</c:if>>#미식</option>
				<option value="한류" <c:if test="${trip_thema=='한류'}">selected</c:if>>#한류</option>
				<option value="명소" <c:if test="${trip_thema=='명소'}">selected</c:if>>#명소</option>
				<option value="쇼핑" <c:if test="${trip_thema=='쇼핑'}">selected</c:if>>#쇼핑</option>
		</select>
 
    
    <!-- 지역 선택 -->
    
		<select class="form-select" aria-label="Default select example" name="region" id="region" style="width:250px">
			<option value="${getRoute.route_region}" selected>세부지역(구)</option>
				<option value="9"<c:if test="${region=='9'}">selected</c:if>>강남구</option>
				<option value="11"<c:if test="${region=='11'}">selected</c:if>>강동구</option>
				<option value="23"<c:if test="${region=='23'}">selected</c:if>>강북구</option>
				<option value="1"<c:if test="${region=='1'}">selected</c:if>>강서구</option>
				<option value="7"<c:if test="${region=='7'}">selected</c:if>>관악구</option>
				<option value="15"<c:if test="${region=='15'}">selected</c:if>>광진구</option>
				<option value="3"<c:if test="${region=='3'}">selected</c:if>>구로구</option>
				<option value="5"<c:if test="${region=='5'}">selected</c:if>>금천구</option>
				<option value="25"<c:if test="${region=='25'}">selected</c:if>>노원구</option>
				<option value="24"<c:if test="${region=='24'}">selected</c:if>>도봉구</option>
				<option value="19"<c:if test="${region=='19'}">selected</c:if>>동대문구</option>
				<option value="6"<c:if test="${region=='6'}">selected</c:if>>동작구</option>
				<option value="12"<c:if test="${region=='12'}">selected</c:if>>마포구</option>
				<option value="16"<c:if test="${region=='16'}">selected</c:if>>서대문구</option>
				<option value="8"<c:if test="${region=='8'}">selected</c:if>>서초구</option>
				<option value="14"<c:if test="${region=='14'}">selected</c:if>>성동구</option>
				<option value="21"<c:if test="${region=='21'}">selected</c:if>>성북구</option>
				<option value="10"<c:if test="${region=='10'}">selected</c:if>>송파구</option>
				<option value="2"<c:if test="${region=='2'}">selected</c:if>>양천구</option>
				<option value="4"<c:if test="${region=='4'}">selected</c:if>>영등포구</option>
				<option value="13"<c:if test="${region=='13'}">selected</c:if>>용산구</option>
				<option value="20"<c:if test="${region=='20'}">selected</c:if>>은평구</option>
				<option value="17"<c:if test="${region=='17'}">selected</c:if>>종로구</option>
				<option value="18"<c:if test="${region=='18'}">selected</c:if>>중구</option>
				<option value="22"<c:if test="${region=='22'}">selected</c:if>>중랑구</option>
		</select>

      
    
    <!-- 여행일정 -->
    	<!-- 가는날 -->
 
    		<input type="text" class="datepicker" value="${startDate}" id="startDate" name="startDate" size=10 maxlength=10 style="width:150px;" placeholder=" 시작일">

    	<!-- 오늘날 -->

	     	<input type="text" class="datepicker" value="${endDate}" id="endDate" name="endDate" size=10 maxlength=10 style="width:150px" placeholder=" 종료일">

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
	<!-- 버튼-->
		<div class="button_col" align="right">
			<input class="btn btn-dark" type="button" value="초기화" onclick="location.href='myroute_editRoute.do?route_no=${getRoute.route_no}'" style="width:70px">
	    	<input class="btn btn-dark" type="button" value="저장" onclick="route_check()" style="width:70px">
	    </div>
	    
    </div>
    </div>
    
   </div>
</section>

<!-- 2번 filter -->
<div class="album py-5">
<div class="container">
	
	<!-- 찜목록 -->	
      		
<br>

      <div class="row" style="margin-top:10px">

        <div class="col-6">
        <img src="resources/img/korea_seoul (2).png" style="margin-top:-35px; margin-left:-18px">
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width:100%;height:350px;">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/img/healing.png" class="d-block w-100" alt="..." style="width:500px;height:350px;">
    </div>
    <div class="carousel-item">
      <img src="resources/img/food.png" class="d-block w-100" alt="..." style="width:500px;height:350px;">
    </div>
    <div class="carousel-item">
      <img src="resources/img/culture.png" class="d-block w-100" alt="..." style="width:500px;height:350px;">
    </div>
        <div class="carousel-item">
      <img src="resources/img/sight.png" class="d-block w-100" alt="..." style="width:500px;height:350px;">
    </div>
        <div class="carousel-item">
      <img src="resources/img/shopping.png" class="d-block w-100" alt="..." style="width:500px;height:350px;">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
        </div>
        
        <div class="col-6">
        	<h3 class="pb-4 mb-4 border-bottom" align="left">즐겨찾기</h3>
	        <div style="overflow:auto; height:300px;">
		        <c:if test="${empty favorite}">
					<img src="resources/img/favori_route.png" style="align:middle; margin-left:140px;" >
		        </c:if>
		        <c:if test="${not empty favorite}">
			        <c:forEach var="fa" items="${favorite}">
			
				          <button class="btn btn-outline-dark border-opacity-25" type="submit" style="margin-right:10px;margin-left:30px; margin-bottom:16px;height:50px;"
				          id="favoritebtn" name="favoritebtn" formaction="edit_addList.do?tour_no=${fa.tour_no}">	    
				            <div class="mx-auto" style="width: 130px; height:35px;">
				            	<small class="mx-auto">${fa.tour_name}</small>
				            </div> 
				          </button>
					
			        </c:forEach>
		        </c:if> 
	        </div>
        </div>
      </div>
      <br>
			<!-- 여행지 검색 -->
			<div class="row" style="margin-top:-30px">
			<div class="col">
			
			<div class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4" style="margin-top:60px">
			<h3 style="align:left;" > 여행지 검색</h3>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center" style="margin-left:-500px; margin-top: 50px">
				<select class="form-select" style="width:80px;"name="searchType" id="searchType" onchange="searchFilter()" >
					<option value="0" selected>목록</option>
					<option value="1" <c:if test="${searchType=='1'}">selected</c:if>>문화</option>
					<option value="2" <c:if test="${searchType=='2'}">selected</c:if>>명소</option>
					<option value="3" <c:if test="${searchType=='3'}">selected</c:if>>자연</option>
					<option value="4" <c:if test="${searchType=='4'}">selected</c:if>>음식</option>
					<option value="5" <c:if test="${searchType=='5'}">selected</c:if>>숙소</option>
				</select>
					<input type="text" class="ms-2" name="keyword" style="width:200px; height:36px">
					<button class="btn btn-outline-success btn-sm ms-2" style="width:80px;height:36px" type="submit" formaction="tourFind.do">GO!</button>
			</div>
			</div>
			<hr>
		
			<!-- 검색결과 -->
			<div style="overflow:auto; height:300px">
			<c:if test="${empty findList}">
				<img src="resources/img/tour_route.png" style="align:middle; margin-left:470px;" >
			</c:if>
			<c:if test="${not empty findList}">
				<c:forEach var="fdto" items="${findList}">	
				
					<button class="btn btn-outline-dark" style=" height:80px; margin-bottom:10px"type="submit" id="tourbtn" name="tourbtn" formaction="edit_addList.do?tour_no=${fdto.tour_no}">	    
					  	<div class="row mx-auto" style="width: 220px; height:80px;">
						  <div class="col-md-3">
						  	<img src="resources/img/1.jpg" style="width:50px; height:50px;">
						  </div>
						  <div class="col-md-9 ps-4">
							<p>${fdto.tour_name}</p>
						  </div>
						</div> 
					</button>
				
				</c:forEach> 
			</c:if>
			</div>
			
			</div>
			</div>
	<br><br><br>
	
	
	
			<div class="row">
			<h3 class="pb-4 mb-4 border-bottom" align="left">일정 만들기</h3>
			
			<div class="col">
				
			<div class="container" style="overflow:auto; height:400px; ">
		   		<c:if test ="${empty editRoute}">
		   			<img src="resources/img/make_route.png" style="align:middle; margin-top:80px;margin-left:80px;width:300px" >  		
		   		</c:if>
		   		<c:if test ="${not empty editRoute}">
			   		<c:forEach var="rdto" items="${editRoute}">
			   		<br>
			   		
			   		<div class="border border-dark rounded border-opacity-25" style="width: 500px; height:100px;margin-left:50px" >
						<div class="col" align="center">
							<div class="row flex-nowrap justify-content">
							<div class="col-2 text-center"></div>
							<div class="col-8 text-center">
								<p class="fw-bold" id="spot_info" style="margin-top:10px">${rdto.getTour_name()}</p>
							</div>
							
							<div class="col-2 d-flex justify-content-end align-items-center">
								<button class="btn" type="submit"   formaction ="edit_delList.do?tour_no=${rdto.getTour_no()}" style="margin-top:-10px">
									<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
					  					<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
									</svg>
								</button>
							</div>
							</div>
						</div>
						<div class="row" >
							<div class="col" align="center">
							<small class="fw-light" id="addr">${rdto.getTour_addr()}</small>
							</div>
								
						</div> 
					</div>
					
			   		</c:forEach>
			   		
		   		</c:if>
			  </div>
			</div>
			
			<div class="col">
				<div id="map" style="width:100%;height:550px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>				        
					<!-- api는 head, body 상관없지만 코드 실행보다는 먼저 선언 -->	
					<%@ include file ="edit_kakaoMap.jsp" %>
					
		  	</div>
		  				
			</div>
	

	
</div>
</div>
	
</form>
</form>
</div>
</main>
</body>
<%@ include file="../bottom.jsp"%>