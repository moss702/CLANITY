<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../common/head.jsp"%>
<style>
.login-container {
	max-width: 400px;
	margin: 60px auto;
	padding: 2rem;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.icon-input {
	position: relative;
}

.icon-input .fa-user, .icon-input .lockicon {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
}

.icon-input .fa-eye, .icon-input .fa-eye-slash {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
}

.icon-input .fa-eye:hover {
	cursor: pointer;
}

.icon-input input {
	padding-left: 2.5rem;
}

.login-btn {
	width: 100%;
	background-color: #e0e0e0;
	border: none;
	color: #333;
}

.login-btn:hover {
	background-color: #ccc;
}

.small-link {
	font-size: 0.9rem;
	text-align: right;
	margin-top: 0.5rem;
}

.bottom-text {
	text-align: center;
	margin-top: 1.5rem;
	font-size: 0.9rem;
}

.join-form .valid-msg {
	visibility: hidden
}

.join-form .valid-msg.active {
	visibility: visible
}

.bottom-text a {
	font-weight: bold;
	text-decoration: none;
}

.bottom-text a:hover {
	text-decoration: underline;
}

body {
	background-color: #f8f9fa;
}
</style>



<%-- <link rel="stylesheet" href="${cp}/css/register.css"> --%>
</head>

<body>
	<div class="login-container">
		<div class="text-center mb-4">
			<h4>회원가입</h4>
		</div>

		<form class="join-form" action="${cp}/member/register" method="post">
			<div class="mb-3 icon-input">
				<i class="fa fa-user"></i> <input type="text" name="email"
					class="form-control" id="email" placeholder="이메일">
			</div>
			<p class="small text-center text-muted valid-msg my-2">올바른 형식의
				이메일을 입력해주세요</p>

			<div class="mb-3 icon-input my-0">
				<i class="fa fa-lock lockicon"></i> <input type="password"
					class="form-control" name="password" id="password"
					placeholder="비밀번호"> <i
					class="fa fa-eye pe-auto toggle-password small"></i>
			</div>
			<p class="small text-center text-muted valid-msg my-0">영문, 숫자,
				특수문자 조합 8자 이상 입력해주세요</p>

			<div class="mb-3 icon-input">
				<i class="fa fa-lock lockicon"></i> <input type="password"
					class="form-control" name="pwck" id="pwck" placeholder="비밀번호 확인">
				<i class="fa fa-eye pe-auto toggle-password"></i>
			</div>

			<p class="small text-center text-muted valid-msg my-2">입력한 비밀번호를
				확인해주세요</p>

			<div class="form-check ">
				<input class="form-check-input" type="checkbox" id="termsCheck">
				<label class="form-check-label small" for="termsCheck"> <a
					href="#">CLANITY 이용약관</a> 및 <a href="#">개인정보 보호 정책</a> 동의
				</label>
			</div>

			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="marketingCheck">
				<label class="form-check-label small" for="marketingCheck">
					<a href="#">맞춤 서비스 제안 등 마케팅 정보수신</a> 동의
				</label>
			</div>

			<button type="submit" class="btn login-btn">가입하기</button>

			<div class="bottom-text">
				이미 아이디가 있으신가요? <a href="${cp}/member/login">로그인하기</a>
			</div>
		</form>
	</div>
	
	    <%
    String toastMsg = (String) session.getAttribute("toastMsg");
    String toastColor = (String) session.getAttribute("toastColor");
    if (toastMsg != null) {
      session.removeAttribute("toastMsg");
      session.removeAttribute("toastColor");
  %>
    <script>
      iziToast.show({
        title: '알림',
        message: '<%= toastMsg %>',
        position: 'topCenter',
        timeout: 3000,
        color: '<%= toastColor != null ? toastColor : "blue" %>'
      });
    </script>
  <%
    }
  %>
	
	<script>
		$(function() {
			// 비밀번호 보기 토글 (복수 처리)
			$(".toggle-password")
					.on(
							"click",
							function() {
								const $input = $(this).siblings("input");
								const type = $input.attr("type") === "password" ? "text"
										: "password";
								$input.attr("type", type);
								$(this)
										.toggleClass(
												"fa-eye fa-eye-slash");
							});

			// 정규식 정의
			const regexps = {
				email : /^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$/,
				password : /^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z\d])[A-Za-z\d\S]{8,}$/
			};

			// 필드별 유효성 검사 함수
			function validate(value, regexp) {
				return regexp.test(value);
			}

			//검사함수
			function validateField($input) {
				const id = $input.attr("id");
				const value = $input.val();
				const $msg = $input.closest("div").next(".valid-msg");
				let isValid = true;

				if (id === "pwck") {
					isValid = value === $("#password").val();
				} else if (regexps[id]) {
					isValid = validate(value, regexps[id]);
				}

				$msg.toggleClass("active", !isValid); // 유효하지 않으면 보이게

				return isValid;
			}

			// 입력 중 유효성 실시간 검사
			$(".join-form input").on("input", function() {
				validateField($(this));
			});

			// 최종 제출 시 유효성 검사 한번 더
			$(".join-form").on("submit", function(e) {
				let isValid = true;

				$(".join-form input").each(function() {
					if (!validateField($(this)))
						isValid = false;
				});

				if (!isValid) {
					e.preventDefault();
					alert("입력값을 다시 확인해주세요.");
					return;
				}

				if (!$("#termsCheck").is(":checked")) {
					alert("CLANITY 이용약관에 동의해주세요.");
					isValid = false;
					return;
				}
				if (!$("#marketingCheck").is(":checked")) {
					alert("마케팅 정보수신에 동의해주세요.");
					isValid = false;
					return;
				}

			});
		});
	</script>
</body>

</html>