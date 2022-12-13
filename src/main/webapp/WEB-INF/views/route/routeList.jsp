<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tour.jsp -->
<%@ include file="../top.jsp"%>

<div class="container-md">
	<!-- 여행루트 분류 -->
	<div class="row mt-2">
		<div align="right">
		<div class="col-12 mb-2 col-md-2" style="float:right" >
          <select class="form-select" id="filterByRoote" onchange="searchFilter()">
             <option value="" selected >여행루트목록</option>      
             <option value="숙소">숙소</option>
             <option value="맛집">맛집</option>
             <option value="관광">관광</option>
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
	  <div class="col 숙소">
	  	<a data-bs-toggle="modal" data-bs-target="#routeView">
		    <div class="card h-100">
		      <img src="resources/img/111.jpeg" class="card-img-top" alt="..."
		      style="width:100%   ; height:20vw ; object-fit:cover;">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a short card.</p>
		      </div>
		    </div>
	  	</a>
	  </div>
	  <div class="col 맛집">
		    <div class="card h-100">
                    <img src="resources/img/222.jpeg" class="card-img-top"
                        style="width:100% ; height:20vw ; object-fit:cover;" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">양천구</h5>
                        <p class="card-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Architecto, maxime.
                        </p>                      
                    </div>
                </div>
		  </div>
	  <div class="col 관광">
		    <div class="card h-100">
                    <img src="resources/img/333.jpeg" class="card-img-top"
                        style="width:100% ; height:20vw ; object-fit:cover;" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">구로구</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia molestiae
                            suscipit nesciunt. Error, quas nihil.</p>                      
                    </div>
                </div>
	  </div>
	  <div class="col 숙소">
	    <div class="card h-100">
	      <img src="resources/img/444.jpeg" class="card-img-top" alt="..."
	      	style="width:100%   ; height:20vw ; object-fit:cover;"														>
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 상세페이지 모달 -->
	<div class="modal fade" id="routeView">
 	<div class="modal-dialog modal-lg modal-dialog-scrollable">
	    <div class="modal-content">
	      	
			<!-- Modal body -->
			<div class="modal-body">
				<div class="container text-center">
			  		<div class="row">
			  			<!-- 좌측페이지 -->
			    		<div class="col-lg-6">
			    			<h2 align="left"><a href="#" id="favorite" title="즐겨찾기 등록"><img src="resources/icon/star-fill.svg"></a> 경복궁 여행일지</h2>
				<!-- 사진 -->
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="resources/img/k3.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/k2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/k1.jpg" class="d-block w-100" alt="...">
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
				<br>
			<!-- 글내용 -->
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" readonly>글내용</textarea>
				<p align="right">#서울#경복궁</p>
			<!-- 지도에서 경로보기 -->
				<h5	align="left">추천 여행경로</h5>
					<div class="card" style="width:100%" >
						<img class="card-img-top" src="resources/root/root2.png" alt="Card image" style="width:100%">
							<div class="card-text">
								<div class="d-grid gap-2">
									<a href="routeTraffic.do" class="btn btn-secondary btn-sm">내 위치에서 경로찾기</a>
								</div>
							</div>
					</div>	
			</div>			
			<!-- 우측페이지 -->
    		<div class="col">
    			<h2 align="left">리뷰</h2>
      			<div class="mb-3">
      			
      			<form  action="insert_review.do" method="post">
      			<label>평점 : </label>
      			<select name="review_star">
      			 <option value="★☆☆☆☆">★☆☆☆☆</option>
      			 <option value="★★☆☆☆">★★☆☆☆</option>
      			 <option value="★★★☆☆">★★★☆☆</option>
      			 <option value="★★★★☆">★★★★☆</option>
      			 <option value="★★★★★">★★★★★</option>
                 </select>
					<textarea class="form-control" name="review_content" rows="7"></textarea><br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  					<input class="btn btn-primary" type="submit" value="등록">
					</div>
					</form>
					</div><br><br>
			<!--내가 등록한 리뷰? --> 
				<h5	align="left">내가 등록한 리뷰?</h5>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" readonly>내가 등록한 리뷰?	</textarea><br><br>
			<!-- 리뷰목록 -->
				<h5	align="left">리뷰목록</h5>
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">NO.</th>
				      <th scope="col">Writer</th>
				      <th scope="col">Review</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="2"  readonly>리뷰</textarea></td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Jacob</td>
				       <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>리뷰</textarea></td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>Thornton</td>
				       <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>리뷰</textarea></td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>David</td>
				       <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>리뷰</textarea></td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>Maria</td>
				       <td><textarea class="form-control" id="exampleFormControlTextarea1" rows="2" readonly>리뷰</textarea></td>
				    </tr>
				  </tbody>
				</table>
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