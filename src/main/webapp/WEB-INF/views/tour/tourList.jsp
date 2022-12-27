<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
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
	

	<!-- 여행지 리스트 -->
	<c:if test="${empty tourList}">
		<div class="d-flex justify-content-center mt-5 mb-5">
		<p class="text-muted">
			등록된 여행지가 없습니다.
		</p>
		</div>
	</c:if>
	<div class="tourrow row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">
		 
		<c:forEach var="tdto" items="${tourList}">
			<!-- 여행지 -->
			<div class="tourcol col ${tdto.tour_type}">
				<a onclick="valueSetting('${tdto.tour_no}', '${tdto.tour_name}','${tdto.tour_postal}','${tdto.tour_addr}','${tdto.tour_hp}')"
					data-bs-toggle="modal" data-bs-target="#tourView">
			    	<div class="card h-100 card border-success mb-3  card text-bg-light mb-3" >
			    		<!-- 여행지 이미지 -->
				    	<img src="resources/img/seoul2.jpg" class="card-img-top" alt="..."
				    		style="width:100%; height:20vw; object-fit:cover;">
						<!-- 여행지 -->
			    		<div class="tour-card-body card-body  ">
					      	<!-- 이름 -->
					        <h5 class="card-title  ">${tdto.tour_name}</h5>
					        
				        	<!-- 주소 -->
					        <c:choose>
						        <c:when test="${fn:length(tdto.tour_addr) gt 26}">
						        	<p class="card-text text-success">${fn:substring(tdto.tour_addr, 0, 25)}...</p>
						        </c:when>
						        <c:otherwise>
							        <p class="card-text text-success">${tdto.tour_addr}</p>
						        </c:otherwise>
							</c:choose>
						</div>
    				</div>
   				</a>
			</div>
		</c:forEach>
	</div>
	

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
			     			 <p><img src="resources/icon/geo-alt.svg">이름: <input class="name" style="background-color:transparent;border:0; solid black;" spellcheck="false"  readonly /></p>
			     			 <p><img src="resources/icon/clock.svg">우편번호: <input class="postal" style="background-color:transparent;border:0; solid black;" spellcheck="false" readonly  /></p>
			     			 <p><img src="resources/icon/telephone.svg"> 전화번호: <input class="hp" style="background-color:transparent;border:0; solid black;" spellcheck="false" readonly /></p>
			     			 <p><img src="resources/icon/clock.svg"> 주소: <textarea class="addr"  spellcheck="false" style="border:none" spellcheck="false" readonly rows="3"	></textarea></p>
		    			</div>
		 		 	</div>
				</div>
		        &nbsp;&nbsp;
		      </div>
		      
				<!-- Modal footer -->
				<div class="routes modal-footer">
					<!-- 이 여행지가 포함된 루트-->
					<div class="container text-center">
						<h5>이 여행지가 포함된 여행루트</h5>
						<div class="container text-center">
							<div class="row mt-2">
								<div class="col ">
										<div class="container">	
											<div class="card h-100">
											<!-- 맵0 -->
												<div id="map0" style="width:100%;height:450px;"></div>
												</div>
												<div class="card-text">
													<div class="d-grid gap-2">
														<a id="name0" href="routeList.do" class="btn btn-secondary btn-sm">
															<!-- 여행루트 제목 -->&nbsp;
														</a>
													</div>
												</div>
											</div>
										</div>
									<div class="col ">
										<div class="container">	
											<div class="card h-100">
											<!-- 맵1 -->
												<div id="map1" style="width:100%;height:450px;"></div>
												</div>
												<div class="card-text">
													<div class="d-grid gap-2">
														<a id="name1" href="routeList.do" class="btn btn-secondary btn-sm">
															<!-- 여행루트 제목 -->&nbsp;
														</a>
													</div>
												</div>
											</div>
										</div>
									<div class="col ">
										<div class="container">	
											<div class="card h-100">
											<!-- 맵2 -->
												<div id="map2" style="width:100%;height:450px;"></div>
												</div>
												<div class="card-text">
													<div class="d-grid gap-2">
														<a id="name2" href="routeList.do" class="btn btn-secondary btn-sm">
															<!-- 여행루트 제목 -->&nbsp;
														</a>
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
	</div>
</div>

<div class="d-flex justify-content-center mt-3 ">
	<nav aria-label="Page navigation example  " >
			<ul class="pagination">
		<c:if test="${not empty tourList}">	
			<c:if test="${startPage > pageBlock}">
			<li class="page-item"><a class="page-link"  
				 href="tourList.do?pageNum=${startPage-1}&tourType=${tourType}&region=${region}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item">	<a class="page-link" href="tourList.do?pageNum=${i}&tourType=${tourType}&region=${region}">${i}</a>
			</li>
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				<li class="page-item">
				<a class="page-link"
				 href="tourList.do?pageNum=${endPage+1}&tourType=${tourType}&region=${region}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>
			</c:if>
		</c:if>
		</ul>
		</nav>
	</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dfa24ca49ecafb1d1c5352143d4a441&libraries=services,clusterer,drawing"></script>

<script>

</script>

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
        		$("#favoriteStar").attr("src", "resources/icon/star-fill3.svg" );
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

//각 여행지 눌렀을 때 해당 dto값을 모달영역에 띄워주는 함수
function valueSetting(no, name, postal, addr, hp){
	//모달input에 dto값 설정
	$('.no').attr("value", no);
	$('.name').attr("value", name);
	$('.postal').attr("value", postal);
	$('.addr').val(addr);
	$('.hp').attr("value", hp);	
	
	//즐겨찾기 여부 확인
	checkFavorite();

	//초기 지도 삭제
	for(var i=0; i<3; i++){
		var mapContainer = document.getElementById('map' + i);
		mapContainer.innerText = '';
	}
	
	// 이 여행지가 포함된 여행루트 - 초기 지도 만들기
	for(var i=0; i<3; i++){
		var mapContainer = document.getElementById('map' + i) // 지도를 표시할 div
		mapOption = {
		center: new kakao.maps.LatLng(37.6562677764281, 127.063030448739), // 지도의 중심좌표(노원역)
			 level: 6 // 지도의 확대 레벨
		};  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	}
	
	
	// 지도에 좌표 찍기
	loadRoute(no);
}
</script>


<script>
   function searchFilter(event){
       const tourType = $("#filterByType option:selected").val();
       location.href="tourList.do?pageNum=1&tourType="+tourType+"&region=${region}"
       
   }
</script>

<script>
	function setList(route, i, map){
		var addrArr=[];
		var infoArr=[];
		var list =[];
		list =route;
		for(var i in route){
			addrArr.push(route[i].tour_addr);
			infoArr.push(route[i].tour_name);
		}
	
	
	//주소-좌표 변환 메소드
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소-좌표 변환
	addrArr.forEach(function(address, index) {
	    geocoder.addressSearch(address, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	//좌표 받기
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            //positions라는 객체에 info와 좌표 담기
	            var positions=[{
	            	content:'<div style="width:200px; height:50px; padding:5px;">'+infoArr[index]+'</div>',
					latlng: coords,
					
	            }];
	            
	            //마커 찍기
	            for(var i=0; i<positions.length; i++){
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: positions[i].latlng,
			            clickable: true
			        });
			        
	  
	            var infowindow = new kakao.maps.InfoWindow({
		            content: positions[i].content
		        });
	         	
	            //마커에 마우스를 놓으면 인포윈도우 보여짐
	            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	           
	         	//인포윈도우 사라짐
	            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	            
	           	//마커를 누르면 카카오맵 이동
	      		var lat = positions[i].latlng.Ma;
	         	var lng = positions[i].latlng.La;
	            kakao.maps.event.addListener(marker, 'click', function(){
	      		//새창으로 띄우는 것 새창없이 하려면 location.href=으로 변경
	            window.open("https://map.kakao.com/link/map/"+infoArr[index]+","+lat+","+lng+"");
	      		
	            });
			
	           	//마커들이 지도에 한 번에 보여지도록 
		        map.relayout();
	           	marker.setMap(map);
	           
	            };
	           	
	        
	     		   }
	 		   });
			});
			
	
	
	var bounds = new kakao.maps.LatLngBounds();
	var linePath = [];
	
	var polyline = new kakao.maps.Polyline({
	    path: linePath,
	    strokeWeight: 3,
	    strokeOpacity: 1,
	    strokeColor: 'red',
	    strokeStyle: 'solid'
	});
	
	const addressSearch = address => {
	    return new Promise((resolve, reject) => {
	        geocoder.addressSearch(address, function(result, status) {
	            if (status === kakao.maps.services.Status.OK) {
	                resolve(result);
	            } else {
	                reject(status);
	            }
	        });
	    });
	};
	
	(async () => {
	    try {
	        for(var address of addrArr) {
	            const result = await addressSearch(address);
	            setPolyLine(result);
	        }
	    } catch (e) {
	        console.log(e);
	    }
	})();
	
	
	function setPolyLine(result) {
	    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    linePath.push(coords);
	    polyline.setPath(linePath);
	    bounds.extend(coords);
	    map.relayout();
		map.setBounds(bounds);
	    
	    if(!polyline.getMap()) {
	        polyline.setMap(map);
	    }
	}
	}
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>

<script>
function loadRoute(no){
	var no = no;
		
	$.ajax({
		url: 'getIncludeRouteKakao.do',
	 	type: 'POST',
	 	data: {no: no},
	 	success: function(data){
	 		var routeArr = data.routeView;
	 		var routeNameArr = data.routeName;

	 		for(var i=0; i<routeArr.length; i++){
	 			var route = routeArr[i];
	 			var route_name = routeNameArr[i];
	 			
	 			$('#name'+i).text(route_name);
	 			
	 			var mapContainer = document.getElementById('map' + i), // 지도를 표시할 div 
	 			mapOption = {
	 			center: new kakao.maps.LatLng(37.6562677764281, 127.063030448739), // 지도의 중심좌표(노원역)
	 				 level: 6 // 지도의 확대 레벨
	 			};  
	 					
	 			// 지도를 생성합니다
	 			var map = new kakao.maps.Map(mapContainer, mapOption); 
	 			
	 			
	 			setList(route, i, map);	
	 		}
	 	},
	 	error: function(){
	 		alert("error");
	 	}
	  });
}

</script>
    
<%@ include file="../bottom.jsp"%>