<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<title>관리자 페이지</title>
	<!-- 부트 스트랩 적용을 위한 환경구성 -->
                            
    <!-- 대시보드 항목입니다 -->
    <div class="container-fluid px-4">
        <h1 class="mt-4">대시보드</h1><br>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Area Chart Example
                    </div>
                  	 <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                     </div>
                 	</div>
                 <!-- 통계항목 입니다. -->
                 <div class="col-xl-6">
                     <div class="card mb-4">
                         <div class="card-header">
                             <i class="fas fa-chart-bar me-1"></i>
                             Bar Chart Example
                         </div>
                         <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                     </div>
                 </div>
             </div><br>
             <!-- 목차항목입니다 -->
             <div class="card mb-4">
                 <div class="card-header">
                     <i class="fas fa-table me-1"></i>
                     DataTable Example
                 </div>
                 <div class="card-body">
                     <table id="datatablesSimple">
                         <thead>
                             <tr>
                                 <th>Name</th>
                                 <th>Position</th>
                                 <th>Office</th>
                                 <th>Age</th>
                                 <th>Start date</th>
                                 <th>Salary</th>
                             </tr>
                         </thead>
                         <tfoot>
                             <tr>
                                 <th>Name</th>
                                 <th>Position</th>
                                 <th>Office</th>
                                 <th>Age</th>
                                 <th>Start date</th>
                                 <th>Salary</th>
                             </tr>
                         </tfoot>
                         <tbody>
                             <tr>
                                 <td>Tiger Nixon</td>
                                 <td>System Architect</td>
                                 <td>Edinburgh</td>
                                 <td>61</td>
                                 <td>2011/04/25</td>
                                 <td>$320,800</td>
                             </tr>
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
				        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
				        <script src="resources/demo/chart-area-demo.js"></script>
				        <script src="resources/demo/chart-bar-demo.js"></script>
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
    				<div class="modal-body" style="height:380px">
  					<div class="border-1 rounded-lg">
  					<!-- form 테그 시작 -->
  					<form name="f" action="admin_input_ok.do" method="post" enctype="multipart/form-data">
              		<div class="row mb-3">
              		<div class="col-md-6">
                   <div class="form-floating mb-3 mb-md-0">
                   <input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="아이디를 입력하세요" />
                   <label for="admin_id">아이디</label>
                   </div>
                   </div>
              		
                   <div class="col-md-6">
                   <div class="form-floating">
                   <input class="form-control" id="admin_name" name="admin_name" type="text" placeholder="이름을 입력하세요"/>
                   <label for="admin_name">성함</label>
                   </div>
              		</div>
              		</div>
             
              	    <div class="form-floating mb-3">
              	    <input class="form-control" id="admin_email" name="admin_email" type="email" placeholder="email@seoulforus.com" />
                   <label for="admin_email">이메일 주소</label>
              		</div>
              		
               	<div class="row mb-3">
                   <div class="col-md-6">
                   <div class="form-floating mb-3 mb-md-0">
                  <input class="form-control" id="admin_passwd" name="admin_passwd" type="password" placeholder="비밀번호를 입력하세요" />
                   <label for="admin_passwd">비밀번호</label>
                   </div>
                   </div>
                   
                   <div class="col-md-6">
                   <div class="form-floating mb-3 mb-md-0">
                    <input class="form-control" id="admin_passwd_confirm" name="admin_passwd_confirm" type="password" placeholder="비밀번호 확인" 
                    onkeyup="passConfirm()"/>
                    <div id="confirmMsg"></div>
                    <label for="admin_passwd_confirm">비밀번호 확인</label>
                    <script type="text/javascript">
                            function passConfirm(){
                           var admin_passwd = document.getElementById('admin_passwd');
                           var admin_passwd_confirm = document.getElementById('admin_passwd_confirm');
                           var confrimMsg = document.getElementById('confirmMsg');
                           var correctColor = "blue";
                           var wrongColor ="red";
                            	
                           if(admin_passwd.value == admin_passwd_confirm.value){
                        	   confirmMsg.style.color = correctColor;
                        	   confirmMsg.innerHTML ="비밀번호 일치";
                           }else{
                        	  	confirmMsg.style.color = wrongColor;
                   				confirmMsg.innerHTML ="비밀번호 불일치";
                           }
                            }
                            </script>
                    	</div>
                   	 </div>
              		</div>
              		<!-- 파일 업로드 -->
					<table class="form-floating mb-3 mb-md-0" >
					<tbody>
					<tr>
					<th>프로필 이미지 첨부 </th>
						<tr>
						<td>
					<input type="file" name="admin_profileImg" id="admin_profileImg">
					<input type="reset" value="취소" >
                     		</td>
                     		</tr>	
                     		</tbody>
                     		</table>
                     		
							<!-- 모달 footer입니다 -->
			               <div class="modal-footer">
						   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						   <input type="submit" class="btn btn-primary" value="등록">
					  	   </div>
      						</form>
      						</div>
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
