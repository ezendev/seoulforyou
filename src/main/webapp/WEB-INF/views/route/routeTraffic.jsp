<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<head>
	    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
	    <script src="resources/js/bootstrap.bundle.min.js"></script>
	    <link rel="stylesheet" href="resources/js/bootstrap.min.js">

	    <title>Bootstrap demo</title>
 	</head>

<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
  RootPage
</button>

<!-- The Modal -->
<div class="modal" id="myModal" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">	
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
	<div class="modal-body">
	<div class="container p-3 my-3 border">
		<div class="container text-center">
		<div class="row">
			<div class="col-5">
				<h4 align="left">교통편</h4>
				<div class="container pt-5 my-5 border">
					<p align="left"><img src="resources/icon/walking-9054.svg" width="30"> : 40min</p><br>
					<p align="left"><img src="resources/icon/car-front.svg" width="30"> : 10min</p><br>
					<p align="left"><img src="resources/icon/bus-1043.svg" width="30"> : 15min</p><br>
					<p align="left"><img src="resources/icon/train-lightrail-front.svg" width="30"> : 13min</p>
					
				</div>
			</div>
			<div class="col-7">
			<h4 align="left">지도</h4>
			<div class="container pt-7 my-5 border">
			<img src="resources/img/route2.png" width="100%" height="71%">
			</div>
			</div>
		</div>
 		 </div>
	</div>
 </div>
</div>       
        &nbsp;&nbsp;
 </div>
</div>
      <!-- Modal footer -->
      <div class="modal-footer"></div>


     