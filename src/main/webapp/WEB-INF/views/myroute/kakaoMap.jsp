<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			$('#searchbtn').click(function(){
			var address = document.getElementById('addre');
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
				        
				        }
				        function marker_click(map, marker, infowindow){ 	 
				        	return function() {
				        	infowindow.open(map, marker);
				        	};
				        	}
				        
					// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

						var linePath=[];
						
				   // 지도에 표시할 선을 생성합니다
				   var polyline = new kakao.maps.Polyline({
				       path: linePath, // 선을 구성하는 좌표배열 입니다
				       strokeWeight: 5, // 선의 두께 입니다
				       strokeColor: '#FFAE00', // 선의 색깔입니다
				       strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				       strokeStyle: 'solid' // 선의 스타일입니다
				   });

				   // 지도에 선을 표시합니다 
				   polyline.setMap(map);  
				   }


				});    
				});
				</script>
			   