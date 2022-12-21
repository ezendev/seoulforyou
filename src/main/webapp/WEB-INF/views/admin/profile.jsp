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
    <div class="container-fluid px-4">
     <h1 class="mt-4 ">프로필 수정</h1><br>
       <div class="card mb-5"></div>
       
       <div style="position:relative" class="mb-5">
       	<div class="d-flex justify-content-center mt-2">
		<img id="profile_img" class="profile_img" src="/admin/${profile_img}" style="border:5px; border-radius:50%; width:200px; height:200px" />
		</div>
		
		<div style="position:absolute; top:150; right:630">
		<div class="d-flex justify-content-center">
		<label className="admin_profileImg_button" for="admin_profileImg">
		<img src="resources/icon/upload.png" style="width:50; height:50; border-radius:50%"> 
		</label>
		<input type="file" name="admin_profileImg" id="admin_profileImg" accept="image/*" style="display:none ">
		</div>
		</div>
		</div>
				<form method="post">
				<div class="row">
				<div class="col-md-6 offset-md-3">
				<label class="form-label mb-3">관리자 번호</label>
				<input type="text" class="form-control mb-3" id="no" name="admin_no" value="${admin_no}" readonly>
				<label class="form-label mb-3">관리자 이름</label> 	
				<input type="text" class="form-control mb-3" id="name" name="admin_name" value="${admin_name}">
				<label class="form-label mb-3">관리자 아이디</label> 				
				<input type="text" class="form-control mb-3" id="id" name="admin_id" value="${admin_id}" >
				<label class="form-label mb-3">비밀번호</label>
				<input type="text" class="form-control mb-3" id="passwd" name="admin_passwd" value="${admin_passwd}">
				<label class="form-label mb-3">이메일</label>
				<input type="email" class="form-control mb-3" id="email" name="admin_email" value="${admin_email}">
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
				</form>
				
				</div>
			</body>
		</html>