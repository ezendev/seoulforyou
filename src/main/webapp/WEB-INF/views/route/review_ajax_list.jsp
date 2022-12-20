<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty listReview}">
	<tr>
		<td colspan="2">등록된 리뷰가 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="rdto" items="${listReview}">  
    <tr>
      <td>${rdto.review_star}</td>
      <td>${rdto.review_content}</td>
    </tr>
</c:forEach>