<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- test4.jsp -->
<%@ include file="../top.jsp"%>

<html>

<head>
<title>마이페이지</title>
<script>
function getselect() {
    const value = e.value;

    document.getElementById('result').innerText = value;
   
}
</script>
<style type="text/css">
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})
</style>
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
        <a class="nav-link js-scroll-trigger" aria-current="page" href="#profile">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          내정보
        </a>
      </li>
      <li>
        <%-- 클릭시 mypage_route 페이지로 넘어가게 수정 <a href="mypage_route.do"> --%>
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
			<div class="card col-md-4">
			<div class="mt-0 text-center">
			<h3 class="mb-4">member_name</h3>
			<span class="text-muted d-block mb-4">member_id</span>
			<span class="text-muted d-block mb-4">member_email</span>
			<span class="text-muted d-block mb-4">member_hp</span>
			</div>

       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile_update">
                 수정
       </button>

<!-- Modal -->
<div class="modal fade" id="profile_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">정보 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form role="form">
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 update.do 추가? -->
         <%-- <input type="text" name="email" class="box" value="${getMember.email}"> --%>
				<div class="form-group">
					<label for="member_passwd">
						비밀번호
					</label>
					<input type="password" class="form-control" id="member_passwd" />
				</div>
				<div class="form-group">
					 
					<label for="member_email">
						이메일
					</label>
					<input type="text" class="form-control" id="member_email" />
				</div>
				<div class="form-group">
					<label for="member_hp">
						전화번호
					</label>
					<input type="text" class="form-control" id="member_hp" />
				</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">입력</button>
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</div>
			<%-- <%-- <div class="box-footer">
    <div class="form-group col-sm-1">
        <select class="form-control" name="fasearch" id="fasearch">
            <option value="fn" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>::: 선택 :::<</option>
            <option value="ftitle" <c:out value="${searchCriteria.searchType eq 'ftitle' ? 'selected' : ''}"/>>제목<</option>
            <option value="fcate" <c:out value="${searchCriteria.searchType eq 'fcate' ? 'selected' : ''}"/>>구분<</option>
            <option value="ftcon" <c:out value="${searchCriteria.searchType eq 'ftcon' ? 'selected' : ''}"/>>제목+내용<</option>
        </select>
    </div>
    <div class="form-group col-sm-4">
        <div class="input-group">
            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
            <span class="input-group-btn">
                <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                    <i class="fa fa-search"></i> 검색
                </button>
            </span>
        </div>
    </div> --%>
			<h3 id="mypage_friend">
				친구 목록
			</h3>
			<!-- 친구 테이블 추가 -->
			<table class="table table-sm table-hover">
				<thead>
					<tr>
						<th>
							번호
						</th>
						<th>
							아이디
						</th>
						<th>
							이름
						</th>
					</tr>
				</thead>
				<tbody>
				<%-- <c:if test="${empty listMember}">
		<tr>
			<td colspan="7">등록된 친구가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listMember}">
		<tr> 친구 테이블 추가 필요
			<td>${dto.friend_no}</td>
			<td>${dto.friend_id}</td>
			<td>${dto.friend_name}</td>
	</c:forEach> --%>
					<tr class="table-success">
						<td>
							1
						</td>
						<td>
							ㅁㅁㅁ
						</td>
						<td>
							ㄷㄷㄷ
						</td>
					</tr>
					<tr class="table-success">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
					</tr>
					<tr class="table-success">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
					</tr>
					<tr class="table-success">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 등록 팝업창 추가 -->
						<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#friend_update">
 친구 추가
</button>
			<!-- Modal -->
<div class="modal fade" id="friend_update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">친구 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <form role="form">
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 -->
				<div class="form-group">
					<label for="friend_id">
						아이디
					</label>
					<input type="text" class="form-control" id="friend_name" />
				</div>
				<div class="form-group">
					<label for="friend_name">
						이름
					</label>
					<input type="text" class="form-control" id="friend_id" />
				</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">입력</button>
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
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