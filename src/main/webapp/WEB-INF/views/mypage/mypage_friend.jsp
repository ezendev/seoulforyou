<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="mypage.jsp"%>

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
<%-- 회원 검색창--%>
function checkMember(){
	window.open("mypage_friend_listmember.do", "", "width=800, height=800")
}
</script>

<div class="wrapper col-md-9">
	<div class="content-wrapper">
	<section class="content-header">
          <h2 id="mypage_friend" align="center">친구 목록</h2>   
    </section>
    
    <section class="content container-fluid">
    	<div class="col-lg-12">
            <div class="box box-primary">
               <div class="box-body">
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
							<c:forEach var="mdto" items="${listFriend}">
								<tr>
									<td width="30">${mdto.member_id}</td>
									<td width="30">${mdto.member_name}</td>
									<td width="30">
									<a href="mypage_friend_delete.do?friend_no=${mdto.member_no}">[삭제]</a>
									</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
					<a role="button" class="btn btn-primary" href="javascript:checkMember()" style="float:right">
					 친구 추가
					</a>
				</div>
			</div>
		</div>
	</section>
	</div>
</div>
<%@ include file="../bottom.jsp"%>