<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_friend.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>

<html>

<head>
<title>마이페이지</title>
<script>
function getselect() {
	<%-- 검색 관련 기능 --%>
	const value = e.value;

    document.getElementById('result').innerText = value;
   
}
<%-- 모달창 끄면 내용 초기화 시켜줌 --%>
$('.modal').on('hidden.bs.modal', function (e) { 
    console.log('modal close');
  $(this).find('form')[0].reset()
});
</script>
<!-- <style type="text/css">
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})
</style> -->
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
   <div class="container">
	<div class="row">
		<aside class="bd-aside sticky-xl-top text-muted align-self-start d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
    <a href="index.do" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"></svg>
      <span class="fs-4">Seoul for you</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a class="nav-link js-scroll-trigger" aria-current="page" href="mypage.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          내정보
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_route.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 여행 루트
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_review.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 리뷰
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_favorite.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          나의 즐겨찾기
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="#mypage_friend">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          친구 목록
        </a>
      </li>
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_qna.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          문의 내역
        </a>
      </li>
      <li>
        <a class="nav-link link-dark" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          회원 탈퇴
        </a>
      </li>
      <li>
        <a class="nav-link active" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          로그아웃
        </a>
      </li>
    </ul>
    <hr>
  </aside>
  <div class="col-md-9">
  <h3 id="mypage_friend">
				친구 목록
			</h3>
			<!-- 친구 테이블 추가 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th width="20%">
							아이디
						</th>
						<th width="20%">
							이름
						</th>
						<th width="20%">
						</th>
					</tr>
				</thead>
				<tbody>
			<c:if test="${empty listFriend}">
		<tr>
			<td colspan="2">등록된 친구가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listFriend}">
		<tr>
			<td width="30">${dto.friend_id}</td>
			<td width="30">${dto.friend_name}</td>
			<td width="30"><a href="mypage_friend_delete.do?friend_num=${dto.friend_num}">[삭제]</a></td>
			</tr>
	</c:forEach>
	
				</tbody>
			</table>
			<!-- 등록 팝업창 추가 -->
						<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#friend_insert">
 친구 추가
</button>
			<!-- Modal -->
<div class="modal fade" id="friend_insert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">친구 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form role="form" action="mypage_friend_insert.do" method="post">
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 -->
				<div class="form-group">
					<label for="friend_id">
						아이디
					</label>
					<input type="text" class="form-control" id="friend_id" name="friend_id" />
				</div>
				<div class="form-group">
					<label for="friend_name">
						이름
					</label>
					<input type="text" class="form-control" id="friend_name" name="friend_name" />
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
</div>

<script src="resources/js/jquery-3.6.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.js"></script>
</body>
</html>
<%@ include file="../bottom.jsp"%>