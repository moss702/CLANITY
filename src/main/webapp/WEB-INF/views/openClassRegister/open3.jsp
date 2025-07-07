<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="qna_style.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main class="flex-fill py-5">
		<div class="container" style="max-width: 800px;">

			<form action="${cp}/openClassRegister/open3" method="post"
				enctype="multipart/form-data">
				<div class="mb-4">
					<h5 class="fw-bold text-secondary">STEP.2 클래스 소개</h5>
					<h3 class="fw-bold" style="color: #E63946;">
						커리큘럼 <span class="text-danger">(필수)</span>
					</h3>
				</div>

				<!-- 커리큘럼 작성 방식 선택 -->
				<div class="mb-4">

					<div class="form-text mt-2">* 커리큘럼을 자유롭게 작성해 주세요</div>
				</div>

				<!-- 난이도 -->
				<div class="mb-4">
					<label class="form-label fw-bold">난이도</label>
					<div class="btn-group w-100" role="group">
						<input type="radio" class="btn-check" name="difficulty"
							id="beginner" value="입문" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="beginner">입문</label> <input
							type="radio" class="btn-check" name="difficulty"
							id="intermediate" value="중급" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="intermediate">중급</label> <input
							type="radio" class="btn-check" name="difficulty" id="advanced"
							value="고급" autocomplete="off"> <label
							class="btn btn-outline-secondary" for="advanced">고급</label>
					</div>
				</div>

				<!-- 소요시간 -->
				<div class="mb-4">
					<label for="duration" class="form-label fw-bold">소요시간</label> <input
						type="text" class="form-control" id="duration" name="duration"
						placeholder="소요 시간/기간을 입력 해주세요">
				</div>

				<!-- 커리큘럼 텍스트 -->
				<div class="mb-4">
					<label for="curriculum" class="form-label fw-bold">커리큘럼</label>
					<textarea class="form-control " id="curriculum" name="curriculum"
						rows="6" maxlength="600"
						placeholder="커리큘럼을 자유롭게 작성해 주세요&#10;최소 40자 이상"></textarea>
					<div class="text-end text-muted small mt-1">
						<span id="curriculumCount">0</span> / 600
					</div>
				</div>


				<!-- 클래스 상세 내용 -->
				<div class="mb-4">
					<label for="description" class="form-label fw-semibold">클래스
						상세 내용 <span class="text-danger">(필수)</span>
					</label>
					<textarea id="description"  name="description" class="form-control" rows="10"
						placeholder="강사의 클래스를 최소 5줄 이상 자세하게 설명해 주세요
복사하기 + 붙여넣기의 경우 내용이 올라가게 보이지 않을 수 있어요
원하시면 이미지나 영상 링크를 추가하실 수 있어요"
						required></textarea>
					<div class="text-end small text-muted mt-1">최소 40자 이상</div>
				</div>
				<!-- 추천 대상 -->
				<div class="mb-4">
					<label for="description2" class="form-label fw-bold">이런 분들이
						들으면 좋아요!</label>
					<textarea class="form-control" id="description2"
						name="description2" rows="6" maxlength="600"
						placeholder="자유롭게 작성해 주세요"></textarea>
					<div class="text-end text-muted small mt-1">
						<span id="description2Count">0</span> / 600
					</div>
				</div>

				
			<!-- 하단 버튼 -->
			<div class="d-flex justify-content-between mt-5">
				<a href="${cp}/openClassRegister/open2" class="btn btn-outline-secondary px-4">이전</a>
				<button type="submit" class="btn text-white px-4" style="background-color: #E63946;">다음</button>
			</div>
		</form>
	</div>

	</main>
	<%@ include file="../common/footer.jsp"%>
	<script>
		// 글자수 세기
		document
				.getElementById("curriculum")
				.addEventListener(
						"input",
						function() {
							document.getElementById("curriculumCount").textContent = this.value.length;
						});

		document
				.getElementById("description2")
				.addEventListener(
						"input",
						function() {
							document.getElementById("description2Count").textContent = this.value.length;
						});
	</script>
</body>
</html>