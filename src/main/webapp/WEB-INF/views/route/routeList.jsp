<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tour.jsp -->
<%@ include file="../top.jsp"%>

<div class="container-md">
	<!-- 여행루트 분류 -->
	<div class="row mt-2">
		<div align="right">
		<div class="col-12 mb-2 col-md-2" style="float:right" >
          <select class="form-select" id="filterByType" onchange="searchFilter()">
             <option value="0" <c:if test="${routeType=='0'}"> selected </c:if> >여행루트목록</option>      
             <option value="1" <c:if test="${routeType=='1'}"> selected </c:if>>힐링</option>
             <option value="2" <c:if test="${routeType=='2'}"> selected </c:if>>미식</option>           
             <option value="3" <c:if test="${routeType=='3'}"> selected </c:if>>한류</option>           
             <option value="4" <c:if test="${routeType=='4'}"> selected </c:if>>명소</option>           
             <option value="5" <c:if test="${routeType=='5'}"> selected </c:if>>쇼핑</option>           
          </select>
		</div>
		</div>
	</div>
	
	<form id="routeForm" name="f1" method="post" action="routeList.do">
      <input type="hidden" id="routeType" name="routeType">
   </form>
	
	<!-- row -->
	<div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 row-cols-sm-2 g-4 mx-0">	   
	  	  <c:forEach var="rdto" items="${listRoute}">	    
	  	  <div class="col 숙소">
	  		<a onclick="valueSetting('${rdto.route_readcount}','${rdto.route_no}', '${rdto.route_subject}','${rdto.route_img}','${rdto.route_content}','${rdto.route_hashtag}')" 	
	  	 	data-bs-toggle="modal" data-bs-target="#routeView"> 	  	 
			    <div class="card h-100">
			      <img src="resources/img/seoul2.jpg" class="card-img-top" alt="..."
			      style="width:100%; height:20vw ; object-fit:cover;">
			      <div class="card-body">
			        <h5 class="card-title">${rdto.route_subject}</h5>
			        <p class="card-text">#${rdto.route_hashtag}</p>
			      </div>
			    </div>					  		
	  		</a>	  	  	
	  	   </div>	 
	  	 </c:forEach>
	  </div>
	</div>
	
	<!-- 상세페이지 모달 -->
	<div class="modal fade" id="routeView">
 	<div class="modal-dialog modal-lg modal-dialog-s crollable">
	    <div class="modal-content">
	      	
			<!-- Modal body -->
			<div class="modal-body">
				<div class="container text-center">
			  		<div class="row">
			  			<!-- 좌측페이지 -->
			    		<div class="col-lg-6">
			    			
			    			<h2 align="left" ><a href="#" id="favorite" title="즐겨찾기 등록"><img src="resources/icon/star-fill.svg"></a><input  class="route_subject" ></h2>
							<input class="route_no">
							<input class="route_readcount">
							<!-- 사진 -->				
							<div>				    
							  <img id="thumbnail" class="d-block w-100 " >
							</div>
				<br>
			<!-- 글내용 -->
				<p><textarea class="form-control route_content"  id="exampleFormControlTextarea1" rows="10" readonly></textarea></p>
				<p align="right"><input  class="route_hashtag"></p>
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
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="7"></textarea><br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  					<button class="btn btn-primary" type="submit">Button</button>
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

<div class="d-flex justify-content-center mt-3">	
<c:if test="${not empty listRoute}">			
			<c:if test="${startPage > pageBlock}">
				[<a href="routeList.do?pageNum=${startPage-1}&routeType=${routeType}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="routeList.do?pageNum=${i}&routeType=${routeType}">${i}</a>]
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				[<a href="routeList.do?pageNum=${endPage+1}&routeType=${routeType}">다음</a>]
			</c:if>		
			</c:if>
	</div>


    <script>
    function valueSetting(route_readcount,route_no,route_subject, route_img, route_content,route_hashtag){
	//모달input에 dto값 설정
	$('.route_readcount').attr("value", route_readcount);	
	$('.route_no').attr("value", route_no);	
	$('.route_subject').attr("value", route_subject);	
	$('.route_img').attr("value", route_img);
	$('.route_content').val(route_content);
	$('.route_hashtag').attr("value", route_hashtag);
	
	var upPath = $("#upPath").val();
	const no = route_no;
	
	$.ajax({
		  url: 'getReadcount.do',
		  type: 'POST',
		  data: {
	            no: no
	        },
		  success: function (data) {
			  $(".route_readcount").attr("value",data);
		    }
		  })
	
	
	$.ajax({
		  url: 'getTourImg.do',
		  type: 'POST',
		  data: {
	            no: no
	        },
		  success: function (data) {
			  $("#thumbnail").attr("src","/upload/"+data);
		    }
		  })
}
</script>
<script>
   function searchFilter(event){
       const routeType = $("#filterByType option:selected").val();
       $('#routeType').val(routeType);
       $('#routeForm').submit();
   }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<%@ include file="../bottom.jsp"%>