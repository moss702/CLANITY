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

<form action="${cp}/openClassRegister/open5" method="post" enctype="multipart/form-data">
  <!-- 금액 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">1인 수강 금액</label>
    <div class="input-group">
      <input type="number" id="price" name="price"  class="form-control" placeholder="예: 30000">
      <span class="input-group-text">원</span>
    </div>
  </div>

  <!-- 할인 비율 입력 -->
  <div class="mb-3">
    <label class="form-label fw-semibold">할인 비율</label>
    <div class="input-group">
      <input type="number" id="discount" name="discount" class="form-control" placeholder="예: 10">
      <span class="input-group-text">%</span>
    </div>
  </div>

 <!--  <!-- 할인 금액 직접 입력 -->
   <div class="mb-3">
    <label class="form-label fw-semibold">할인된 금액</label>
    <div class="input-group">
      <input type="number" id="discountPrice" name="discountPrice" class="form-control" placeholder="자동 계산 or 직접 입력">
      <span class="input-group-text">원</span>
    </div>
  </div> 

 

  <hr>

  <!-- 인원 설정 -->
  <div class="mb-3 d-flex gap-2">
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최소 인원</label>
      <input type="number" name="minParticipants" class="form-control" placeholder="예: 2">
    </div>
    <div class="flex-grow-1">
      <label class="form-label fw-semibold">최대 인원</label>
      <input type="number" name="maxParticipants" class="form-control" placeholder="예: 10">
    </div>
  </div>
      <!-- 버튼 -->
       <div class="d-flex justify-content-between mt-5">
					<a href="${cp}/openClassRegister/open4"
						class="btn btn-outline-secondary px-4">이전</a>
					<button type="submit" class="btn text-white px-4"
						style="background-color: #E63946;">다음</button>
				</div>
    </form>

  

<!-- JS 로직 나중에 확인하고 계산기 돌리기 적용 안됨-->


   

  </div>
</main>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
