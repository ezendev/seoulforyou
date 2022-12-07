<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- api키와 지도를 형성하는 <div id="map">은 지도를 넣고 싶은 위치에 넣기 -->
				<script>
			
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.6562677764281, 127.063030448739), // 지도의 중심좌표(노원역)
			        level: 6 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			//일정에 담기 리스트 불러오기
			var route ='${myRoute}';
			var addrArr=[]; //주소 담을 배열
			var infoArr=[]; //info 담을 배열
			var markers=[];	//마커 담을 배열
			var linePath=[]; //라인 그릴 좌표 담음 배열

			//controller에 myRoute불러오기
			<c:forEach items='${myRoute}' var='rdto'>
					var info ='${rdto.getTour_name()}'; 
					var address ='${rdto.getTour_addr()}';
					addrArr.push(address);
					infoArr.push(info);
			</c:forEach>
			
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
			            	content: '<div>'+infoArr[index]+'</div>',
							latlng: coords
			            }];
			            
			            //마커 찍기
			            for(var i=0; i<positions.length; i++){
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: positions[i].latlng,
					            clickable: true
					        });
				            map.setCenter(coords);
					        markers.push(marker);
					        
					      
			            
			            var infowindow = new kakao.maps.InfoWindow({
				            content: positions[i].content
				        });
				        kakao.maps.event.addListener(marker, 'click', marker_click(map, marker, infowindow));
						
				        addLine(markers);
				        console.log(markers);
			          		  };
			     		   }
			 		   });
					});
						
			         function addLine(markers){
			        	 markers.forEach(function(marker, index){
							var linePath=[];
			        		 for(var j=0; j<markers.length; j++){							
								linePath.push(markers[j].getPosition());   
							}
			        		 
				        
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
								        
			           		})
			        	 }
			
			
				//마커를 누르면 장소명이 뜸(이 부분은 추후에 디테일하게 바꿔야함..)
		        function marker_click(map, marker, infowindow){ 	 
		        	return function() {
		        	infowindow.open(map, marker);
		        			};
		        	}  	  
					      
				
				</script>