<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>문의리스트</title>
<!-- 문의리스트입니다. -->
    
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
                                      <th style="min-width:300px">문의제목</th>
                                      <th>문의내용</th>
                                      <th style="min-width:100px">등록기간</th>
                                  </tr>
                              </thead>
                            
                            <c:if test= "${empty listOfQna}">
                          	<tr>
                           	<td colspan="4">등록된 문의가 없습니다</td>
                          	</tr>
                            </c:if>
                             
                            <tfoot>
                                <tr>
                                    <th style="min-width:100px">문의번호</th>
                                    <th style="min-width:300px">문의제목</th>
                                    <th>문의내용</th>
                                    <th style="min-width:100px">등록기간</th>
                                </tr>
                            </tfoot>
                                    
                           <tbody>
                           	 <c:forEach var="dto" items= "${listOfQna}">
                               <tr>
                                   <td style="min-width:100px">${dto.qna_no}</td>
                                   <td style="min-width:300px">${dto.qna_subject}</td>
                                   <td onclick="valueSetting('${dto.qna_no}', '${dto.qna_subject}', '${dto.qna_writer}')" class="qna_content" data-bs-toggle="modal" data-bs-target="#admin_reply" style="color:blue">
                               			${dto.qna_content}
                                  </td>
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
        
   			
   	     <!-- 문의 답변 모달 창 -->			
               		<div class="modal fade"  id="admin_reply" >
           		    <div class="modal-dialog">
			 		<div class="modal-content ">
			  		<div class="modal-header justify-content-center">
			  		<h1 class="h3 fw-normal">문의사항 답글</h1> 
			  		 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			   		</div>
   			 		<form name="f" method="post">
   			 		<input type="hidden" id="adminTemp_qno" name="temp_qno" value="">
   			 		<input type="hidden" id="adminTemp_subject" name="qna_subject" value="">
   			 		<input type="hidden" id="adminTemp_writer" name="qna_writer" value="" >
			   		<div class="modal-body d-flex justify-content-center" style="width:500px; height:400px">
			  		<textarea id="adminTemp_content" name="qna_reply_content" rows="10px" cols="200px"  placeholder="답글을 입력하세요" class="d-flex justify-content-center"></textarea>
					</div>
					<div class="modal-footer">
					<input type="submit" class="btn btn-secondary" value="임시저장" formaction="admin_temp.do">
					<input type="submit" class="btn btn-primary" value="전송" formaction="admin_temp_ok.do">
					<button type="button" class="btn btn-primary" data-bs-target="#admin_mail" data-bs-toggle="modal" data-bs-dismiss="modal"
					  		  onclick="MemberEmail()" >알람</button>
					<input type="submit" class="btn btn-danger" value="삭제" formaction="admin_replyContent_delete.do" >
					</div>
					</form>
					</div>
					</div>
					</div>
					
					 <!-- 답변 알림 메일전송 모달창 -->			
               		<div class="modal fade" id="admin_mail" >
           		    <div class="modal-dialog">
			 		<div class="modal-content" style="width:500px; height:400px">
			  		<div class="modal-header justify-content-center">
			  		<h1 class="h3 fw-normal">답변 알림 메일전송</h1> 
			   		</div>
			   		<br>
					<form method="post" action="send.do"> 
			   		<table style="width:600px; align:center; border-spacing:30px">
					<tr>
					<td style="text-align:center">
					<label for="senderName"><strong>발신자 이름</strong></label>
					</td>
					<td>
					<input name="senderName" id="senderName" value="Seoulforyou 관리자">
					</td>
					</tr>
					
					<tr>
					<td style="text-align:center">			
					<label for="senderMail"><strong>발신자 이메일</strong></label>
					</td>
					<td>
					<input name="senderMail" id="senderMail" value="${adto.admin_email}" style="border: 3px solid #ff0000">
					</td>
					</tr>
					
					<tr>					
					<td style="text-align:center">
					<label for="receiveMail"><strong>수신자 이메일</strong></label>
					</td>
					<td>
					<input name="receiveMail" id="member_email" value="" style="border: 3px solid #ff0000">
					</td>
					</tr>
					
					<tr>
					<td style="text-align:center">										
					<label for="subject"><strong>제목</strong></label>
					</td>
					<td>
					<input name="subject" id="subject" value="Seoulforyou 답변완료">
					</td>
					</tr>
					
					<tr>
					<td style="text-align:center">			
					<label for="message"><strong>내용</strong></label>
					</td>
					<td>
					<textarea rows="5" cols="21" name="message" id="message">문의하신 내용 답변완료하였습니다.</textarea>
					</td>
					</tr>
					
					</table>
					<button type="submit" class="btn btn-primary" style="float:right" data-bs-target="#admin_reply" data-bs-toggle="modal" data-bs-dismiss="modal">메일전송</button>
					</form>
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
	<script>
	 function valueSetting(qno, subject, writer){
		 var qno = qno;
		 
		 $('#adminTemp_qno').attr("value", qno);
		 $('#adminTemp_subject').attr("value",subject);
		 $('#adminTemp_writer').attr("value",writer);
		 AjaxStart()
	 }
	</script>	
	
	<script>
	function MemberEmail(){
			var qna_writer = $('#adminTemp_writer').val();
		
		$.ajax({
			url : 'memberEmail.do',
			type : 'post',
			data : {
				qna_writer: qna_writer
				},
			success : function(data){
				$("#member_email").val(data);
			}
		})
	}	
	</script>	 

	<script>
	function AjaxStart(){
		var temp_qno = $('#adminTemp_qno').val();
		
		$.ajax({
		url: 'tempList.do',
		method: 'post',
		data: {
			temp_qno: temp_qno	
		},
		success: function(data){
		$('#adminTemp_content').val(data);
			}
		})
	}
		</script>   
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/js/datatables-simple-demo.js"></script>
		<script src="resources/js/jquery-3.6.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
 		<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
