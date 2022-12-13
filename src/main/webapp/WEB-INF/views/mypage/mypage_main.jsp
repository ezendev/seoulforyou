<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "mypage.jsp" %>

<!-- mypage_main.jsp -->
		<div class="col-md-9">
        	<h3>프로필</h3>
        	<table class="table table-sm">
	        <tr>
	        	<th>아이디</th>
	       		<td>${mdto.member_id }</td>
	        </tr>
	        <tr>
		        <th>이름</th>
		        <td>${mdto.member_name}</td>
	        </tr>
	        <tr>
		        <th>이메일</th>
		        <td>${mdto.member_email}</td>
	        </tr>
	        <tr>
		        <th>전화번호</th>
		        <td>${mdto.member_hp}</td>
		    </tr>
	        </table>
     		  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile_update">수정</button>
		</div>

<!-- Modal -->
<div class="modal fade" id="profile_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
     <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">정보 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form role="form" action="update.do" method="post">
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 update.do 추가 name추가 -->
         <%-- <input type="text" name="email" class="box" value="${getMember.email}">--%>
				<div class="form-group">
				<label for="member_id">
						아이디
					</label>
					<input type="text" class="form-control" name="member_id" value="${mdto.member_id }" />
				<label for="member_hp">
						이름
					</label>
					<input type="text" class="form-control" name="member_name" value="${mdto.member_name }" />				
				<label for="member_passwd">
						
					</label>
					<input type="hidden" class="form-control" name="member_no" value="${mdto.member_no}" />
					<label for="member_passwd">
						비밀번호
					</label>
					<input type="text" class="form-control" name="member_passwd" value="${mdto.member_passwd}" />
					 
					<label for="member_email">
						이메일
					</label>
					<input type="text" class="form-control" name="member_email" value="${mdto.member_email}"  />

					<label for="member_hp">
						전화번호
					</label>
					<input type="text" class="form-control" name="member_hp" value="${mdto.member_hp }" />
							</div>
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
</div>
</body>
</html>

<%@ include file ="../bottom.jsp"%>