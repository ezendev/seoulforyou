<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_friend_listmember.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<html>
<head>
<title>회원 검색</title>
</head>
<body>
<div align="center">
       <c:if test="${empty findmember}">
       <h3>회원 목록</h3>
	</c:if>
	<c:if test="${not empty findmember}">
	<form name="f" action="mypage_friend_listmember.do" method="post">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="id"<c:if test="${searchType=='id'}">selected</c:if>>아이디</option>
			<option value="name"<c:if test="${searchType=='name'}">selected</c:if>>이름</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="찾기">
	</form>
	</c:if>
       <table class="table table-sm table-hover">
                        <thead>
                          <tr>
                          <th>아이디</th>
                          <th>이름</th>
                          <th></th>                     
                        </thead>
                        <tbody>
                          <c:if test="${empty listMypageMember}">
                       <tr>
                 <td colspan="2">등록된 회원이 없습니다.</td>
                   </tr>
                   </c:if>
                   <c:forEach var="memberdto" items="${listMypageMember}">
		           		<c:if test="${sessionScope.nowUserNo ne memberdto.member_no}">
			           		 <tr>
			           		 	<td width="30">${memberdto.member_id}</td>
								<td width="30">${memberdto.member_name}</td>
								<td width="30">
								<a href="mypage_friend_insert.do?member_no=${memberdto.member_no}">[추가]</a>
								</td>
							</tr>
			           	</c:if>
	                 </c:forEach>
                               </tbody>
                                </table>
		 <div class="d-flex justify-content-center mt-3">
        <nav aria-label="Page navigation example" >
        <ul class="pagination">
            <c:if test="${not empty listMypageMember}">
                <c:if test="${startPage > pageBlock}">
              <li class="page-item"><a class="page-link"  
			 href="mypage_friend_listmember.do?pageNum=${startPage-1}" aria-label="Previous"> 
			 <span aria-hidden="true">&laquo;</span>
			 </a></li>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item"><a class="page-link" href="mypage_friend_listmember.do?pageNum=${i}">${i}</a>
		</li>
		</c:forEach>	
		<c:if test="${pageCount > endPage}">	
			 <li class="page-item">
				<a class="page-link"
		        	href="mypage_friend_listmember.do?pageNum=${endPage+1}" aria-label="Next"><span
							aria-hidden="true">&raquo;</span>
							</a>
							</li>
		</c:if>
	    </c:if>
        </ul>
        </nav>
        <br/><br/>
        <hr/>
</div>
   <script src="resources/js/jquery-3.6.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.js"></script>
<!--    <script>
   $(function(){
	   $('#msearchbtn').click(function(){
		 var url = document.location.href;
		 url = url + "?msearchType=" + $("#msearchbtn").val();
		 url = url + "&mkeyword=" + $("#mkeywordInput").val();
		 location.href = url;
	   });
   });
   </script> -->
</body>
</html>