<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- api키와 지도를 형성하는 <div id="map">은 지도를 넣고 싶은 위치에 넣기 -->
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.6562677764281, 127.063030448739), // 지도의 중심좌표(노원역)
			        level: 5 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			$('#searchbtn').click(function(){
			var address = document.getElementById('addre');//위의 카드 부분에 addr가 쓰이고 있어서 검색창은 addre
			var info=document.getElementById('spot_info');
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(address.value, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			    	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						var positions=[{
							content: '<div>'+info.innerHTML+'</div>',
							latlng: coords
						}];//객체 생성
						
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        for(var i=0; i<positions.length; i++){
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: positions[i].latlng,
				            clickable: true
				        });
				        
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: positions[i].content
				        });
				        kakao.maps.event.addListener(marker, 'click', marker_click(map, marker, infowindow));
				    	
				        
				        //좌표 확인
				        console.log(coords);
				        }
				
						//선 그리기 위한 배열로 담겨진 경로(일단은 정해진 지역만 연결하기)
						var linePath=[
							new kakao.maps.LatLng(37.6562677764281, 127.063030448739),//노원역
							new kakao.maps.LatLng(37.6545190418039, 127.056297212439),//노원구청(노원구 노해로 437)
							new kakao.maps.LatLng(37.6485819883224, 127.063115737673),//상계백병원(동일로 1342)

							];
					
					 	//선 그리기
						var polyline = new kakao.maps.Polyline({
					 	    path: linePath, // 선을 구성하는 좌표배열 입니다
					 	    strokeWeight: 5, // 선의 두께 입니다
					 	    strokeColor: 'red', // 선의 색깔입니다
					 	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					 	    strokeStyle: 'solid' // 선의 스타일입니다
					 	});

				 	// 지도에 선을 표시합니다 
				 	polyline.setMap(map);  
						};
					
			
				        //마커를 누르면 장소명이 뜸(이 부분은 추후에 디테일하게 바꿔야함..)
				        function marker_click(map, marker, infowindow){ 	 
				        	return function() {
				        	infowindow.open(map, marker);
				        	};
				        	}

				});    
				});
				</script>
			   