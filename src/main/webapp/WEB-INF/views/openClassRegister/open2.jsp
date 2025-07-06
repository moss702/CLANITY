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
		<h1>open2.jsp</h1>
		<p>나중에 질문하기 (카테고리 아이디만 안넘어감)</p>
		<p>넘어온 categoryId: ${param.categoryId}</p>
		<div class="container" style="max-width: 800px;">

			<!-- STEP 표시 -->
			<div class="mb-4">
				<h5 class="fw-bold text-secondary">STEP.1 클래스 소개</h5>
				<h3 class="fw-bold" style="color: #E63946;">이미지</h3>
				<p class="text-muted">클래스를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요</p>
			</div>
			
			<form action="${cp}/openClassRegister/open2" method="post"
				enctype="multipart/form-data">
				<!-- 대표 이미지 등록 (링크 입력용) -->
				<p>넘어가는 것 확인</p>
				<div class="mb-5">
					<label class="form-label fw-semibold">대표 이미지 링크 <span
						class="text-danger">(필수)</span></label> <input type="text"
						id="thumbnailImages" name="thumbnailImages"
						class="form-control mb-2" placeholder="대표 이미지 URL 입력"
						oninput="previewThumbnail(this.value)">
					<div class="text-center">
						<img id="thumbnailPreview" src="" class="img-fluid rounded border"
							style="max-height: 300px; display: none;">
					</div>
				</div>

				<!-- 클래스 이미지 링크 입력 (콤마로 구분) -->
				<div class="mb-5">
					<label class="form-label fw-semibold">클래스 이미지 링크들 <span
						class="text-muted small">(선택/최대 8개, 쉼표로 구분)</span></label>
					<textarea id="detailImages" name="detailImages" rows="3"
						class="form-control" placeholder="상세 이미지 URL 입력 (여러 개는 ,로 구분)"
						oninput="previewDetails(this.value)"></textarea>

					<div id="classImagesPreview"
						class="row row-cols-2 row-cols-md-4 g-2 mt-3"></div>
				</div>

				<div class="mb-5">
					<label class="form-label fw-semibold">대표 이미지 <span
						class="text-danger">(필수)</span></label>
					<div class="d-flex justify-content-center">
						<label for="thumbnailImage"
							class="d-flex flex-column align-items-center justify-content-center text-center border border-2 border-secondary rounded p-3 mb-2"
							style="width: 500px; height: 300px; border-style: dashed; cursor: pointer; position: relative;">

							<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
							class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
								후 이미지를 추가해 주세요</span> <input type="file" id="thumbnailImage"
							name="thumbnailImage" accept="image/*" hidden> <img
							id="thumbnailPreview"
							class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover rounded"
							style="display: none; object-fit: cover; z-index: 2;" />
						</label>
					</div>

					<ul class="text-muted small list-unstyled mt-2 text-center">
						<li>• 용량은 3MB 이하로 사용해 주세요</li>
						<li>• 이미지 사이즈는 500px × 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수
							있어요)</li>
					</ul>
				</div>

				<!-- 클래스 이미지 등록 -->
				<div class="mb-5">
					<label class="form-label fw-semibold">클래스 이미지 <span
						class="text-muted small">(선택/최대 8개 등록 가능)</span></label>
					<div class="d-flex justify-content-center">
						<label for="classImages"
							class="d-flex flex-column align-items-center justify-content-center text-center border border-2 border-secondary rounded p-3 mb-2"
							style="width: 500px; height: 300px; border-style: dashed; cursor: pointer; position: relative;">
							<i class="fa-solid fa-image fa-2x mb-3 text-muted"></i> <strong
							class="mb-2">이미지 추가하기</strong> <span class="text-muted small">클릭
								후 이미지를 추가해 주세요</span> <input type="file" id="classImages"
							name="classImages" accept="image/*" multiple hidden>
						</label>
					</div>

					<!-- 미리보기 썸네일 영역 -->
					<div id="classImagesPreview"
						class="row row-cols-2 row-cols-md-4 g-2 mt-3"></div>

					<div class="form-text text-center">• 클래스/모임 이미지가 많을수록 클래스/모임을
						신청할 확률이 올라가요</div>
				</div>

				<!-- 하단 버튼 -->
				<div class="d-flex justify-content-between mt-5">
					<a href="${cp}/openClassRegister/open1"
						class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
			</form>
		</div>
	</main>

	<%@ include file="../common/footer.jsp"%>

	<script>
document.addEventListener("DOMContentLoaded", function () {
  const thumbInput = document.getElementById('thumbnailImage');
  const thumbPreview = document.getElementById('thumbnailPreview');

  // 대표 이미지 미리보기
  thumbInput.addEventListener('change', function () {
    const file = this.files[0];
    if (file && file.type.startsWith("image/")) {
      const reader = new FileReader();
      reader.onload = e => {
        thumbPreview.src = e.target.result;
        thumbPreview.style.display = "block";
      };
      reader.readAsDataURL(file);
    }
  });

  const classInput = document.getElementById('classImages');
  const classPreviewContainer = document.getElementById('classImagesPreview');
  let selectedClassImages = [];

  // 클래스 이미지 미리보기 + 삭제 기능
  classInput.addEventListener('change', function () {
    selectedClassImages = Array.from(this.files).slice(0, 8);
    renderClassPreviews();
  });

  function renderClassPreviews() {
    classPreviewContainer.innerHTML = "";
    selectedClassImages.forEach((file, index) => {
      if (file.type.startsWith("image/")) {
        const reader = new FileReader();
        reader.onload = e => {
          const col = document.createElement("div");
          col.className = "col position-relative";

          col.innerHTML = `
            <button type="button" class="btn-close position-absolute top-0 end-0 bg-white border rounded-circle p-1" aria-label="Remove" style="z-index: 2;" data-index="${index}"></button>
            <img src="${e.target.result}" class="img-fluid rounded border" style="height: 100px; object-fit: cover;" />
          `;
          classPreviewContainer.appendChild(col);
        };
        reader.readAsDataURL(file);
      }
    });
  }

  // 삭제 버튼 처리
  classPreviewContainer.addEventListener('click', function (e) {
    if (e.target.classList.contains('btn-close')) {
      const index = parseInt(e.target.dataset.index, 10);
      selectedClassImages.splice(index, 1);
      renderClassPreviews();
    }
  });
});
function previewThumbnail(url) {
	  const preview = document.getElementById("thumbnailPreview");
	  if (url.trim()) {
	    preview.src = url;
	    preview.style.display = "block";
	  } else {
	    preview.style.display = "none";
	  }
	}

	function previewDetails(text) {
	  const container = document.getElementById("classImagesPreview");
	  container.innerHTML = "";
	  const urls = text.split(",").map(s => s.trim()).filter(s => s);

	  urls.slice(0, 8).forEach(url => {
	    const col = document.createElement("div");
	    col.className = "col";
	    col.innerHTML = `<img src="${url}" class="img-fluid rounded border" style="height: 100px; object-fit: cover;" />`;
	    container.appendChild(col);
	  });
	}
</script>

</body>
</html>
