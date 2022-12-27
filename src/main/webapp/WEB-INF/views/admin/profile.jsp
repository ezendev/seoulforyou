<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 프로필 수정</title>
</head>
<body>
	
	<form method="post" enctype="multipart/form-data">
    <div class="container-fluid px-4">
     <h1 class="mt-4 ">프로필 수정</h1><br>
       <div class="card mb-5"></div>
       <div style="position:relative" class="mb-5">
       	<div class="d-flex justify-content-center mt-2">
		<img id="profile_img" name="profile_img" src="https://ezdev-sfy.s3.ap-northeast-2.amazonaws.com/admin/${getAdmin.admin_profileImg}" style="border:5px; border-radius:50%; width:200px; height:200px" />		</div>
		<div style="position:absolute; top:180; right:540">
		<div class="d-flex justify-content-center">
		 
		<label className="admin_profileImg_button" for="admin_profileImg">
		<img src="resources/icon/upload.png" style="width:50; height:50; border-radius:50%"> 
		</label>
		
		</div>
		</div>
		</div>
				<div class="row">
				<div class="col-md-6 offset-md-3">
				<input type="file" name="admin_profileImg" id="admin_profileImg" accept="image/*" style="display:none"><br>
				
				<input type="hidden" class="form-control mb-3" id="no" name="admin_no" value="${getAdmin.admin_no}" readonly>
				<label class="form-label mb-3">관리자 이름</label> 	
				<input type="text" class="form-control mb-3" id="name" name="admin_name" value="${getAdmin.admin_name}">
				<label class="form-label mb-3">관리자 아이디</label> 				
				<input type="text" class="form-control mb-3" id="id" name="admin_id" value="${getAdmin.admin_id}" >
				<label class="form-label mb-3">비밀번호</label>
				<input type="text" class="form-control mb-3" id="passwd" name="admin_passwd" value="${getAdmin.admin_passwd}">
				<label class="form-label mb-3">이메일</label>
				<input type="email" class="form-control mb-3" id="email" name="admin_email" value="${getAdmin.admin_email}">
	   			</div>
	   			</div>
	   			
				<div class="row justify-content-evenly mt-5 mb-5">
				<div class="col-4" style="display:inline-block">
				<button class="w-100 btn btn-lg btn-primary col" formaction="admin_update.do" type="submit" >수정</button>
				</div>
				<div class="col-4" style="display:inline-block">
				<button class="w-100 btn btn-lg btn-danger col" formaction="admin_delete.do" type="submit" >삭제</button>
				</div>
				</div>
				</div>
				</form>
				
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
					<input type="file" name="admin_profileImg" id="admin_profileImg" accept="image/*">
					<input type="hidden" name="admin_id" id="admin_id" value="${sessionScope.adto.admin_id}">
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