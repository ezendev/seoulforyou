<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- mypage_review.jsp -->
<%@include file = "mypage.jsp" %>
 <script>
<%-- 모달창 끄면 이전 입력 정보 사라짐 --%>
$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});
</script>
 <div class="wrapper col-md-9">   
            <h2 id="mypage_review" align="center">
                	나의 리뷰
            </h2>
        <!-- Main content -->
                        <table class="table table-sm table-hover">
                            <thead>
                            <tr>
                                <th width="5%">NO</th>
                                <th width="10%">평점</th>
                                <th width="20%">내용</th>
                                <th width="15%">작성시간</th>
                                <th width="10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty listReview}">
                            <tr>
                            <td colspan="5">등록된 리뷰가 없습니다.</td>
                            </tr>
                            </c:if>
                            <c:set var="num" value="${requestScope.num}"/>
                            <c:forEach var="redto" items="${listReview}" varStatus="status">
                            <tr>
                                <td>
                                <c:out value="${num}"/>
                                <c:set var="num" value="${num-1}"/>
                                </td>
                                <td>${redto.review_star}</td>
                                <td title="${redto.review_content}">
                                <c:choose>
                                <c:when test="${fn:length(redto.review_content)>15}">

                                <c:out value="${fn:substring(redto.review_content,0,14)}"/>....
                                </c:when>
                                <c:otherwise>
                                <c:out value="${redto.review_content}"/>
                                </c:otherwise>
                                </c:choose> 
                                </td>
                                <td>${redto.review_regdate}</td>
                                <td>
			                   <button onclick="valueSetting('${redto.review_no}','${redto.review_content}')" type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#review_update">
                                                             수정
                               </button>
			                    <a type="button" class="btn btn-outline-primary btn-sm" href="delete_review.do?review_no=${redto.review_no}">
			                                      삭제
			                    </a>
			                    </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
               <div class="d-flex justify-content-center mt-3">    
            <nav aria-label="Page navigation example" >
			<ul class="pagination">
            <c:if test="${not empty listReview}">
                <c:if test="${startPage > pageBlock}">
                	<li class="page-item"><a class="page-link"
			 href="mypage_review.do?pageNum=${startPage-1}" aria-label="Previous">
			 <span aria-hidden="true">&laquo;</span>
			 </a></li>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link" href="mypage_review.do?pageNum=${i}">${i}</a>
			</li>
		</c:forEach>	
		<c:if test="${pageCount > endPage}">		
			 <li class="page-item">
				<a class="page-link"
		        	href="mypage_review.do?pageNum=${endPage+1}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>
		</c:if>
	    </c:if> 
	    </ul>
	    </nav>
             </div>
             </div>
 <!-- Modal -->
<div class="modal fade" id="review_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
     <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">정보 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form name="f" action="update_review.do" method="post">
			<input type="hidden" id="review_no" name="review_no" />
			<div class="form-group">
				<label for="review_star">
						평점 : 
				</label>
				<select name="review_star" class="form-control">
	      			 <option value="★☆☆☆☆">★☆☆☆☆</option>
	      			 <option value="★★☆☆☆">★★☆☆☆</option>
	      			 <option value="★★★☆☆">★★★☆☆</option>
	      			 <option value="★★★★☆">★★★★☆</option>
	      			 <option value="★★★★★">★★★★★</option>
                 </select>
				<label for="review_content">
						내용
			    </label>
				<textarea class="form-control" id="review_content" name="review_content" rows="7"></textarea><br>
			</div>
	      	<div class="modal-footer">
		        <input type="submit" class="btn btn-primary" value="입력">
		      	<input type="reset" class="btn btn-secondary" data-bs-dismiss="modal" value="취소">
			</div>
      		</form>
    	</div>
  	</div>
	</div>
</div>
        <!-- /.content -->
   <script>
   	function valueSetting(no, content){
   		console.log(no);
   		console.log(content);
   		$('#review_no').attr("value", no);
   		$('#review_content').val(content);
   	}
   </script>
  <%@ include file="../bottom.jsp"%>