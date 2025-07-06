<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main class="flex-fill py-5">
		<div class="container" style="max-width: 800px;">

			<!-- STEP 표시 -->
			<div class="mb-4">
				<h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
				<h3 class="fw-bold" style="color: #E63946;">이미지</h3>
				<p class="text-muted">클래스를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요</p>
			</div>

			<!-- 대표 이미지 등록 -->
			<div class="mb-5">
				<label class="form-label fw-semibold">대표 이미지 <span
					class="text-danger">(필수)</span></label>
				<div
					class="border border-2 rounded d-flex flex-column align-items-center justify-content-center text-center p-5 mb-2"
					style="height: 300px; border-style: dashed;">
					<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
						class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
						후 이미지를 추가해 주세요</span>
				</div>
				<ul class="text-muted small list-unstyled">
					<li>• 용량은 3MB 이하로 사용해 주세요</li>
					<li>• 이미지 사이즈는 750px × 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수
						있어요)</li>
				</ul>
			</div>

			<!-- 클래스 이미지 등록 -->
			<div class="mb-5">
				<label class="form-label fw-semibold">클래스 이미지 <span
					class="text-muted small">(선택/최대 8개 등록 가능)</span></label>
				<div
					class="border border-2 rounded d-flex flex-column align-items-center justify-content-center text-center p-5 mb-2"
					style="height: 250px; border-style: dashed;">
					<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
						class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
						후 이미지를 추가해 주세요</span>
				</div>
				<div class="form-text">• 클래스/모임 이미지가 많을수록 클래스/모임을 신청할 확률이 올라가요</div>
			</div>

			<!-- 하단 버튼 -->
			 <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/openClassRegister/open1" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/open3" class="btn text-white px-4" style="background-color: #E63946;">다음</a>
    </div>

		</div>
	</main>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
