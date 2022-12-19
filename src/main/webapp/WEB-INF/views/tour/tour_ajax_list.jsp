<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container text-center">
	<h5>이 여행지가 포함된 여행루트</h5>
	<div class="container text-center">
		<div class="row mt-3">
		<c:if test="${empty includeRouteList}">
			<div class="col">
				<div class="container">	
					<p class="text-muted">여행루트가 없습니다.<br>여행루트를 만들어보세요!</p>
				</div>
			</div>
		</c:if>
		<c:forEach begin="0" end="2" var="tmp" items="${includeRouteList}">
			<div class="col">
				<div class="container">	
					<div class="card h-100">
						<img class="card-img-top" src="resources/img/route1.jpeg" alt="Card image" style="width:100%">
						<div class="card-text">
							<div class="d-grid gap-2">
								<a href="routeList.do?route_no=${tmp.route_no}" class="btn btn-secondary btn-sm">${tmp.route_subject}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>