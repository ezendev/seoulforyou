<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>


 <div class="container-fluid px-4">
	<h1>API 관리</h1><br>
	<div class="card mb-5"></div>
	<label>API 호출 후 DB에 저장</label>
	<form name="f" action="dbSave.do" method="post">
	<div class="row justify-content">
		<select class="form-select" name="api" style="width:200px">
			<option value="TbVwEntertainment">문화</option>
			<option value="TbVwAttractions">명소</option>
			<option value="TbVwNature">자연</option>
			<option value="TbVwRestaurants">음식</option>
			<option value="LOCALDATA_031101">숙박</option>
		</select>
		<button class="btn btn-outline-dark ms-2" type="submit" style="width:100px">DB 저장</button>
	</div>
	</form>
	<label>DB에서 API삭제하기</label>
	<form name="f" action="dbDelete.do" method="post">
	<div class="row justify-content">
		<select class="form-select" name="api" style="width:200px">
			<option value="TbVwEntertainment">문화</option>
			<option value="TbVwAttractions">명소</option>
			<option value="TbVwNature">자연</option>
			<option value="TbVwRestaurants">음식</option>
			<option value="LOCALDATA_031101">숙박</option>
		</select>
		<button class="btn btn-outline-dark ms-2" type="submit" style="width:100px">DB 삭제</button>
	</div>
	</form>
	</div>
	
	
				
				 <footer class="py-4 bg-light mt-auto">
			                    <div class="container-fluid px-4">
			                        <div class="d-flex align-items-center justify-content-between small">
			                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
			                            <div>
			                                <a href="#">Privacy Policy</a>
			                                &middot;
			                                <a href="#">Terms &amp; Conditions</a>
				                            </div>
				                        </div>
				                    </div>
				                </footer>
				            </div>
				        </div>
				        </main>
				        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
				        <script src="resources/js/scripts.js"></script>
				        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
				        <script src="resources/demo/chart-area-demo.js"></script>
				        <script src="resources/demo/chart-bar-demo.js"></script>
				        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
				        <script src="resources/js/datatables-simple-demo.js"></script>
			</body>
		</html>