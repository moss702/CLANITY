<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>클래니티 결제</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

  <div class="container my-5">
    <div class="mx-auto bg-white rounded-4 shadow-sm overflow-hidden" style="max-width: 500px;">
      
 
      <!-- [2] 결제 정보 확인 -->
      <div class="border-bottom p-3">
        <div class="fw-bold mb-3">📩 결제 정보를 확인해 주세요.</div>
        <div class="mb-3">
          <label class="form-label fw-semibold">결제카드</label>
          <input type="text" class="form-control bg-light" value="카카오뱅크" disabled />
        </div>
        <div class="mb-3">
          <label class="form-label fw-semibold">할부개월</label>
          <input type="text" class="form-control bg-light" value="일시불" disabled />
        </div>
        <div class="mb-3">
          <label class="form-label fw-semibold">이메일</label>
          <input type="email" class="form-control" value="kysy0000@naver.com" />
        </div>
        <div class="form-check mb-2">
          <input class="form-check-input" type="checkbox" id="confirmCheck">
          <label class="form-check-label small" for="confirmCheck">
            결제 정보를 모두 확인했습니다.
          </label>
        </div>
          <a href="${pageContext.request.contextPath}/sucessPayment" class="text-decoration-none text-dark">
        <div class="text-white text-center fw-bold py-2 rounded-3" style="background-color: #E63946;">
          30,000원 결제
        </div></a>
      </div>

     

    </div>
  </div>

</body>
</html>

 