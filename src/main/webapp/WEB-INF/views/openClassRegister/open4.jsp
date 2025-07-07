<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
<style>
.image-preview {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	background-color: #f0f0f0;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main class="flex-fill py-5">
		<div class="container" style="max-width: 800px;">
			<form action="${cp}/openClassRegister/open4" method="post"
				enctype="multipart/form-data">
				<div class="mb-4">
					<h5 class="fw-bold text-secondary">STEP.2 클래스 소개</h5>
					<h3 class="fw-bold" style="color: #E63946;">강사 소개</h3>
					<p class="text-muted">호스트님을 소개해주세요</p>
				</div>

				<!-- 강사 사진 업로드 -->
				<div class="mb-4">
					<label class="form-label fw-semibold">강사님 사진 <span
						class="text-danger">(필수)</span></label>
					<div class="d-flex align-items-center mb-2">
						<img id="preview" src="https://placehold.co/200x200"
							class="image-preview me-3" alt="강사 사진 미리보기"> <input
							type="text" class="form-control" name="instructorImageUrl"
							placeholder="테스트용" oninput="previewImageLink(this)"> 테스트용
					</div>
					<input type="file" class="form-control" name="instructorImageUrl2"
						accept="image/*" onchange="previewImage(event)">
				</div>

				<!-- 닉네임 입력 -->
				<div class="mb-4">
					<label for="instructorName"  class="form-label fw-semibold">상호명
						또는 닉네임 <span class="text-danger">(필수)</span>
					</label> <input type="text" id="instructorName" class="form-control"name="instructorName"
						maxlength="15" placeholder="닉네임을 입력해주세요">
					<div class="text-end small text-muted mt-1">
						<span id="instructorName">0</span> / 15
					</div>
				</div>

				<!-- 소개글 입력 -->
				<div class="mb-4">
					<label for="hostIntroduction" class="form-label fw-semibold">강사님
						소개 <span class="text-danger">(필수)</span>
					</label>
					<textarea id="hostIntroduction" name="hostIntroduction" class="form-control" rows="5"
						maxlength="600" placeholder="소개글을 작성해주세요 최소 40자 이상"></textarea>
					<div class="text-end small text-muted mt-1">
					</div>
				</div>

				<!-- 하단 버튼 -->
				<div class="d-flex justify-content-between mt-5">
					<a href="${cp}/openClassRegister/open3"
						class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
			</form>

			<script>
				function previewImageLink(input) {
					const preview = document.getElementById("preview");
					preview.src = input.value;
				}
			</script>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>