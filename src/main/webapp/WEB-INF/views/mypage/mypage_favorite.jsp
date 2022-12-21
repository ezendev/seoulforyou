<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- mypage_favorite.jsp -->
<%@ include file="mypage.jsp"%>

<style>
a {
  text-decoration: none;
  color: black;
}
</style>
<!-- 나의 즐겨찾기 페이지 -->
  <div class="wrapper col-md-9">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
       <section class="content-header">
          <h2 id="mypage_favorite" align="center">나의 즐겨찾기</h2>   
       </section>
       <div class="row mt-2">
		<div align="right">
			<div class="col-12 mb-3 col-md-2" style="float:right" >
	          <select class="form-select" id="hashtagFilter" onchange="hashtagFilter()">
	             <option value="여행지" <c:if test="${favorite_type=='여행지'}"> selected </c:if>>여행지</option>
	             <option value="여행루트" <c:if test="${favorite_type=='여행루트'}"> selected </c:if>>여행루트</option>
	          </select>
			</div>
		</div>
	</div>
	
	<form id="favoriteForm" name="f" method="post" action="mypage_favorite_list.do">
      <input type="hidden" id="favorite_type" name="favorite_type">
   </form>
    	<section class="content container-fluid">
          <div class="col-lg-12">
            <div class="box box-primary">
               <div class="box-body">
        
		        <!-- Main content -->
		      	<table class="table table-sm table-hover">
		         <tbody>
		         <c:if test="${favorite_type=='여행지'}">
		            <tr>
	            		<th style="width: 10%">NO</th>
		                <th style="width: 10%">이름</th>
		                <th style="width: 40%">주소</th>
		                <th style="width: 10%">전화번호</th>
		                <th style="width: 10%">삭제</th>
			            </tr>
			           <c:if test="${empty favTourList}">
						<tr>
							<td colspan="6">즐겨찾기된 여행지가 없습니다.</td>
						</tr>
				       </c:if>
				       <c:set var="num" value="${requestScope.num}"/>
				       <c:if test="${not empty favTourList}">
				          <c:forEach items="${favTourList}" var="dto">
			               	<tr>
			                	<td style="width: 10%">
			                		<c:out value="${num}"/>
			                		<c:set var="num" value="${num-1}"/>
			                	</td>
			                	<td style="width: 10%">${dto.tour_name}</td>
			                 	<td style="width: 40%">${dto.tour_addr}</td>
				             	<td style="width: 10%">${dto.tour_hp}</td>
			                 	<td style="width: 10%">
				                 	<button onclick="valueSetting('${dto.tour_no}', '${favorite_type}')" type="button" class="btn btn-light"  style="--bs-btn-padding-y: .2rem; --bs-btn-padding-x: .3rem;"  data-bs-toggle="modal" data-bs-target="#checkModal">
							   		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
			  						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
									</svg></button>
			                 	</td>
			             	 </tr>
			             	</c:forEach>
		            	</c:if>
	            	</c:if>
	            <c:if test="${favorite_type=='여행루트'}">
	            	<tr>
	            		<th style="width: 10%">NO</th>
		                <th style="width: 80%">제목</th>
		                <th style="width: 10%">삭제</th>
		            </tr>
		           <c:if test="${empty favRouteList}">
					<tr>
						<td colspan="6">즐겨찾기된 여행루트가 없습니다.</td>
					</tr>
			       </c:if>
			       <c:set var="num" value="${requestScope.num}"/>
			       <c:if test="${not empty favRouteList}">
			          <c:forEach items="${favRouteList}" var="dto">
		               	<tr>
		                	<td style="width: 10%">
		                		<c:out value="${num}"/>
		                		<c:set var="num" value="${num-1}"/>
		                	</td>
		                	<td style="width: 80%">#${dto.route_subject}</td>
		                 	<td style="width: 10%">
			                 	<button onclick="valueSetting('${dto.route_no}', '${favorite_type}')" type="button" class="btn btn-light"  style="--bs-btn-padding-y: .2rem; --bs-btn-padding-x: .3rem;"  data-bs-toggle="modal" data-bs-target="#checkModal">
						   		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
		  						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
								</svg></button>
		                 	</td>
		             	 </tr>
		             	</c:forEach>
	            	</c:if>
            	</c:if>
		          </tbody>
		         </table>
		        </div>
             </div>
            </div>
      <div class="d-flex justify-content-center mt-3">
      <form name="mpnext" method="get">
	     <div class="box-footer">
		    <div class="text-center">
		    <nav aria-label="Page navigation example" >
			<ul class="pagination">
		       <c:if test="${not empty favTourList}">
		       	<c:if test ="${startPage >pageBlock }">
		       	<li class="page-item"><a class="page-link"
		       		 href="mypage_favorite_list.do?pageNum=${startPage-1}" aria-label="Previous">
		       		 <span aria-hidden="true">&laquo;</span></a></li>
		       	</c:if>
		       	<c:forEach var ="i" begin="${startPage}" end="${endPage}">
		   <li class="page-item"><a class="page-link" href ="mypage_favorite_list.do?pageNum=${i}">${i}</a>
		   </li>
		       	</c:forEach>     	
		        <c:if test="${pageCount> endPage}">
		        	 <li class="page-item">
				<a class="page-link"
		        	href="mypage_favorite_list.do?pageNum=${endPage+1}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span></a></li>   
		       	</c:if>
		       </c:if>
		       <c:if test="${not empty favRouteList}">
		       	<c:if test ="${startPage >pageBlock }">
		       	<li class="page-item"><a class="page-link"
		       		 href="mypage_favorite_list.do?pageNum=${startPage-1}" aria-label="Previous"> 
		       		 <span aria-hidden="true">&laquo;</span></a></li>
		       	</c:if>
		       	<c:forEach var ="i" begin="${startPage}" end="${endPage}">
		       		<li class="page-item"><a class="page-link" href ="mypage_favorite_list.do?pageNum=${i}">${i}</a></li>
		       	</c:forEach>     	
		        <c:if test="${pageCount> endPage}">
		          <li class="page-item">
				<a class="page-link"
		        	href="mypage_favorite_list.do?pageNum=${endPage+1}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>   
		       	</c:if>
		       </c:if>
		       </ul>
		       </nav>
		    </div>
		</div>
      </form>
      </div>
		</section>
	</div>
</div>
<!-- Modal -->
<form name="mypagefavoritedel" action="mypage_favorite_del.do" method="post">
<div class="modal fade" id="checkModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="checkModalLabel">삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<input type="hidden" id="checkDel" name="checkDel" />
      	<input type="hidden" id="checkType" name="checkType" />
       	<p class="mx-auto">삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</form>

<script>
	function hashtagFilter(event){
		const favorite_type = $("#hashtagFilter option:selected").val();
		$('#favorite_type').val(favorite_type);
		$('#favoriteForm').submit();
	}
</script>

<script>
	function valueSetting(no, type){
		$('#checkDel').attr("value", no);
		$('#checkType').attr("value", type);
	}
	
</script>


</body>
</html>
 <%@ include file="../bottom.jsp"%>