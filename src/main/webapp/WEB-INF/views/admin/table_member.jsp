<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<title>회원 데이터 리스트</title>
<!-- 회원리스트입니다 -->
 <head>
 
 <style>
 .modalBackground { 
  opacity: 0.9;
  background-color: gray;
 } 
 </style>
 
 <script>
 function valueSetting(no,name,id,passwd,email,hp){
	 $('#no').attr("value", no);
	 $('#name').attr("value", name);
	 $('#id').attr("value", id);
	 $('#passwd').attr("value", passwd);
	 $('#email').attr("value", email);
	 $('#hp').attr("value", hp);
 }
 
 </script>
       
</head>
    <!-- 상단 네비바 구성 -->
                <!-- 회원 목록 내용입니다 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원목록</h1><br>
                        <div class="card mb-4"></div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Member
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </thead>
                                     
                                     <c:if test= "${empty listMember2}">
                                     	<tr>
                                     	<td colspan="6">등록된 회원이 없습니다</td>
                                     	</tr>
                                     </c:if>
                                     
                                      <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </tfoot>
                                    
                                     <tbody>
                                         <c:forEach var="dto" items= "${listMember2}">	
                                        <tr>
                                            <td>${dto.member_no}</td>
                                            
                                            <td class="member_no" data-bs-toggle="modal" data-bs-target="#member_no" style="color:blue"> 
                                            <a onclick="valueSetting('${dto.member_no}','${dto.member_name}',
                                             '${dto.member_id}','${dto.member_passwd}','${dto.member_email}','${dto.member_hp}')">
                                             <strong>${dto.member_name}</strong></a></td>
                                            
                                            <td>${dto.member_id}</td>
                                            <td>${dto.member_passwd}</td>
                                            <td>${dto.member_email}</td>
                                            <td>${dto.member_hp}</td>
                                        </tr>
                                        </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; SeoulforUs </div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
		   						  <!-- 관리자등록 모달 내용 --> 	
		                 		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		                      	<div class="modal-dialog">
		                      	<div class="modal-content">
		                      	<!-- 모달 header입니다 -->
		     				  	<div class="modal-header bg-light">
		                        <h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>관리자 등록</strong></h1>  <!-- fs는 폰트 크기입니다 -->
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>  <!-- 창의 취소 버튼입니다 -->
		      					</div>
		      					<!-- 모달header 끝입니다 -->
		      					
		      				     <!-- 모달 등록내용입니다 -->
		    					<div class="modal-body" style="height:250px">
		     				
		                	
                            	<div class="border-1 rounded-lg">
                             
                             		<div class="row mb-3">
                               		<div class="col-md-6">
                                     <div class="form-floating mb-3 mb-md-0">
                                     <input class="form-control" id="inputId" type="text" placeholder="아이디를 입력하세요" />
                                     <label for="inputId">아이디</label>
                                     </div>
                                     </div>
                                		
                                     <div class="col-md-6">
                                     <div class="form-floating">
                                     <input class="form-control" id="inputName" type="text" placeholder="이름을 입력하세요"/>
                                     <label for="inputName">성함</label>
                                     </div>
                                		</div>
                                		</div>
                               
                                	    <div class="form-floating mb-3">
                                     <input class="form-control" id="inputEmail" type="email" placeholder="email@seoulforus.com" />
                                     <label for="inputEmail">이메일 주소</label>
                                		</div>
                                		
                                 	<div class="row mb-3">
                                     <div class="col-md-6">
                                     <div class="form-floating mb-3 mb-md-0">
                                     <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호를 입력하세요" />
                                     <label for="inputPassword">비밀번호</label>
                                     </div>
                                     </div>
                                     
                                     <div class="col-md-6">
                                     <div class="form-floating mb-3 mb-md-0">
                                     <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="비밀번호 확인" />
                                     <label for="inputPasswordConfirm">비밀번호 확인</label>
                                     </div>
                                     </div>
                                		</div>
		                 				</div>
		 							   	 </div>
								<!-- 모달 footer입니다 -->
		                            <div class="modal-footer">
		 						   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		 						   <button type="button" class="btn btn-primary">등록</button>
								   </div>
								   </div>
						  		 </div>
							   </div>
		                   
		   
		     <!-- 회원상세보기 모달창입니다 -->
		     <div class="modal fade modalBackground modalPopupWrap" id="member_no">
               <div class="modal-dialog">
             
			  <div class="modal-content">
			  <div class="modal-header justify-content-center">
			  		<h1 class="h3 fw-normal">회원 정보 수정</h1> 
			  </div>
			   <div class="modal-body ">
			   <form method="post">
			  			
			  			<div class="mb-3">
						<label class="form-label">번호</label>		
						<input type="text" class="form-control" id="no" name="member_no" value="${member_no}" readonly>
			  			</div>
			  			
			  			<div class="mb-3">
						<label class="form-label">이름</label> 				
						<input type="text" class="form-control" id="name" name="member_name" value="${member_name}">
						</div>
			   
						<div class="mb-3">
						<label class="form-label">아이디</label> 				
						<input type="text" class="form-control" id="id" name="member_id" value="${member_id}">
						</div>
						
						<div class="mb-3">
						<label class="form-label">비밀번호</label>
						<input type="text" class="form-control" id="passwd" name="member_passwd" value="${member_passwd}">
						</div>
					
						<div class="mb-3">
						<label class="form-label">이메일</label>
						<input type="email" class="form-control" id="email" name="member_email" value="${member_email}">
						</div>					
				
						<div class="mb-3">
						<label class="form-label">전화번호</label>
						<input type="text" class="form-control" id="hp" name="member_hp" value="${member_hp}">
						</div>
					
						<div class="mb-3">
						<a type="button" style="color:white" class="w-100 btn btn-secondary btn-lg" 
						data-bs-dismiss="modal">취소</a>
						</div>	

						<div class="mb-3">
						<button class="w-100 btn btn-lg btn-primary" formaction="member_update.do" type="submit" >수정</button>
						</div>
					
						
						<div class="mb-3">
						<button class="w-100 btn btn-lg btn-danger" formaction="member_delete.do" type="submit" >삭제</button>
						</div>
						</form>
				</div>
			  </div>
			</div>
			</div>
	  	  </body>
		</html>
			