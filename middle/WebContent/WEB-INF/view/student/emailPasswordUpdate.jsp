<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<title>비밀번호 변경 페이지입니다.</title>
</head>
<style>
	*, ::after, ::before {}
    	box-sizing: border-box;
	}
	.center-input {
        display: flex;
        justify-content: right;
        margin-right: 4.5em;
    }
    input + input {
		margin-left: 0.3em;
	}
</style>
<body>

	<div class="w-50 p-3 m-auto" style="margin-top:5em;">
		<main class="form-signin w-100 m-auto" style="padding-top: 7em;">
			<form method="post" id="save" action="<%=request.getContextPath()%>/student/emailPassUpdateResult.do">
				<h1 class="h3 mb-3 fw-normal" style="text-align: center;">비밀번호 변경</h1>
				<div class="form-floating w-75 m-auto"style="padding-bottom: 0.5em;">
					<input type="password" name="stu_pwdChange" class="form-control" placeholder="변경 비밀번호"> 
					<label for="floatingPassword">변경 비밀번호</label>
				</div>
				<div class="form-floating w-75 m-auto"style="padding-bottom: 0.5em;">
					<input type="password" name="stu_pwdCheck" class="form-control" placeholder="비밀번호 확인"> 
					<label for="floatingPassword">비밀번호 확인</label>
				</div>
				<br>
				<div class="center-input" style="padding-bottom: 5em;">
				<input class="w-10 btn btn-secondary" type="submit" id="saveBtn" value="저장"> 
				<input class="w-10 btn btn-secondary" type="submit" id="resetBtn" value="취소">
				</div>
			</form>
		</main>
	</div>

	<%@ include file="footer.jsp"%>