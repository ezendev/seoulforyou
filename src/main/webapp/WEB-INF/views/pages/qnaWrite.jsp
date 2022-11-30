<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script>
	function qnaWrite(){
		location.href="qnaWrite.do";
	} 
	if (!f.subject.value){
		alert("제목을 입력해 주세요!!")
		f.subject.focus()
		return false
	}
	if (f.content.value==""){
		alert("내용을 입력해 주세요!!")
		f.content.focus()
		return false
	}
	}
	</script>
	<link rel="stylesheet" href="resources/js/bootstrap.min.js">
	<style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 590px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
	</style>		
	<title>회원가입</title>
</head>

<body>
	<form name="f" action="write_board.do" method="post" onsubmit="return checkBoard()">
		<input type="hidden" name="num" value="${param.num}"/>
		<input type="hidden" name="re_step" value="${param.re_step}"/>
		<input type="hidden" name="re_level" value="${param.re_level}"/>
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">문의하기</h4>
					<div class="mb-3" align="left">
						<label for="exampleFormControlInput1" class="label">이름</label> 
						<input
							type="textfield" class="form-control"
							id="exampleFormControlInput1" placeholder="">
					</div>
					
					<div class="mb-3" align="left">
						<label for="exampleFormControlInput1" class="label">제목</label> 
						<input
							type="textfield" class="form-control"
							id="exampleFormControlInput1" placeholder="title">
					</div>
					
					<div class="mb-3" align="left">
						<label for="exampleFormControlInput1" class="label">email</label> 
						<input
							type="textfield" class="form-control"
							id="exampleFormControlInput1" placeholder="">
					</div>
																	
					<div class="mb-3" align="left">
						<label for="exampleFormControlTextarea1" class="form-label">문의내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
					
					<div class="mb-3" align="left">
						<label for="password">비밀번호</label> 
						<input
							input type="password" id="passwd" class="form-control" placeholder="Password">
					</div>						
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input class="btn btn-outline-secondary" type="reset" value="취소">
						<input class="btn btn-primary" type="submit" value="제출">
					</div>

				</div>
			</div>
			<footer class="my-3 text-center text-small">
				<p class="mb-1">&copy; 2022 EzDev</p>
			</footer>
		</div>
	</form>
</body>
</html>