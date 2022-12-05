<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<html lang="en">
<head>
<title>관리자페이지</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.6.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- 해더 맨위 바 -->
<body>
	<header class="p-4 bg-dark text-white">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/"
				class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
				<svg class="bi me-2" width="40" height="50" role="img"
					aria-label="Bootstrap">
					<use xlink:href="#bootstrap"></use></svg>
			</a>
			<ul
				class="nav col-2 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="index.do" class="nav-link px-2 text-white"><h2
							style="font-size: 45px">
							<strong>관리자 페이지</strong>
						</h2></a></li>
			</ul>

			<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<input type="search" class="form-control form-control-dark"
					placeholder="Search..." aria-label="Search">
			</form>

			<div class="text-end">
				<button type="button" class="btn btn-outline-light me-2">검색</button>
				<button type="button" class="btn btn-warning">로그인</button>
			</div>
		</div>
	</header>


	<!-- 좌측 메뉴바 -->
	<nav
		class="bd-aside sticky-xl-top text-muted align-self-start d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
		style="width: 280px; float: left">
		<a href="index.do"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="60">
				<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">목록</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#dashboard"
				class="nav-link js-scroll-trigger text-white" aria-current="page">
					<svg class="bi me-2" width="32" height="60">
						<use xlink:href="#home"></use></svg>
					<h4>대시보드</h4>
			</a></li>
			<li><a href="#admininfo"
				class="nav-link js-scroll-trigger text-white"> <svg
						class="bi me-2" width="32" height="60">
						<use xlink:href="#speedometer2"></use></svg>
					<h4>관리자정보</h4>
			</a></li>
			<li><a href="#memberlist"
				class="nav-link js-scroll-trigger text-white"> <svg
						class="bi me-2" width="32" height="60"></svg>
					<h4>회원리스트</h4>
			</a></li>
			<li><a href="#qnalist"
				class="nav-link js-scroll-trigger text-white"> <svg
						class="bi me-2" width="32" height="60"></svg>
					<h4>문의리스트</h4>
			</a></li>
		</ul>
		<hr>
		<!-- 드롭다운메뉴 -->
		<div class="dropdown">
			<a href="#"
				class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
				id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="resources/img/monkey.jpg" alt="" width="32" height="32"
				class="rounded-circle me-2"> <strong>관리자</strong>
			</a>
			<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
				aria-labelledby="dropdownUser1">
				<li><a class="dropdown-item" href="#">내정보</a></li>
				<li><a class="dropdown-item" href="#">설정</a></li>
				<li><a class="dropdown-item" href="#">로그아웃</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="#">탈퇴</a></li>
			</ul>
		</div>
	</nav>


	<!-- 본문내용 -->
	<section class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="chartjs-size-monitor">
			<div class="chartjs-size-monitor-expand">
				<div class=""></div>
			</div>
			<div class="chartjs-size-monitor-shrink">
				<div class=""></div>
			</div>
		</div>
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

			<h1 id="dashboard" style="margin-left: 35px">대시보드</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
					<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
				</div>
				<button type="button"
					class="btn btn-sm btn-outline-secondary dropdown-toggle">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-calendar align-text-bottom"
						aria-hidden="true">
						<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
						<line x1="16" y1="2" x2="16" y2="6"></line>
						<line x1="8" y1="2" x2="8" y2="6"></line>
						<line x1="3" y1="10" x2="21" y2="10"></line></svg>
					This week
				</button>
			</div>
		</div>

		<!--차트가 그려질 부분-->
		<div style="width: 60%; height: 500px;">
			<canvas id="myChart"></canvas>
		</div>

		<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1','2','3','4','5','6','7'
                    ],
            datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                   	     }
                	    ]
               		 },
          options: {
                scales: {
                	yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
		<!-- 관리자정보페이지 -->
		<!-- 관리자정보는 최초에 db에 저장된 값이 나오게 해야하고 수정하기 버튼을 누르면 수정된 정보가 db에 수정되어 저장되야함 -->
		<h1 class="mb-3" id="admininfo" style="margin-left: 35px">관리자정보</h1>
		<form class="needs-validation" novalidate="">
			<div class="row g-3">
				<div class="col-5">
					<label for="lastName" class="form-label">성</label> <input
						type="search" class="form-control" id="lastName" autocomplete="on"
						placeholder="" value="" required="">
					<div class="invalid-feedback">Valid first name is required.</div>
				</div>

				<div class="col-5">
					<label for="firstName" class="form-label">이름</label> <input
						type="search" class="form-control" id="firstName"
						autocomplete="on" placeholder="" value="" required="">
					<div class="invalid-feedback">Valid last name is required.</div>
				</div>

				<div class="col-5">
					<label for="username" class="form-label">아이디</label>
					<div class="input-group has-validation">
						<span class="input-group-text">@</span> <input type="text"
							class="form-control" id="username" placeholder="#111223" required
							readonly>
						<div class="invalid-feedback">Your username is already
							selected.</div>
					</div>
				</div>

				<div class="col-5">
					<label for="userpassword" class="form-label">비밀번호</label>
					<div class="input-group has-validation">
						<input type="password" class="form-control" id="userpassword"
							placeholder="비밀번호" autofocus required="">
						<button class="btn btn-secondary">비밀번호 확인</button>
						<div class="invalid-feedback">Your password is required.</div>
					</div>
				</div>
			</div>

			<div class="col-6">
				<label for="email" class="form-label">Email <span
					class="text-muted">(선택사항)</span></label> <input type="email"
					class="form-control" id="email" placeholder="you@example.com">
				<div class="invalid-feedback">Please enter a valid email
					address for shipping updates.</div>
			</div>

			<div class="col-8">
				<label for="address" class="form-label">주소</label> <input
					type="search" class="form-control" id="address"
					placeholder="주소를 검색하세요" required="" readonly>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-secondary"
						style="text-decoration: none; color: white" id="address" onclick="goPopup()">주소찾기</button>
				</div>
				<div class="invalid-feedback">Please enter your shipping
					address.</div>
			</div>


			<hr class="my-4">
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="same-address">
				<label class="form-check-label" for="same-address">광고성 정보
					메일수신 받겠습니다</label>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="save-info">
				<label class="form-check-label" for="save-info">광고성 정보 메세지수신
					받겠습니다</label>
			</div>
			<hr class="my-4">
			<div class="d-flex justify-content-end">
				<button class="w-20 btn btn-primary btn-lg" type="submit">수정완료</button>
			</div>
		</form>

		<!-- 회원리스트페이지 -->
		<% %>
		
		
		
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 id="memberlist" style="margin-left: 35px">회원리스트</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
					<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
				</div>
				<button type="button"
					class="btn btn-sm btn-outline-secondary dropdown-toggle">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-calendar align-text-bottom"
						aria-hidden="true">
						<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
						<line x1="16" y1="2" x2="16" y2="6"></line>
						<line x1="8" y1="2" x2="8" y2="6"></line>
						<line x1="3" y1="10" x2="21" y2="10"></line></svg>
					This week
				</button>
			</div>
		</div>
		<h2>Section title</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">회원아이디</th>
						<th scope="col">회원비밀번호</th>
						<th scope="col">회원이메일</th>
						<th scope="col">회원전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 문의리스트페이지 -->
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 id="qnalist" style="margin-left: 35px">문의리스트</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
					<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
				</div>
				<button type="button"
					class="btn btn-sm btn-outline-secondary dropdown-toggle">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="feather feather-calendar align-text-bottom"
						aria-hidden="true">
						<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
						<line x1="16" y1="2" x2="16" y2="6"></line>
						<line x1="8" y1="2" x2="8" y2="6"></line>
						<line x1="3" y1="10" x2="21" y2="10"></line></svg>
					This week
				</button>
			</div>
		</div>
		<h2>Section title</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">문의번호</th>
						<th scope="col">문의주제</th>
						<th scope="col">문의내용</th>
						<th scope="col">작성자</th>
						<th scope="col">작성시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
					<tr>
						<td>1,001</td>
						<td>random</td>
						<td>data</td>
						<td>placeholder</td>
						<td>text</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>

	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-3 d-flex align-items-center">
			<a href="/"
				class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
				<svg class="bi" width="30" height="24">
					<use xlink:href="#bootstrap"></use></svg>
			</a> <span class="text-muted">© Seoulforus, Inc</span>
		</div>

		<ul class="nav col-md-3 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><img src="resources/img/naver.png" alt=""
				width="24" height="24" class="bi"></li>
			<li class="ms-3"><img src="resources/img/facebook.png" alt=""
				width="24" height="24" class="bi"></li>
			<li class="ms-3"><img src="resources/img/instagram.png" alt=""
				width="24" height="24" class="bi"></li>
		</ul>
	</footer>
</body>
<!-- 주소찾기 API 사용 JS함수 -->
	<script language="javascript">
	function goPopup(){
		var pop = window.open("jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
		}
	function jusoCallBack(roadFullAddr){
		var addressEl = document.querySelector("#address");
		addressEl.value = roadFullAddr;
			}

</script>
</head>
</body>
</html>