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
			
				
			function setList(route){
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