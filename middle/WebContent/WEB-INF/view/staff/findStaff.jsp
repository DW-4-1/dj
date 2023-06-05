<%@page import="kr.or.dw.util.SendEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 찾기 페이지입니다.</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/dist/css/adminlte.min.css">
</head>

<style>
/* 백그라운드 이미지에 투명도를 주기 위한 가상요소 */
	.box01::before {
        background: url(../img/행정관.jpg);
        background-size: cover;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        content: "";
        opacity: 0.99;
	}
</style>

<script>
	$(function(){
		let ver_code = null;
		
		$('#idEmailChkBtn').on('click', function(){
			let staff_id = $('#staff_id').val();
			let staff_email = $('#staff_email').val();
			console.log(staff_id);
			console.log(staff_email);
			$.ajax({
				url : "<%=request.getContextPath()%>/staff/idEmailCheck.do",
				method : "post",
				dataType : "json",
				data : {
					"staff_id" : staff_id,
					"staff_email" : staff_email
				},
				success : function(res){
					if(res != null){
						console.log(res);
						ver_code = res;
						alert("인증코드가 전송되었습니다.");
						$('#ver_code').css("display", "");
						$('#verCodeBtn').css("display", "");
					}else{
						alert("아이디 혹은 이메일이 일치하지 않습니다.");
					}
				},
				error : function(err){
					
				}
			});
		});
		
		$(document).on('click', '#verCodeBtn', function(e) {
			staff_id = $('#staff_id').val();
			if($('#ver_code').val() == ver_code){
			alert("인증코드가 일치.");
			location.href="<%=request.getContextPath()%>/staff/emailstaffPasswordUpdate.do" + staff_id;
			}else{
				alert("인증코드가 잘못입력되었습니다.");
			}
		});
	})
</script>
</head>

<body class="login-page box01">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>DW</b>&nbsp;종합정보시스템</a>
		</div>
		
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">비밀번호 찾기</p>
				<form id="findstupwd" action="" method="post">
					<div class="input-group mb-3">
						<input type="text" id="staff_id" name="staff_id" class="form-control" placeholder="ID">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<input type="text" id="staff_email" name="staff_email" class="form-control" placeholder="e-mail">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-12">
							<input type="button" id="idEmailChkBtn" value="인증코드 전송" class="btn btn-primary btn-block">
						</div>
					</div>
					<div class="input-group mb-3" style="margin-top:1em;">
						<input type="text" id="ver_code" name="ver_code" class="form-control" placeholder="인증코드 입력" style="display: none">
					</div>
					<div class="row">
						<div class="col-12">
							<input type="button" id="verCodeBtn" value="인증코드 확인" class="btn btn-block btn-success" style="display: none">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script
	src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script
	src="<%=request.getContextPath()%>/assets/dist/js/adminlte.min.js"></script>