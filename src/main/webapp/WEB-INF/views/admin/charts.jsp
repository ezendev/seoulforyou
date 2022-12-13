<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<!-- 통계입니다 -->
<html lang="en"> 
<title>통계</title>
<!-- 통계입니다 -->
   
     <!-- 프로필 설정 항목 살려주기. -->
             
            <!-- 본문 내용 시작입니다 -->
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">통계</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.do">Dashboard</a></li>
                            <li class="breadcrumb-item active">Charts</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                Chart.js is a third party plugin that is used to generate the charts in this template. The charts below have been customized - for further customization options, please visit the official
                                <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Area Chart Example
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        Pie Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/demo/chart-area-demo.js"></script>
        <script src="resources/demo/chart-bar-demo.js"></script>
        <script src="resources/demo/chart-pie-demo.js"></script>
        
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
		      						 <!-- 모달footer끝입니다 -->
		      							   </div>
		      					   	<!-- 모달content끝입니다 -->
		    							   </div>
		    						<!-- 모달 dialog끝입니다 -->
		 								   </div>
		                            <!-- 관리자등록 모달 내용 끝입니다 -->
        
    </body>
</html>
