<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<title>관리자 페이지</title>

    <!-- 대시보드 항목입니다 -->
    <div class="container-fluid px-4">
        <h1 class="mt-4">대시보드</h1>
        <div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i>
                           	회원가입 추이
					</div>
					<div class="card-body">
						<canvas id="memberChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>
            </div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i>
                         	주간 리뷰 수
					</div>
					<div class="card-body">
						<canvas id="reviewChart" width="100%" height="50"></canvas>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>
			</div>
		</div>
		</div>
          
     		<div class="container-fluid px-4">
                        <h1 class="mt-4">회원목록</h1><br>
                        <div class="card mb-4"></div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Member
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </thead>
                                     
                                     <c:if test= "${empty listOfMember}">
                                     	<tr>
                                     	<td colspan="6">등록된 회원이 없습니다</td>
                                     	</tr>
                                     </c:if>
                                      <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>비밀번호</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </tfoot>
                                     <tbody>
                                         <c:forEach var="dto" items= "${listOfMember}">	
                                        <tr>
                                            <td>${dto.member_no}</td>
                                            <td>${dto.member_name}</td>
                                            <td>${dto.member_id}</td>
                                            <td>${dto.member_passwd}</td>
                                            <td>${dto.member_email}</td>
                                            <td>${dto.member_hp}</td>
                                        </tr>
                                        </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
		            
		    </main>
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
				        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
				        <script src="resources/js/scripts.js"></script>
				        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
				        <script src="resources/demo/chart-area-demo.js"></script>
				        <script src="resources/demo/chart-bar-demo.js"></script>
				        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
				        <script src="resources/js/datatables-simple-demo.js"></script>
    
    
    					 <!-- 관리자등록 모달 내용 --> 	
                 		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                      	<div class="modal-dialog">
                      	<div class="modal-content">
     				  	<div class="modal-header bg-light">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>관리자 등록</strong></h1>  <!-- fs는 폰트 크기입니다 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>  <!-- 창의 취소 버튼입니다 -->
      					</div>
	    				<div class="modal-body" style="height:380px">
	  					<div class="border-1 rounded-lg">
	  					
	  					<form name="f" action="admin_input_ok.do" method="post" enctype="multipart/form-data">
	              		<div class="row mb-3">
	              		<div class="col-md-6">
	                   <div class="form-floating mb-3 mb-md-0">
	                   <input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="아이디를 입력하세요" />
	                   <label for="admin_id">아이디</label>
	                   </div>
	                   </div>
	                   <div class="col-md-6">
	                   <div class="form-floating">
	                   <input class="form-control" id="admin_name" name="admin_name" type="text" placeholder="이름을 입력하세요"/>
	                   <label for="admin_name">성함</label>
	                   </div>
	              		</div>
	              		</div>
	              	    <div class="form-floating mb-3">
	              	    <input class="form-control" id="admin_email" name="admin_email" type="email" placeholder="email@seoulforus.com" />
	                   <label for="admin_email">이메일 주소</label>
	              		</div>
		               	<div class="row mb-3">
		                   <div class="col-md-6">
		                   <div class="form-floating mb-3 mb-md-0">
		                  <input class="form-control" id="admin_passwd" name="admin_passwd" type="password" placeholder="비밀번호를 입력하세요" />
		                   <label for="admin_passwd">비밀번호</label>
		                   </div>
		                   </div>
	                   <div class="col-md-6">
	                   <div class="form-floating mb-3 mb-md-0">
	                    <input class="form-control" id="admin_passwd_confirm" name="admin_passwd_confirm" type="password" placeholder="비밀번호 확인" 
	                    onkeyup="passConfirm()"/>
	                    <div id="confirmMsg"></div>
	                    <label for="admin_passwd_confirm">비밀번호 확인</label>
	                    <script type="text/javascript">
	                            function passConfirm(){
	                           var admin_passwd = document.getElementById('admin_passwd');
	                           var admin_passwd_confirm = document.getElementById('admin_passwd_confirm');
	                           var confrimMsg = document.getElementById('confirmMsg');
	                           var correctColor = "blue";
	                           var wrongColor ="red";
	                            	
	                           if(admin_passwd.value == admin_passwd_confirm.value){
	                        	   confirmMsg.style.color = correctColor;
	                        	   confirmMsg.innerHTML ="비밀번호 일치";
	                           }else{
	                        	  	confirmMsg.style.color = wrongColor;
	                   				confirmMsg.innerHTML ="비밀번호 불일치";
	                           }
	                            }
	                            </script>
	                    	</div>
	                   	 </div>
	              		</div>
              		<!-- 파일 업로드 -->
					<table class="form-floating mb-3 mb-md-0" >
					<tbody>
					<tr>
					<th>프로필 이미지 첨부 </th>
						<tr>
						<td>
					<input type="file" name="admin_profileImg" id="admin_profileImg" accept="image/*">
					<input type="hidden" name="admin_id" id="admin_id" value="${sessionScope.adto.admin_id}">
					<input type="reset" value="취소" >
                     		</td>
                     		</tr>	
                     		</tbody>
                     		</table>
                     		
							<!-- 모달 footer입니다 -->
			               <div class="modal-footer">
						   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						   <input type="submit" class="btn btn-primary" value="등록">
					  	   </div>
      						</form>
      						</div>
      						</div>
      						 <!-- 모달footer끝입니다 -->
      							   </div>
      					   	<!-- 모달content끝입니다 -->
    							   </div>
    						<!-- 모달 dialog끝입니다 -->
 								   </div>
                            <!-- 관리자등록 모달 내용 끝입니다 -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    	//지난주, 이번주 회원가입 인원수 차트
    	const memberCtx = document.getElementById('memberChart');
    	
    	const WEEKS = [
    		  '지난 월',
    		  '지난 화',
    		  '지난 수',
    		  '지난 목',
    		  '지난 금',
    		  '지난 토',
    		  '지난 일',
    		  '월',
    		  '화',
    		  '수',
    		  '목',
    		  '금',
    		  '토',
    		  '일'
    		];

    	function weeks(config) {
    		  var cfg = config || {};
    		  var count = cfg.count || 14;
    		  var section = cfg.section;
    		  var values = [];
    		  var i, value;

    		  for (i = 0; i < count; ++i) {
    		    value = WEEKS[Math.ceil(i) % 14];
    		    values.push(value.substring(0, section));
    		  }

    		  return values;
    		}
    	
    	const labels = weeks({count: 14});
    	
    	var memberChart = new Chart(memberCtx, {
		    type: 'line',
		    data: {
		    	labels: labels,
		    	  datasets: [{
		    	    label: '가입자 수',
		    	    data: [10, 50, 100, 20, 30, 10, 20, 10, 50, 100, 20, 30, 10, 20],
		    	    fill: false,
		    	    borderColor: 'rgb(75, 192, 192)',
		    	    tension: 0.1
		    	  }
		    	  ]
		    },options:{
 		  		scales:{
 		  			y: {
 		  				suggestedMin: 10
 		  			}
 		  		},
		    	ticks:{
		    		stepSize: 1
		    		}
		    }
		  });
    	
    	
    	var datas = []; // 데이터 담을 배열
     <c:forEach items='${memberChartValue}' var='num'>
      var num = '${num}'; 
      datas.push(num);
     </c:forEach>
  	// 배열 거꾸로
     const reverse = datas.reverse();
      
 
 var dataset = memberChart.data.datasets;
 for(var i=0; i<dataset.length; i++){
	//데이터 갯수 만큼 반복
	var data = dataset[i].data;
	for(var j=0 ; j < data.length ; j++){
		data[j] = datas[j];
	}
}

memberChart.update();
     	
</script>

 
 <script>
     	//이번주 리뷰수 차트
     	const reviewCtx = document.getElementById('reviewChart');
     	var reviewChart = new Chart(reviewCtx, {
 		    type: 'bar',
 		    data: {
 		    	labels: [
 		    	    '월',
 		    	    '화',
 		    	    '수',
 		    	    '목',
 		    	    '금',
 		    	    '토',
 		    	    '일'
 		    	  ],
 		    	  datasets: [{
 		    	    label: '리뷰 수',
 		    	    data: [0, 0, 0, 0, 0, 0, 0],
 		    	    borderWidth: 1
 		    	  }
 		    	  ]
 		    },
 		  	 options:{
 		  		scales:{
 		  			y: {
 		  				suggestedMin: 10
 		  			}
 		  		},
		    	ticks:{
		    		stepSize: 1
		    		}
		    }
 		  });
     	
     	var datas = []; // 일별 리뷰갯수 담을 배열
      <c:forEach items='${reviewChartValue}' var='num'>
      var num ='${num}';
      datas.push(num);
   	</c:forEach>
 
 var dataset = reviewChart.data.datasets;

 for(var i=0; i<dataset.length; i++){
	//데이터 갯수 만큼 반복
	var data = dataset[i].data;
	for(var j=0 ; j < data.length ; j++){
		data[j] = datas[j];
	}
}

reviewChart.update();
</script>

<script>
function adminLogout(){
	location.href="adminLogout.do";
}
</script>
</body>
</html>
