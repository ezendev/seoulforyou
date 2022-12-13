<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- test4.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp"%>

<html>

<head>
<title>마이페이지</title>
<script>
<%-- 모달창 끄면 이전 입력 정보 사라짐 --%>
$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});
</script>
 <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<script src="resources/js/jquery-3.6.1.min.js"></script>
<script src="resources/js/bootstrap.bundle.js"></script>
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
         	 내정보</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_route.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	나의 여행 루트 </a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_review.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
        	나의 리뷰</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_favorite.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	나의 즐겨찾기</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_friend.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	 친구 목록</a>
      </li>
      
      <li>
        <a class="nav-link js-scroll-trigger" href="mypage_qna.do">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	문의 내역</a>
      </li>
      
      <li>
        <a class="nav-link link-dark" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
          	회원 탈퇴</a>
      </li>
      
      <li>
        <a class="nav-link active" href="#">
          <svg class="bi pe-none me-2" width="16" height="16"></svg>
         	 로그아웃</a>
      </li>
    </ul>
    <hr>
  </aside>
		<div class="col-md-9">
        <h3>프로필</h3>
        <table class="table table-sm">
        <c:forEach var="mdto" items="${myMember }">
        <tr>
        <th>아이디</th>
        <td>member_id</td>
        </tr>
        <tr>
        <th>이름</th>
        <td>member_name</td>
        </tr>
        <tr>
        <th>이메일</th>
        <td>member_email</td>
        </tr>
        <tr>
        <th>전화번호</th>
        <td>member_hp</td>
        </tr>
        </c:forEach>
        </table>
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
         <!-- 후에 value값,수정버튼에 자바스크립트값 추가 update.do 추가 name추가 -->
         <%-- <input type="text" name="email" class="box" value="${getMember.email}">--%>
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


<script src="resources/js/jquery-3.6.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.js"></script>
</body>
</html>
<%@ include file="../bottom.jsp"%>
  </aside>

