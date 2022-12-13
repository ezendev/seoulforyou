<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<title>문의리스트</title>
<!-- 문의리스트입니다 -->
    
    <head>
	<script>
	 	function valueSetting(qna){
		 $('#qna').attr("value", qna);
 			}
 	</script>   
    </head>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 ">문의목록</h1><br>
                         <div class="card mb-4"></div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable QNA
                            </div>
                         <div class="card-body">
                            <table id="datatablesSimple">
                              <thead>
                                  <tr>
                                      <th style="min-width:100px">문의번호</th>
                                      <th>문의제목</th>
                                      <th>문의내용</th>
                                      <th style="min-width:100px">등록기간</th>
                                  </tr>
                              </thead>
                            
                            <c:if test= "${empty listQna2}">
                          	<tr>
                           	<td colspan="4">등록된 문의가 없습니다</td>
                          	</tr>
                            </c:if>
                             
                            <tfoot>
                                <tr>
                                    <th style="min-width:100px">문의번호</th>
                                    <th>문의제목</th>
                                    <th>문의내용</th>
                                    <th style="min-width:100px">등록기간</th>
                                </tr>
                            </tfoot>
                                    
                           <tbody>
                            <c:forEach var="dto" items= "${listQna2}">
                               <tr>
                                   <td style="min-width:100px">${dto.qna_no}</td>
                                   <td>${dto.qna_subject}</td>
                                   <td class="qna_content" data-bs-toggle="modal" data-bs-target="#qna_content" style="color:blue">
                                   ${dto.qna_content}</td>
                                   <td style="min-width:100px">${dto.qna_regdate}</td>
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
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
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
   
   			 <!-- 문의 답변 모달 창 -->				
               		<div class="modal fade modalBackground modalPopupWrap" id="qna_content">
           		    <div class="modal-dialog">
			 		<div class="modal-content">
			  		<div class="modal-header justify-content-center">
			  		<h1 class="h3 fw-normal">문의사항 답글</h1> 
			   		</div>
			   
			   		<div class="modal-body d-flex justify-content-center" style="width:500px; height:400px">
			  		<textarea rows="5" cols="200" placeholder="답글을 작성해주세요" class="d-flex justify-content-center"></textarea>
					</div>
					
					<div class="modal-footer">
					<button type="button" class="btn btn-primary">저장</button>
					<button type="button" class="btn btn-secondary">완료</button>				
					</div>
				  </div>
				 </div>
				</div>
   
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
					<!-- 모달 footer입니다 -->
                     <div class="modal-footer">
				     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				     <button type="button" class="btn btn-primary">등록</button>
				     </div>
						 <!-- 모달footer끝입니다 -->
							   </div>
					   	<!-- 모달content끝입니다 -->
							   </div>
						<!-- 모달 dialog끝입니다 -->
					 		  </div>
		                    <!-- 관리자등록 모달 내용 끝입니다 -->
    </body>
</html>
