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
      <h5 class="fw-bold text-secondary">STEP.3 금액 및 일정</h5>
      <h3 class="fw-bold" style="color: #E63946;">클래스 금액 및 예약 방식</h3>
      <p class="text-muted">클래스 수강료 및 결제 방식을 설정해주세요</p>
    </div>

<form action="">
  <!-- 금액 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">1인 수강 금액</label>
    <div class="input-group">
      <input type="number" id="price" class="form-control" placeholder="예: 30000">
      <span class="input-group-text">원</span>
    </div>
  </div>

  <!-- 할인 비율 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">할인 비율</label>
    <div class="input-group">
      <input type="number" id="discountRate" class="form-control" placeholder="예: 10">
      <span class="input-group-text">%</span>
    </div>
  </div>

 <!--  <!-- 할인 금액 직접 입력 -->
  <!-- <div class="mb-3">
    <label class="form-label fw-semibold">할인된 금액</label>
    <div class="input-group">
      <input type="number" id="discountPrice" class="form-control" placeholder="자동 계산 or 직접 입력">
      <span class="input-group-text">원</span>
    </div>
  </div> --> 

  <!-- 정산 결과 -->
  <div class="bg-light p-3 rounded text-secondary">
    <strong>최종 결제 금액:</strong> <span id="finalPrice">0</span> 원
  </div>

  <hr>

  <!-- 인원 설정 -->
  <div class="mb-3 d-flex gap-2">
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최소 인원</label>
      <input type="number" class="form-control" placeholder="예: 2">
    </div>
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최대 인원</label>
      <input type="number" class="form-control" placeholder="예: 10">
    </div>
  </div>

  <!-- 당일 예약 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">당일 예약 가능 여부</label>
    <div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sameDay" id="available" checked>
        <label class="form-check-label" for="available">가능해요</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sameDay" id="notAvailable">
        <label class="form-check-label" for="notAvailable">불가능해요</label>
      </div>
    </div>
  </div>

      <!-- 버튼 -->
       <div class="d-flex justify-content-between mt-5">
      <a href="${cp}/openClassRegister/open5" class="btn btn-outline-secondary px-4">이전</a>
      <a href="${cp}/openClassRegister/successRegister" class="btn text-white px-4" style="background-color: #E63946;">등록하기</a>
    </div>
    </form>

  

<!-- JS 로직 -->
<script>
  const priceInput = document.getElementById('price');
  const discountRateInput = document.getElementById('discountRate');
  const discountPriceInput = document.getElementById('discountPrice');
  const finalPriceSpan = document.getElementById('finalPrice');

  function updateFinalPrice() {
    const price = parseInt(priceInput.value) || 0;
    const rate = parseFloat(discountRateInput.value) || 0;
    const discountPrice = parseInt(discountPriceInput.value) || 0;

    // 할인율이 있으면 할인 금액 계산
    if (rate > 0) {
      const calc = Math.floor(price * (1 - rate / 100));
      discountPriceInput.value = price - calc;
      finalPriceSpan.textContent = calc;
    }
    // 할인 금액이 있으면 할인율 계산
    else if (discountPrice > 0 && price > 0) {
      const rateCalc = Math.floor((discountPrice / price) * 100);
      discountRateInput.value = rateCalc;
      finalPriceSpan.textContent = price - discountPrice;
    } else {
      finalPriceSpan.textContent = price;
    }
  }

  priceInput.addEventListener('input', updateFinalPrice);
  discountRateInput.addEventListener('input', updateFinalPrice);
  discountPriceInput.addEventListener('input', updateFinalPrice);
</script>


   

  </div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
