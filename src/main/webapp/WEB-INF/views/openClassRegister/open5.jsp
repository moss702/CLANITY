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
    <div class="mb-4">
      <h5 class="fw-bold text-secondary">STEP.2 클래스 소개</h5>
      <h3 class="fw-bold" style="color: #E63946;">강사 소개</h3>
      <p class="text-muted">호스트님을 소개해주세요</p>
    </div>

    <form method="post" enctype="multipart/form-data">
      <!-- 강사 사진 업로드 -->
      <div class="mb-4">
        <label class="form-label fw-semibold">강사님 사진 <span class="text-danger">(필수)</span></label>
        <div class="d-flex align-items-center mb-2">
          <img id="preview" src="https://placehold.co/200x200"  class="image-preview me-3" alt="강사 사진 미리보기">
          <input type="file" class="form-control" name="instructorImage" accept="image/*" onchange="previewImage(event)">
        </div>
      </div>

      <!-- 닉네임 입력 -->
      <div class="mb-4">
        <label for="nickname" class="form-label fw-semibold">상호명 또는 닉네임 <span class="text-danger">(필수)</span></label>
        <input type="text" id="nickname" class="form-control" maxlength="15" placeholder="닉네임을 입력해주세요">
        <div class="text-end small text-muted mt-1"><span id="nickCount">0</span> / 15</div>
      </div>

      <!-- 소개글 입력 -->
      <div class="mb-4">
        <label for="description" class="form-label fw-semibold">강사님 소개 <span class="text-danger">(필수)</span></label>
        <textarea id="description" class="form-control" rows="5" maxlength="600" placeholder="소개글을 작성해주세요\n최소 40자 이상"></textarea>
        <div class="text-end small text-muted mt-1"><span id="descCount">0</span> / 600</div>
      </div>

      <!-- 하단 버튼 -->
     <!-- 하단 버튼 -->
			 <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/openClassRegister/open4" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/open6" class="btn text-white px-4" style="background-color: #E63946;">다음</a>
    </div>
    </form>

    <script>
      function previewImage(event) {
        const preview = document.getElementById("preview");
        preview.src = URL.createObjectURL(event.target.files[0]);
      }

      const nickname = document.getElementById("nickname");
      const description = document.getElementById("description");

      nickname.addEventListener("input", () => {
        document.getElementById("nickCount").textContent = nickname.value.length;
      });

      description.addEventListener("input", () => {
        document.getElementById("descCount").textContent = description.value.length;
      });
    </script>
  </div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>