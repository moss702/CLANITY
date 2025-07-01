<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>클래니티 결제 모듈</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

  <div class="container bg-white shadow-sm rounded-4 p-3" style="max-width: 500px; margin-top: 2rem;">
    
    <!-- 결제 헤더 -->
    <div class="border-bottom pb-3 mb-3">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <div class="fw-semibold" style="font-size: 16px;">홍대/연남초보자도 고퀄리티 그림 완성</div>
          <small class="text-muted">별도 제공기간 없음</small>
        </div>
        <div class="fw-bold" style="color: #E63946; font-size: 20px;">30,000원</div>
      </div>
    </div>

    <!-- 카드 선택 -->
    <div class="border-bottom pb-3 mb-3">
      <div class="fw-bold mb-2">결제하실 카드를 선택해 주세요.</div>
      <div class="row g-2">
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">롯데</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">KB Pay</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">삼성</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">하나</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">신한</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">BC</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">현대</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">농협</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">우리</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">카카오</div></div>
        <div class="col-4"><div class="border rounded text-center py-2 small text-secondary" style="cursor: pointer;">토스</div></div>
      </div>
    </div>

    <!-- 할부 선택 -->
    <div class="border-bottom pb-3 mb-3">
      <div class="fw-semibold mb-2">일시불 또는 할부</div>
      <select class="form-select form-select-sm">
        <option selected>일시불</option>
        <option>2개월 할부</option>
        <option>3개월 할부</option>
        <option>6개월 할부</option>
      </select>
      <div class="form-text mt-2 small text-muted">* 법인/체크/기프트/은행계열카드 무이자 제외</div>
    </div>

    <!-- 다음 버튼 -->
    <div class="pt-2">
    <a href="${pageContext.request.contextPath}/paymentInfoConfirmation" class="text-decoration-none text-dark">
      <button type="button" class="btn text-white fw-bold w-100 py-2 rounded-3" style="background-color: #E63946;">
        다음
      </button>
      </a>
    </div>

  </div>

</body>
</html>

