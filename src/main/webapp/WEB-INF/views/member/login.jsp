<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<style>
.login-card {
	max-width: 400px;
	margin: auto;
	margin-top: 100px;
	border-radius: 1rem;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-control::placeholder {
	color: #999;
}

.icon-input {
	position: relative;
}

.icon-input i {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
}

.icon-input input {
	padding-left: 2.5rem;
}

.toggle-password {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #999;
}
</style>
</head>
<body>
	<div class="card login-card p-4">
		<h4 class="text-center mb-4">로그인</h4>

		<div class="mb-3 icon-input">
			<i class="fas fa-user"></i> <input type="email" class="form-control"
				placeholder="이메일">
		</div>

		<div class="mb-3 icon-input position-relative">
			<i class="fas fa-lock"></i> <input type="password"
				class="form-control" id="password" placeholder="비밀번호"> <i
				class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
		</div>

		<button class="btn btn-secondary w-100 mb-2" disabled>로그인</button>

		<div class="d-flex justify-content-between">
			<a href="#" class="small text-muted">비밀번호 재설정</a>
		</div>

		<div class="text-center mt-3">
			<span class="text-muted">아직 회원이 아니신가요? </span> <a href="#"
				class="fw-bold text-dark">회원가입</a>
		</div>
	</div>

	<script src="https://kit.fontawesome.com/a2e0f1f0fc.js"
		crossorigin="anonymous"></script>
	<script>
		function togglePassword() {
			const pwd = document.getElementById('password');
			const icon = document.querySelector('.toggle-password');
			if (pwd.type === "password") {
				pwd.type = "text";
				icon.classList.remove("fa-eye");
				icon.classList.add("fa-eye-slash");
			} else {
				pwd.type = "password";
				icon.classList.remove("fa-eye-slash");
				icon.classList.add("fa-eye");
			}
		}
	</script>
</body>
</html>