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
					<input type="radio" class="btn-check" name="level" id="beginner"
						autocomplete="off"> <label
						class="btn btn-outline-secondary" for="beginner">입문</label> <input
						type="radio" class="btn-check" name="level" id="intermediate"
						autocomplete="off"> <label
						class="btn btn-outline-secondary" for="intermediate">중급</label> <input
						type="radio" class="btn-check" name="level" id="advanced"
						autocomplete="off"> <label
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
				<textarea class="form-control" id="curriculum" name="curriculum"
					rows="6" maxlength="600"
					placeholder="커리큘럼을 자유롭게 작성해 주세요&#10;최소 40자 이상"></textarea>
				<div class="text-end text-muted small mt-1">
					<span id="curriculumCount">0</span> / 600
				</div>
			</div>

			<!-- 하단 버튼 -->
			 <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/openClassRegister/open3" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/open5" class="btn text-white px-4" style="background-color: #E63946;">다음</a>
    </div>
    

		</div>
	</main>
	<script>
  const textarea = document.getElementById("curriculum");
  const counter = document.getElementById("curriculumCount");

  textarea.addEventListener("input", () => {
    counter.textContent = textarea.value.length;
  });
</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
