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

.input-invalid {
	border: 1px solid var(--bs-danger) !important; /* 붉은색 */
	background-color: #fff;
	box-shadow: none;
}

.input-valid {
	border: 1px solid var(--bs-success) !important; /* 녹색 */
	background-color: #fff;
	box-shadow: none;
}

/* 메시지는 Bootstrap5 문법 따름 */
.valid-msg {
	font-size: 0.875rem;
	margin-top: 0.25rem;
	visibility: hidden;
}

.valid-msg.active {
	display: block;
}

.valid-msg.invalid {
	color: var(--bs-danger); /* Bootstrap 빨강 */
}

.valid-msg.valid {
	color: var(--bs-success); /* Bootstrap 초록 */
}

/* input-focus 색상도 조정하고 싶을 경우 */
.input-invalid:focus {
	border-color: var(--bs-danger);
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
}

.input-valid:focus {
	border-color: var(--bs-success);
	outline: 0;
	box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
}

/* 비활성화된 버튼도 버튼처럼 보이도록 */
.login-btn:disabled {
	background-color: #f8f9fa;       /* 연한 회색 배경 */
	border: 1px solid #ced4da;       /* 회색 테두리 */
	color: #6c757d;                  /* 중간 회색 텍스트 */
	cursor: not-allowed;             /* 클릭 불가 커서 */
	box-shadow: none;
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

			<div class="mb-2 icon-input">
				<i class="fa fa-user"></i> <input type="text" name="email"
					class="form-control" id="email" placeholder="이메일">
			</div>
			<div class="small text-center text-muted valid-msg mb-3">올바른 형식의
				이메일을 입력해주세요</div>


			<div class="mb-2 icon-input my-0">
				<i class="fa fa-lock lockicon"></i>
					<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
				<i class="fa fa-eye pe-auto toggle-password"></i>
			</div>
			<div class="small text-center text-muted valid-msg mb-3">영문, 숫자,
				특수문자 조합 8자 이상 입력해주세요</div>

			<div class="mb-2 icon-input">
				<i class="fa fa-lock lockicon"></i>
					<input type="password" class="form-control" name="pwck" id="pwck" placeholder="비밀번호 확인">
				<i class="fa fa-eye pe-auto toggle-password"></i>
			</div>
			<div class="small text-center text-muted valid-msg mb-3">입력한 비밀번호를
				확인해주세요</div>

			<!-- 체크박스 그룹 -->
			<div class="form-check-group mb-4">
				<div class="form-check">
					<input class="form-check-input agree-check" type="checkbox" id="termsCheck">
					<label class="form-check-label small" for="termsCheck">
						<a href="#">CLANITY 이용약관</a> 및 <a href="#">개인정보 보호 정책</a> 동의
					</label>
				</div>

				<div class="form-check mt-2">
					<input class="form-check-input agree-check" type="checkbox" id="marketingCheck">
					<label class="form-check-label small" for="marketingCheck">
						<a href="#">맞춤 서비스 제안 등 마케팅 정보수신</a> 동의
					</label>
				</div>
			</div>

			<!-- 가입 버튼 -->
			<button type="submit" class="btn login-btn" id="submitBtn" disabled>가입하기</button>

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

			// 메시지 정의
			const messages = {
				email: {
					invalid: "올바른 이메일을 입력해주세요.",
					valid: "사용 가능한 이메일 형식입니다."
				},
				password: {
					invalid: "영문, 숫자, 특수문자 조합 8자 이상 입력해주세요.",
					valid: "사용 가능한 비밀번호입니다."
				},
				pwck: {
					invalid: "입력한 비밀번호를 확인해주세요.",
					valid: "비밀번호가 일치합니다."
				}
			};

			// 필드별 유효성 검사 함수
			function validate(value, regexp) {
				return regexp.test(value);
			}

			// 유효성 검사 적용 함수
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

				$input.removeClass("input-valid input-invalid");
				$msg.removeClass("valid invalid");

				if (!isValid) {
					$input.addClass("input-invalid");
					$msg.text(messages[id]?.invalid || "값을 확인해주세요.")
							.addClass("active invalid")
							.removeClass("valid");
				} else {
					$input.addClass("input-valid");
					$msg.text(messages[id]?.valid || "").addClass("active valid")
							.removeClass("invalid");
				}

				return isValid;
			}

			// 입력 중 유효성 실시간 검사
			$(".join-form input").on("input", function() {
				validateField($(this));
			});

			//이메일 유효성 검증 체크

			let emailCheckTimer = null;
			let lastEmailChecked = '';

			$('#email').on('input', function () {
				const $input = $(this);
				const value = $input.val();
				const $msg = $input.closest("div").next('.valid-msg');

				// 유효성 검사 먼저
				if (!regexps.email.test(value)) {
					clearTimeout(emailCheckTimer);
					$input.removeClass('input-valid input-invalid');
					$msg.text("올바른 이메일 형식을 입력해주세요.")
							.removeClass("valid").addClass("active invalid");
					return;
				}

				// 검사 중 표시
				$input.removeClass('input-valid input-invalid');
				$msg.text("중복 여부 확인 중...").removeClass("valid invalid").addClass("active");

				// 디바운스 처리
				clearTimeout(emailCheckTimer);
				emailCheckTimer = setTimeout(function () {
					// 이전 값과 중복 검사 최소화
					if (value === lastEmailChecked) return;
					lastEmailChecked = value;

					// AJAX 요청
					$.ajax({
						url: '${cp}/member/check-email', // URL은 실제 경로에 맞게 수정
						type: 'POST',
						contentType: 'application/json',
						data: JSON.stringify({ email: value }),
						dataType: 'json',
						success: function (res) {
							if (res.available) {
								$input.removeClass('input-invalid').addClass('input-valid');
								$msg.text("사용 가능한 이메일입니다.")
										.removeClass("invalid").addClass("valid active");
							} else {
								$input.removeClass('input-valid').addClass('input-invalid');
								$msg.text("이미 사용 중인 이메일입니다.")
										.removeClass("valid").addClass("invalid active");
							}
						},
						error: function () {
							$input.removeClass('input-valid').addClass('input-invalid');
							$msg.text("이메일 확인 중 오류가 발생했습니다.")
									.removeClass("valid").addClass("invalid active");
						}
					});
				}, 600); // 600ms 디바운스
			});




			// 체크박스에 따라 가입 버튼 활성/비활성
			function submitButtonState() {
				const allChecked = $('.agree-check').length === $('.agree-check:checked').length;
				$('#submitBtn').prop('disabled', !allChecked);
			}
			$('.agree-check').on('change', submitButtonState);
			submitButtonState(); // 초기 실행

			// 폼 제출 전 최종 유효성 확인
			$(".join-form").on("submit", function (e) {
				let isValid = true;

				$(".join-form input").each(function () {
					if (!validateField($(this))) {
						isValid = false;
					}
				});

				if (!isValid) {
					e.preventDefault();
					alert("입력값을 다시 확인해주세요.");
					return;
				}

				if (!$("#termsCheck").is(":checked")) {
					e.preventDefault();
					alert("CLANITY 이용약관에 동의해주세요.");
					return;
				}
				if (!$("#marketingCheck").is(":checked")) {
					e.preventDefault();
					alert("마케팅 정보수신에 동의해주세요.");
					return;
				}
			});
		});
	</script>
</body>

</html>