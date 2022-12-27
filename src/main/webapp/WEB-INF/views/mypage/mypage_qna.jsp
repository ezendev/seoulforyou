<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- mypage_route.jsp -->
<%@ include file="mypage.jsp"%>

<style>
a {
  text-decoration: none;
  color: black;
}
</style>
<!-- qna 페이지 -->
  <div class="wrapper col-md-9">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
       <section class="content-header">
          <h2 id="mypage_route" align="center">문의 내역</h2>   
       </section>
       
    	<section class="content container-fluid">
          <div class="col-lg-12">
            <div class="box box-primary">
               <div class="box-body">
        
		        <!-- Main content -->
		      	<table class="table table-sm table-hover">
		         <tbody>
		            <tr>
		               <th style="width: 10%">NO</th>
		               <th style="width: 40%">제   목</th>
		               <th style="width: 10%">작성자</th>
		               <th style="width: 10%">작성일</th>
		               <th style="width: 10%">답변여부</th>
		               <th style="width: 10%">삭제</th>
		            </tr>
		           <c:if test="${empty listBoard}">
					<tr>
						<td colspan="6">등록된 문의내용이 없습니다.</td>
					</tr>
			       </c:if>
			       <!--<c:set var="num" value="${requestScope.num}"/>-->
			       <c:if test="${not empty listBoard}">
			          <c:forEach items="${listBoard}" var="dto">
		               	<tr>
		                	<td style="width: 10%">
		                		<c:out value="${qna_no}"/>
								<c:set var="qna_no" value="${qna_no-1}"/>
		                	</td>
        					<td style="width: 40%">
				                <button
				                onclick="viewQna('${dto.qna_content}')"
				                id="modal_view" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#view_qna">
	        					${dto.qna_subject}</button></td>
			             	<td style="width: 10%">${dto.qna_writer}</td>
		                 	<td style="width: 10%">${dto.qna_regdate}</td>		                 	
							
							<!-- 답변글이 없을 때 -->
							<c:if test="${empty dto.qna_reply_content}">
								<td>-</td>
							</c:if>
							
							<!-- 답변글이 있을 때 -->
							<c:if test="${not empty dto.qna_reply_content}">
								<td>
								<a onclick="viewReply('${dto.qna_reply_regdate}','${dto.qna_reply_content}')" 
									data-bs-toggle="modal" data-bs-target="#reply_qna">답변완료</a>
								</td>
							</c:if>
								
		                 	<td style="width: 10%">
			                 	<button onclick="valueSetting('${dto.qna_no}')"
			                 	 type="button" class="btn btn-light"  style="--bs-btn-padding-y: .2rem; --bs-btn-padding-x: .3rem;"  data-bs-toggle="modal" data-bs-target="#checkModal">
						   		<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
		  						<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
								</svg></button>
		                 	</td>
		             	</tr> 

					 </c:forEach>
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
		       <c:if test="${not empty listMyroute}">
		       	<c:if test ="${startPage >pageBlock }">
		       	<li class="page-item"><a class="page-link"
		       		 href="mypage_route.do?pageNum=${startPage-1}" aria-label="Previous">
		       		 <span aria-hidden="true">&laquo;</span>
		       		 </a></li>
		       	</c:if>
		       	<c:forEach var ="i" begin="${startPage}" end="${endPage}">
		       		<li class="page-item"><a class="page-link" href ="mypage_route.do?pageNum=${i}">${i}</a>
				</li>
		       	</c:forEach>     	
		        <c:if test="${pageCount> endPage}">
		        <li class="page-item">
				<a class="page-link"
		        	href="mypage_route.do?pageNum=${endPage+1}" aria-label="Next"><span
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

<!-- 문의 내용 모달 -->
<div class="modal" tabindex="-1" id="view_qna" >
  <div class="modal-dialog modal-lg modal-dialog-centered" >
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" >내용</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		    <p><input class="form-control-plaintext qna_content"></p>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 답변 내용 모달 -->
<div class="modal" tabindex="-1" id="reply_qna" >
  <div class="modal-dialog modal-lg modal-dialog-centered" >
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" >답변</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
		<div class="modal-body">
		<p><input type="hidden" class="qna_no" /></p>
		    <p><input class="form-control-plaintext qna_reply_content"></p>
		    <p><input class="form-control-plaintext qna_reply_regdate"></p>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 삭제 체크 모달 -->
<!-- Modal -->
<form name="mypageQnaDel" action="mypage_qna_del.do" method="post">
<div class="modal fade" id="checkModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="checkModalLabel">삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<input type="hidden" id="checkDel" name="checkDel" />
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
function valueSetting(no){
	$('#checkDel').attr("value", no);
	console.log(no);
}

function viewQna(qna_content){
	$('.qna_content').attr("value", qna_content);
}

//답변 창을 클릭했을 때 모달창에 각 dto값을 세팅해준다
function viewReply(qna_reply_regdate, qna_reply_content){
	$('.qna_reply_regdate').attr("value", qna_reply_regdate);
	$('.qna_reply_content').attr("value", qna_reply_content);
}
</script>

<%@ include file="../bottom.jsp"%>