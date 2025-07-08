<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main class="d-flex" style="min-height: 100vh;">
		<!-- 왼쪽 고정 사이드바 -->
		<%@ include file="./mypageSidebar.jsp"%>
		<!-- 오른쪽 콘텐츠 영역 -->
		<div
			class="flex-grow-1 d-flex justify-content-center align-items-center"
			style="min-height: 90vh;">
			<div class="card shadow-sm" style="max-width: 500px; width: 100%;">
				<div class="card-body">
					<h5 class="card-title fw-bold mb-3">
						<i class="bi bi-person-x-fill me-2"></i>회원탈퇴
					</h5>
					<p class="mb-2">
						<strong> CLANITY</strong> 웹사이트에서 <strong>${member.nickname}</strong> 회원님의 계정이
						삭제됩니다.
					</p>
					<p class="text-danger small mb-4">* 탈퇴 요청시 10일의 유예기간이 주어지며, 이후는 지체없이 삭제됩니다.</p>
					<p class="text-danger small mb-4">* 이미 작성된 게시글과 댓글, 클래스의 활동이력은 자동으로 삭제되지않으니 주의해주세요</p>

					<form action="${cp}/mypage/deactivate" method="post">
						<!-- 비밀번호 입력 -->
						<div class="mb-3">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control is-invalid"
									id="password" name="password" required> <span
									class="input-group-text bg-white border-start-0"><i
									class="bi bi-lock"></i></span>
								<div class="invalid-feedback">잘못 입력했습니다. 비밀번호를 다시 입력해주세요.
								</div>
							</div>
						</div>

						<!-- 유의사항 동의 -->
						<div class="form-check mb-4">
							<input class="form-check-input" type="checkbox" id="agree"
								required> <label class="form-check-label" for="agree">
								유의사항을 동의합니다. <strong class="text-danger">${member.nickname}</strong> 계정이
								삭제됩니다.
							</label>
						</div>

						<!-- 버튼 영역 -->
						<div class="d-flex justify-content-between">
							<a href="${cp}/mypage" class="btn btn-secondary">돌아가기</a>
							<button type="submit" class="btn btn-danger">탈퇴하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</main>
</body>
<%@ include file="../common/footer.jsp"%>
</html>