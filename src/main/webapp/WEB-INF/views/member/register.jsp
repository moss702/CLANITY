<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="${cp}/css/register.css">
</head>

<body>
		<div class="login-container">
			<div class="text-center mb-4">
				<h4>회원가입</h4>
			</div>

			<form class="join-form" action="${cp}/member/register" method="post">
				<div class="mb-3 icon-input">
					<i class="fa fa-user"></i>
					<input type="text" name="email" class="form-control" id="email"placeholder="이메일">
				</div>
				
				<div class="mb-3 icon-input my-0">
					<i class="fa fa-lock lockicon"></i> <input type="password"
						class="form-control" name="password" id="password" placeholder="비밀번호"> <i
						class="fa fa-eye pe-auto" id="togglePassword"></i>
				</div>
				<p class="small text-center text-muted my-2">영문, 숫자, 특수문자 조합 8자 이상 입력해주세요</p>

				<div class="mb-3 icon-input">
					<i class="fa fa-lock lockicon"></i> <input type="password"
						class="form-control" name="pwck" id="pwck" placeholder="비밀번호 확인"> <i
						class="fa fa-eye pe-auto" id="togglePassword"></i>
				</div>
				<div class="form-check ">
					<input class="form-check-input" type="checkbox" id="termsCheck">
					<label class="form-check-label small" for="termsCheck"> <a href="#">CLANITY
						이용약관</a> 및 <a href="#">개인정보 보호 정책</a> 동의 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="marketingCheck">
					<label class="form-check-label small" for="marketingCheck"> <a href="#">맞춤
						서비스 제안 등 마케팅 정보수신</a> 동의 </label>
				</div>
				
				<button type="submit" class="btn login-btn">가입하기</button>

				<div class="bottom-text">
					이미 아이디가 있으신가요? <a href="${cp}/member/login">로그인하기</a>
				</div>
			</form>
		</div>
	<script>
	
	
	
		$(function() {
			$("#togglePassword").on(
					"click",
					function() {
						const $passwordInput = $(this).siblings(
								"input[type='password'], input[type='text']");

						const currentType = $passwordInput.attr("type");
						const newType = currentType === "password" ? "text"
								: "password";
						$passwordInput.attr("type", newType);
					});
		});
	</script>
</body>

</html>