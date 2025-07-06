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
      <h3 class="fw-bold" style="color: #E63946;">상세 내용</h3>
      <p class="text-muted">상세 내용을 작성해주세요</p>
    </div>

    <!-- 클래스 상세 내용 -->
    <div class="mb-4">
      <label for="description" class="form-label fw-semibold">클래스 상세 내용 <span class="text-danger">(필수)</span></label>
      <textarea id="description" class="form-control" rows="10" placeholder="강사의 클래스를 최소 5줄 이상 자세하게 설명해 주세요
복사하기 + 붙여넣기의 경우 내용이 올라가게 보이지 않을 수 있어요
원하시면 이미지나 영상 링크를 추가하실 수 있어요" required></textarea>
      <div class="text-end small text-muted mt-1">최소 40자 이상</div>
    </div>

    <!-- 추천 대상 입력 -->
    <div class="mb-4">
      <label for="recommendation" class="form-label fw-semibold">이런 분들이 들으면 좋아요 <span class="text-muted">(선택/최대 10개)</span></label>
      <input type="text" id="recommendation" class="form-control" maxlength="50" placeholder="클래스를 추천해드리고 싶은 분을 적어주세요.">
      <div class="text-end small text-muted mt-1">0 / 50</div>
      <button class="btn btn-outline-secondary mt-2">+ 추가</button>
    </div>

    <!-- 하단 버튼 -->
    <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/openClassRegister/open2" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/open4" class="btn text-white px-4" style="background-color: #E63946;">다음</a>
    </div>

  </div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>