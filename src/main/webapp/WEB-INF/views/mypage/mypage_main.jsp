<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "mypage.jsp" %>

<!-- mypage_main.jsp -->
		<div class="col-md-9">
        	<h3>프로필</h3>
        	<table class="table table-sm">
	        <tr>
	        	<th>아이디</th>
	       		<td>${getMember.member_id }</td>
	        </tr>
	        <tr>
		        <th>이름</th>
		        <td>${getMember.member_name}</td>
	        </tr>
	        <tr>
		        <th>이메일</th>
		        <td>${getMember.member_email}</td>
	        </tr>
	        <tr>
		        <th>전화번호</th>
		        <td>${getMember.member_hp}</td>
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
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 update.do 추가 name추가 -->
         <%-- <input type="text" name="email" class="box" value="${getMember.email}">--%>
         <form role="form">
				<div class="form-group">
					<label for="member_passwd">비밀번호</label>
					<input type="password" class="form-control" id="member_passwd" />
				</div>
				<div class="form-group">
					<label for="member_email">이메일</label>
					<input type="text" class="form-control" id="member_email" />
				</div>
				<div class="form-group">
					<label for="member_hp">전화번호</label>
					<input type="text" class="form-control" id="member_hp" />
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
</div>
</body>
</html>

<%@ include file ="../bottom.jsp"%>