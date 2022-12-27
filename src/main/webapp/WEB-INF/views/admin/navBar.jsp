<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  <head>
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="resources/js/jquery-3.6.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<script src="reousrces/css/styles.css"></script>
		<script src="resources/demo/chart-pie-demo.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
   </head>
    
  <!-- 상단 네비바 메뉴 구성 -->
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.do">SeoulforUs 관리자</a>
            <!-- fas fa-bars를 통해 토글버튼 기능 생성-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar 여백칸 주기 위해-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></div>
            <!-- Navbar-->
	            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <!-- fa-user로 기본 이미지 구현 -->
                <!-- <i class="fas fa-user fa-fw"></i> 기본 아이콘 -->
				<img id="profile_img" class="profile_img" src="https://ezdev-sfy.s3.ap-northeast-2.amazonaws.com/admin/${profile_img}" style="border-radius:50%; width:40px; height:40px" />                   
	            </ul>
        </nav>
        
        
        <!-- 좌측 네비메뉴바 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="admin.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                               	 대시보드
                            </a>
                           <div class="dropdown-divider" style="border-color:gray"> </div>
                           <a class="nav-link" href="charts.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	통계자료
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                               	데이터 항목
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="table_member.do">회원리스트</a>
                                    <a class="nav-link" href="table_qna.do">문의리스트</a>
                                     <a class="nav-link" href="dbTemp.do">관광API</a>
                                </nav>
                            </div>
                           <div class="dropdown-divider" style="border-color: gray"></div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                	관리자 프로필
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                 
                                   <!--관리자등록 모달 기능 구현하기 -->
                                <div class="nav-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                    		관리자 등록
                                </div>   
                                
                                 <!-- 프로필 설정 항목 살려주기 -->
		                                <a class="nav-link" href="profile.do" >프로필 수정</a>
		                               </nav>
		                               </div>
		                      		  </div>
		                    		</div>
				                    <div class="sb-sidenav-footer">
				                    <c:if test="${not empty adto}">
				                    <button class="btn btn-danger" type="submit" onclick="javascript:adminLogout()">로그아웃</button>
				                    </c:if>
				                    </div>
				                </nav>
				            </div>
					            <div id="layoutSidenav_content">
					                <main>
					                
					                
					                
					       
      				
      				  
					                
					                
     
    
           