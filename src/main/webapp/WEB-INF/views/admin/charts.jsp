<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navBar.jsp" %>
<!DOCTYPE html>
<!-- 통계입니다 -->
<html lang="en"> 
<title>통계</title>
<!-- 통계입니다 -->
   
     <!-- 프로필 설정 항목 살려주기. -->
             
            <!-- 본문 내용 시작입니다 -->
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">통계자료</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                	회원가입 추이
                            </div>
                            <div class="card-body"><canvas id="memberChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        	주간 리뷰 수
                                    </div>
                                    <div class="card-body"><canvas id="reviewChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        	여행루트 테마
                                    </div>
                                    <div class="card-body"><canvas id="routeChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
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
    		    }
    		  });
        	
        	
        	var datas = []; // 데이터 담을 배열
	        <c:forEach items='${memberChartValue}' var='num'>
		        var num = '${num}'; 
		        datas.push(num);
	        </c:forEach>
	     	// 배열 거꾸로
	        const reverse = datas.reverse();
	     	console.log(reverse);
	        
		  
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
    		    options: {
    		        scales: {
    		          y: {
    		            beginAtZero: true
    		          }
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
        	//여행루트테마 차트	        
		  const routeCtx = document.getElementById('routeChart');
		
		  var routeChart = new Chart(routeCtx, {
		    type: 'pie',
		    data: {
		    	labels: [
		    	    '힐링',
		    	    '미식',
		    	    '한류',
		    	    '명소',
		    	    '쇼핑'
		    	  ],
		    	  datasets: [{
		    	    label: '여행테마',
		    	    data: [10, 50, 100, 20, 30],
		    	    backgroundColor: [
		    	      'rgb(255, 99, 132)',
		    	      'rgb(54, 162, 235)',
		    	      'rgb(255, 205, 86)',
		    	      'rgb(135, 219, 84)',
		    	      'rgb(216, 113, 207)'
		    	    ],
		    	    hoverOffset: 4
		    	  }
		    	  ]
		    }
		  });
		  
		  var datas = []; // 각 테마별 갯수 담을 배열
	        <c:forEach items='${routeChartValue}' var='num'>
	        var num = '${num}'; 
	        datas.push(num);
	     	</c:forEach>
		  
		  var dataset = routeChart.data.datasets;

		  for(var i=0; i<dataset.length; i++){
				//데이터 갯수 만큼 반복
				var data = dataset[i].data;
				for(var j=0 ; j < data.length ; j++){
					data[j] = datas[j];
				}
			}
			
			routeChart.update();
		  
		</script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="resources/demo/chart-area-demo.js"></script>
        
		         <!-- 관리자등록 모달 내용 --> 	
		    					 
		    					 	
		                 		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		                      	<div class="modal-dialog">
		                      	<div class="modal-content">
		                      	<!-- 모달 header입니다 -->
		     				  	<div class="modal-header bg-light">
		                        <h1 class="modal-title fs-5" id="staticBackdropLabel"><strong>관리자 등록</strong></h1>  <!-- fs는 폰트 크기입니다 -->
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>  <!-- 창의 취소 버튼입니다 -->
		      					</div>
		      					<!-- 모달header 끝입니다 -->
		      					
		      				     <!-- 모달 등록내용입니다 -->
		    					<div class="modal-body" style="height:250px">
		     				
		                	
		                               			  <div class="border-1 rounded-lg">
		                                        
		                                           		<div class="row mb-3">
		                                           		<div class="col-md-6">
		                                                <div class="form-floating mb-3 mb-md-0">
		                                                <input class="form-control" id="inputId" type="text" placeholder="아이디를 입력하세요" />
		                                                <label for="inputId">아이디</label>
		                                                </div>
		                                                </div>
		                                           		
		                                                <div class="col-md-6">
		                                                <div class="form-floating">
		                                                <input class="form-control" id="inputName" type="text" placeholder="이름을 입력하세요"/>
		                                                <label for="inputName">성함</label>
		                                                </div>
		                                           		</div>
		                                           		</div>
		                                          
		                                           	    <div class="form-floating mb-3">
		                                                <input class="form-control" id="inputEmail" type="email" placeholder="email@seoulforus.com" />
		                                                <label for="inputEmail">이메일 주소</label>
		                                           		</div>
		                                           		
		                                            	<div class="row mb-3">
		                                                <div class="col-md-6">
		                                                <div class="form-floating mb-3 mb-md-0">
		                                                <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호를 입력하세요" />
		                                                <label for="inputPassword">비밀번호</label>
		                                                </div>
		                                                </div>
		                                                
		                                                <div class="col-md-6">
		                                                <div class="form-floating mb-3 mb-md-0">
		                                                <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="비밀번호 확인" />
		                                                <label for="inputPasswordConfirm">비밀번호 확인</label>
		                                                </div>
		                                                </div>
		                                           		</div>
		                            				</div>
			       							   	 </div>
		      							<!-- 모달 footer입니다 -->
		                                   <div class="modal-footer">
		        						   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        						   <button type="button" class="btn btn-primary">등록</button>
		      							   </div>
		      						 <!-- 모달footer끝입니다 -->
		      							   </div>
		      					   	<!-- 모달content끝입니다 -->
		    							   </div>
		    						<!-- 모달 dialog끝입니다 -->
		 								   </div>
		                            <!-- 관리자등록 모달 내용 끝입니다 -->
        
    </body>
</html>
