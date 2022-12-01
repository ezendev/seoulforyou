<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../top.jsp"%>
<!-- 임시 스타일 -->
<head>
	<style>
		input{
			border: none;
		}
	</style>
</head>

<!-- 모달에 각 tour dto값을 전달하기 위한 폼 -->
<form id="f" name="f" action="tour.php" method="post">
	<input type="hidden" name="name" value=""/>
	<input type="hidden" name="postal" value=""/>
	<input type="hidden" name="addr" value=""/>
	<input type="hidden" name="hp" value=""/>
	<input type="hidden" name="open_time" value=""/>
	<input type="hidden" name="open_day" value=""/>
	<input type="hidden" name="close_day" value=""/>
	<input type="hidden" name="traffic" value=""/>
</form>

<div class="container-md">
	<!-- 여행지 분류 -->
	<div class="row mt-2">
		<div align="right">
			<div class="col-12 mb-3 col-md-2" style="float:right" >
	          <select class="form-select" id="filterByRoote" onchange="searchFilter()">
	             <option value="" selected >여행지목록</option>      
	             <option value="1">문화</option>
	             <option value="2">명소</option>
	             <option value="3">자연</option>
	             <option value="4">음식</option>
	             <option value="5">숙소</option>
	          </select>
			</div>
		</div>
		<a class="visually-hidden-focusable" href="#content">
	       	<div class="col-12 col-md-1 mb-1" disabled>
	       		<input type="text" class="form-control" placeholder="Search cards" aria-label="Search cards" onkeyup="searchFilter()">
	        </div>
        </a>
	</div>
	
	<!-- 여행지 리스트 -->
	<div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">
		<c:forEach var="tdto" items="${tourList}">
			<!-- 여행지 -->
			<div class="col ${tdto.tour_type}">
				<a onclick="valueSetting('${tdto.tour_name}','${tdto.tour_postal}','${tdto.tour_addr}','${tdto.tour_hp}'
											,'${tdto.tour_open_time}','${tdto.tour_open_day}','${tdto.tour_close_day}','${tdto.tour_traffic}')"
					data-bs-toggle="modal" data-bs-target="#tourView">
			    	<div class="card h-100">
			    		<!-- 여행지 이미지 -->
				    	<img src="resources/img/111.jpeg" class="card-img-top" alt="..."
				    		style="width:100%; height:20vw; object-fit:cover;">
						<!-- 여행지 -->
			    		<div class="card-body">
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
			     			 <p><img src="resources/icon/geo-alt.svg">이름: <input id="name" style="display:none"></p>
			     			 <p><img src="resources/icon/clock.svg">우편번호: <input id="postal" style="display:none"></p>
			     			 <p><img src="resources/icon/clock.svg"> 주소: <input id="addr" style="display:none"></p>
			     			 <p><img src="resources/icon/telephone.svg"> 전화번호: <input id="hp" style="display:none"></p>
			     			 <p><img src="resources/icon/house-door.svg"> 운영시간: <input id="open_time" style="display:none"></p>
			     			 <p><img src="resources/icon/house-door.svg"> 운영요일: <input id="open_day" style="display:none"></p>
			     			 <p><img src="resources/icon/house-door.svg"> 휴무일: <input id="close_day" style="display:none"></p>
			     			 <p><img src="resources/icon/shop-window.svg"> 교통정보: <input id="traffic" style="display:none"></p>
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

</div>


<script>

// 각 여행지 눌렀을 때 해당 dto값을 히든 폼에 넣고 모달영역에 띄워주는 함수
function valueSetting(name, postal, addr, hp, open_time, open_day, close_day, traffic){
	//폼에 dto값 업데이트
	document.f.name.value = name;
	document.f.postal.value = postal;
	document.f.addr.value = addr;
	document.f.hp.value = hp;
	document.f.open_time.value = open_time;
	document.f.open_day.value = open_day;
	document.f.close_day.value = close_day;
	document.f.traffic.value = traffic;
	
	//모달영역에 폼 안의 값 설정
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
        var searchFilter =()=> {
            let selectedColor = document.getElementById("filterByRoote").value;
            console.log(selectedColor);
            const input = document.querySelector(".form-control");
            const cards = document.getElementsByClassName("col");
            console.log(cards[1])
            let textBox = input.value;
            for (let i = 0; i < cards.length; i++) {
                let title = cards[i].querySelector(".card-body");
                if ((cards[i].classList.contains(selectedColor) || selectedColor=="") && title.innerText.toLowerCase().indexOf(textBox.toLowerCase()) > -1) {
                    cards[i].classList.remove("d-none");
                } else {
                    cards[i].classList.add("d-none");
                }
            }
        }
    </script>
    
<%@ include file="../bottom.jsp"%>