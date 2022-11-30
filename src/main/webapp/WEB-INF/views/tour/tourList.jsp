<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../top.jsp"%>


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
           <a class="visually-hidden-focusable" href="#content"> <div class="col-12 col-md-1 mb-1" disabled>
               <input type="text" class="form-control" placeholder="Search cards" aria-label="Search cards"
                   onkeyup="searchFilter()">
           </div>
           </a>
	</div>
	
	<!-- row -->
	<div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">
		<c:forEach var="tdto" items="${tourList}">
		  <div class="col ${tdto.tour_type}">
			  <a data-bs-toggle="modal" data-bs-target="#tourView">
			    <div class="card h-100">
			      <img src="resources/img/111.jpeg" class="card-img-top" alt="..."
			      style="width:100%   ; height:20vw ; object-fit:cover;">
			      <div class="card-body">
			        <h5 class="card-title">${tdto.tour_name}</h5>
			        <p class="card-text">This is a short card.</p>
			      </div>
			    </div>
			  </a>
		  </div>
	  	</c:forEach>

	</div>
	<!-- 상세페이지 모달 -->
	<div class="modal fade" id="tourView">
	 	<div class="modal-dialog">
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
	    			<div class="col-sm-3 col-md-6">
	     				 <p><img src="resources/img/k1.jpg" class="rounded float-start" alt="" width="100%" height="260"></p>
	    			</div>
	   			 <div class="col-sm-9 col-md-6">
	     			 <p><img src="resources/icon/geo-alt.svg"> 경 복 궁</p>
	     			 <p><img src="resources/icon/clock.svg"> 매일 09:00 ~ 17:00</p>
	     			 <p><img src="resources/icon/telephone.svg"> 02-3700-3900</p>
	     			 <p><img src="resources/icon/house-door.svg"> <a href ="http://www.royalpalace.go.kr/">http://www.royalpalace.go.kr/</a></p>
	     			 <p><img src="resources/icon/shop-window.svg"> 주차</p>
	     			 <p><img src="resources/icon/file-earmark-text.svg"> 내용</p>
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
					<div class="col 맛집">
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
					<div class="col 관광">
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
					<div class="col 숙소">
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
		</div>
		</div>
	</div>
</div>
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
    <script>    
    </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<%@ include file="../bottom.jsp"%>